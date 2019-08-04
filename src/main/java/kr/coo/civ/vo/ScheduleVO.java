package kr.coo.civ.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ScheduleVO{

	private int scheduleCode,countseat;
	private String scheduleDate;
	private String scheduleScreen,seat,movieCode,scheduleStart,scheduleFinish;
	private String showtime;
}
