package kr.coo.civ.vo.dto;

import lombok.Data;

@Data
public class MemberSearchDTO {
	private String memberType;
	private String searchType;
	private String searchKeyword;
	private String searchStart,searchFinish;
	private String searchGender,searchIsshow;
}
