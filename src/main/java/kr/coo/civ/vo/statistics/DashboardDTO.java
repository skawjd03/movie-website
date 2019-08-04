package kr.coo.civ.vo.statistics;

import java.util.List;

import lombok.Data;

@Data
public class DashboardDTO {

	private List<GenderDTO> genderInfo;
	private List<JoinUserCountDTO> joinUserCountInfo;
	private List<ReserveRateDTO> reserveRateInfo;
	private List<SalesDTO> salesInfo;
	private List<VisitorCountDTO> visitorCountInfo;

}
