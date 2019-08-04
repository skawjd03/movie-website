package kr.coo.civ.vo.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	 private int pageNum;
	 private String order;
	 private int total;
	 
	 public Criteria() {
	      this(1,10);
	 }

	public Criteria(int pageNum,int amount) {
		this.pageNum = pageNum;
	}
}
