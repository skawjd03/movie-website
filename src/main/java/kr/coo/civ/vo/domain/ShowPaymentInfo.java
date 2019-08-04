package kr.coo.civ.vo.domain;

import kr.coo.civ.vo.MovieVO;
import kr.coo.civ.vo.ScheduleVO;
import lombok.Data;

@Data
public class ShowPaymentInfo{
	private String showtime;
	private MovieVO movie;
	private ScheduleVO schedule;
}
