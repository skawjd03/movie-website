package kr.coo.civ.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.coo.civ.mapper.PaymentMapper;
import kr.coo.civ.util.DBSeatData;
import kr.coo.civ.util.imp.PaymentCheck;
import kr.coo.civ.vo.MovieVO;
import kr.coo.civ.vo.PaymentVO;
import kr.coo.civ.vo.ScheduleVO;
import kr.coo.civ.vo.domain.MovieQueryType;
import kr.coo.civ.vo.domain.ShowPaymentInfo;
import kr.coo.civ.vo.dto.PaymentWithMovieDTO;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class PaymentServiceImpl implements PaymentService{

	private PaymentMapper mapper;

	@Override
	public List<MovieVO> getMovieList(MovieQueryType type) {
		List<MovieVO> movieList = mapper.selectMovie(type);
		return movieList;
	}

	@Override
	public List<ShowPaymentInfo> getScheduleList(MovieQueryType type) {
		List<ShowPaymentInfo> scheList = mapper.selectSchedule(type);
		return scheList;
	}

	@Override
	public ShowPaymentInfo getSeatInfo(int scheduleNo) {
		return mapper.selectScheduleSeat(scheduleNo);
	}

	@Override
	public boolean getCheckSeat(int scheduleCode, String checkSeat) {
		String[] dbSeat = mapper.selectSeat(scheduleCode).split(",");
		String[] seats = checkSeat.split(",");
		boolean result = true;
		
		for(int i = 0; i<seats.length;i++) {
			int rowIndex = seats[i].split("-")[0].toCharArray()[0] - 65;
			int colIndex = Integer.parseInt(seats[i].split("-")[1]);
			int hexInt = 0x80000>>(colIndex-1);
			int dbhexInt = Integer.parseInt(dbSeat[rowIndex].substring(2),16);
			if((hexInt&dbhexInt)>0) {
				result=false;
			}
		}
		return result;
		
	}

	@Override
	@Transactional
	public String setPaid(int scheduleCode,PaymentVO paid,int amount) {
		PaymentCheck paymentCheck = new PaymentCheck();
		String token = paymentCheck.getImportToken();
		String imamount = paymentCheck.getAmount(token, paid.getPayNo());
		if(!imamount.equals(amount+"")) {
			paymentCheck.cancelPayment(token, paid.getPayNo());
			return "failed";
		}
		
		PaymentVO tmp = mapper.selectPaid(scheduleCode);
		paid.setMovieCode(tmp.getMovieCode());
		paid.setResDate(tmp.getResDate());
		paid.setScreen(tmp.getScreen());
		
		String result = "";
		if(mapper.insertPayment(paid)>0) {
			String[] dbSeat = mapper.selectSeat(scheduleCode).split(",");
			String[] seats = paid.getPaySeat().split(",");
			result = DBSeatData.getPlusSeat(dbSeat, seats);
		}
		if(mapper.updateSeat(scheduleCode, result)<=0 && mapper.updateSeatCount(scheduleCode,paid.getPaySeat().split(",").length)<=0) {
			return "failed";
		}
		
		mapper.updateMembershipPoint(paid.getUserNo(), amount);
		
		return result;
	}

	@Override
	public int updatePaymentIsshow(PaymentVO pinfo) {
		pinfo.setIsshow("N");
		PaymentCheck pc = new PaymentCheck();
		if(mapper.updatePaymentIsshow(pinfo) > 0) {
			ScheduleVO svo = mapper.selectDBSeat(pinfo.getResDate().split("~")[0], pinfo.getScreen());
			String[] dbSeat = svo.getSeat().split(",");
			String[] seats = pinfo.getPaySeat().split(",");
			
			if(mapper.updateSeat(svo.getScheduleCode(), DBSeatData.getMinusSeat(dbSeat, seats)) > 0) {				
				if(pc.cancelPayment(pc.getImportToken(),pinfo.getPayNo()) != -1) {
					mapper.updateCanclePoint(pinfo.getUserNo(), pinfo.getPayPrice());
					return 0;
				}else {
					return -1;
				}
			}else {
				pinfo.setIsshow("Y");
				mapper.updatePaymentIsshow(pinfo);
				mapper.updateSeat(svo.getScheduleCode(), DBSeatData.getPlusSeat(dbSeat, seats));
				return -1;
			}
			
		}else {
			return -1;
		}
	}

	@Override
	public PaymentWithMovieDTO getPaid(String payNo) {
		return mapper.selectFinalPaid(payNo);
	}

}
