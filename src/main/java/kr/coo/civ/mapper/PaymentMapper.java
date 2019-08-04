package kr.coo.civ.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.coo.civ.vo.MovieVO;
import kr.coo.civ.vo.PaymentVO;
import kr.coo.civ.vo.ScheduleVO;
import kr.coo.civ.vo.domain.MovieQueryType;
import kr.coo.civ.vo.domain.ShowPaymentInfo;
import kr.coo.civ.vo.dto.PaymentWithMovieDTO;

public interface PaymentMapper {
	public int updateSeat(String seatInfo , int scheduleCode);
	public List<MovieVO> selectMovie(MovieQueryType type);
	public List<ShowPaymentInfo> selectSchedule(MovieQueryType type);
	public ShowPaymentInfo selectScheduleSeat(int scheduleNo);
	public String selectSeat(int scheduleCode);
	public PaymentVO selectPaid(int scheduleCode);
	public int insertPayment(PaymentVO payment);
	public int updateSeat(@Param("sc") int sc,@Param("seat") String seat);
	public int updateSeatCount(@Param("sc") int sc,@Param("payCnt") int payCnt);
	public void updateMembershipPoint(@Param("userNo") int userNo,@Param("amount") int amount);
	public int updatePaymentIsshow(PaymentVO pinfo);
	public ScheduleVO selectDBSeat(@Param("date") String date,@Param("screen") String screen);
	public int updateScheduleSeat(ScheduleVO svo);
	public void updateCanclePoint(@Param("userNo") int userNo,@Param("amount") int amount);
	public PaymentWithMovieDTO selectFinalPaid(String payNo);
}
