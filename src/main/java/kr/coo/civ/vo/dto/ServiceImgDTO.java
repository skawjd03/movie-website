package kr.coo.civ.vo.dto;

import org.springframework.web.multipart.MultipartFile;

public class ServiceImgDTO {
	private int simg_no, s_no, u_no;
	private String oriName;
	private String simg_path;
	private MultipartFile[] s_img;
	
	public MultipartFile[] getS_img() {
		return s_img;
	}
	public void setS_img(MultipartFile[] s_img) {
		this.s_img = s_img;
	}
	public String getOriName() {
		return oriName;
	}
	public void setOriName(String oriName) {
		this.oriName = oriName;
	}
	public int getU_no() {
		return u_no;
	}
	public void setU_no(int u_no) {
		this.u_no = u_no;
	}
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
	public String getSimg_path() {
		return simg_path;
	}
	public void setSimg_path(String simg_path) {
		this.simg_path = simg_path;
	}
	
}
