package kr.coo.civ.vo.dto;

import java.util.List;

import kr.coo.civ.vo.ScheduleVO;
import lombok.Data;

@Data
public class TotalScheduleDTO {

	private String movieCode,movieName,movieGenre,movieOpendate, movieRuntime;
	private List<ScheduleVO> schedule;

}
