package kr.coo.civ.vo.dto;

import java.sql.Time;
import java.util.*;

import org.springframework.web.multipart.MultipartFile;

import java.text.*;

public class ServiceDTO {
	private int s_no;
	private int u_no;
	private Date s_date;
	private String s_title;
	private String s_content;
	private String s_kindof;
	private int simg_no;


	
	public int getSimg_no() {
		return simg_no;
	}
	public void setSimg_no(int simg_no) {
		this.simg_no = simg_no;
	}
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public int getU_no() {
		return u_no;
	}
	public void setU_no(int u_no) {
		this.u_no = u_no;
	}
	public Date getS_date() {
		return s_date;
	}
	public void setS_date(Date s_date) {
		this.s_date = s_date;
	}
	public String getS_title() {
		return s_title;
	}
	public void setS_title(String s_title) {
		this.s_title = s_title;
	}
	public String getS_content() {
		return s_content;
	}
	public void setS_content(String s_content) {
		this.s_content = s_content;
	}
	public String getS_kindof() {
		return s_kindof;
	}
	public void setS_kindof(String s_kindof) {
		this.s_kindof = s_kindof;
	}
	
	
}
