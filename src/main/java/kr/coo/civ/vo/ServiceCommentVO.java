package kr.coo.civ.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ServiceCommentVO {

	private int commentNo,serviceNo;
	private String commentDate;
	private String commentContent,commentWriter;

}
