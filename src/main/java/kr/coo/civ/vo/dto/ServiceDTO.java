package kr.coo.civ.vo.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ServiceDTO {
	private int s_no;
	private int u_no;
	private Date s_date;
	private String s_title;
	private String s_content;
	private String s_kindof;
	private int simg_no;
	private String s_dateStr;
	
}
