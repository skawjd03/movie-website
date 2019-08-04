package kr.coo.civ.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class NoticeVO {

	private int noticeNo,noticeHit;
	private String noticeTitle,noticeContent;
	private Date noticeDate;

}
