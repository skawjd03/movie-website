package kr.coo.civ.vo.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MovieQueryType {

	private Date date;
	private String type;
	private String mcode;
}
