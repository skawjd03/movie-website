package kr.coo.civ.vo.dto;

import java.util.List;

import kr.coo.civ.vo.domain.PageUtil;

public class NoticeDTO {
	private int rno;
	private int n_no;
	private String n_title;
	private String n_content;
	private int n_hit;
	private String n_date;
	private String word;
	private String isSearch;
	private PageUtil pUtil;
	
	private List<NoticeDTO> list;
	
	
	public String getIsSearch() {
		return isSearch;
	}
	public void setIsSearch(String isSearch) {
		this.isSearch = isSearch;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getN_no() {
		return n_no;
	}
	public void setN_no(int n_no) {
		this.n_no = n_no;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public int getN_hit() {
		return n_hit;
	}
	public void setN_hit(int n_hit) {
		this.n_hit = n_hit;
	}
	public String getN_date() {
		return n_date;
	}
	public void setN_date(String n_date) {
		this.n_date = n_date;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public List<NoticeDTO> getList() {
		return list;
	}
	public void setList(List<NoticeDTO> list) {
		this.list = list;
	}
	public PageUtil getpUtil() {
		return pUtil;
	}
	public void setpUtil(PageUtil pUtil) {
		this.pUtil = pUtil;
	}
	
}
