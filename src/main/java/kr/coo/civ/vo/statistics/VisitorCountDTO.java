package kr.coo.civ.vo.statistics;

import java.util.List;

import lombok.Data;

@Data
public class VisitorCountDTO {

	private String logDate;
	private List<VisitorDataList> visitorData;
}
