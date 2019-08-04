package kr.coo.civ.vo.statistics;

import lombok.Data;

@Data
public class ReserveRateDTO {

	private String movieName;
	private int totalseat,reserveseat;

}
