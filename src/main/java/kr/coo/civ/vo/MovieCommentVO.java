package kr.coo.civ.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class MovieCommentVO {

	private int commentNo,commentLikes,commentStar;
	private String movieCode,userId,commentContent;
	private String commentDate,commentcheck;
}
