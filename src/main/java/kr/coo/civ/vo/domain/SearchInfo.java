package kr.coo.civ.vo.domain;

import java.util.Date;

import lombok.Data;

@Data
public class SearchInfo {

	private Date date; // 날짜
	private String type; // 검색 타입
	
	// 문의 답변 페이지 검색에 사용
	private String startDate,finishDate,userID;
	private boolean replyCheck;
	private int userNo;

}
