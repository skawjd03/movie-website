package kr.coo.civ.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MovieVO {
	private String movieCode,movieName,movieNation,moviePoster,movieWideposter,movieStory,movieDirector,movieActor,movieGenre,movieAge;
	private String movieOpendate;
	private int movieTotalview;
	private int movieRuntime;
	private int rank;
	private float grade;
	private String isshow;
}