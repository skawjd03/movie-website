package kr.coo.civ.service;

import java.util.List;

import kr.coo.civ.vo.MovieVO;
import kr.coo.civ.vo.PaymentVO;
import kr.coo.civ.vo.domain.MovieQueryType;
import kr.coo.civ.vo.domain.ShowPaymentInfo;
import kr.coo.civ.vo.dto.PaymentWithMovieDTO;

public interface PaymentService {
	public List<MovieVO> getMovieList(MovieQueryType type);
	public List<ShowPaymentInfo> getScheduleList(MovieQueryType type);
	public ShowPaymentInfo getSeatInfo(int scheduleNo);
	public boolean getCheckSeat(int scheduleCode,String checkSeat);
	public String setPaid(int scheduleCode,PaymentVO paid,int amount);
	public int updatePaymentIsshow(PaymentVO pinfo);
	public PaymentWithMovieDTO getPaid(String payNo);
}
