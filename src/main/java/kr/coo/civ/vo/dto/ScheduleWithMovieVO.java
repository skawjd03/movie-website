package kr.coo.civ.vo.dto;

import kr.coo.civ.vo.MovieVO;
import kr.coo.civ.vo.ScheduleVO;
import lombok.Data;

@Data
public class ScheduleWithMovieVO {

	private ScheduleVO schedule;
	private MovieVO movie;
	
}
