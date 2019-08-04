package kr.coo.civ.vo;

import lombok.Data;

@Data
public class MemberShipVO {
	private String cardNo,cardDate;
	private int userNo,cardPoint;

	private int membgNo,membgPrice,discountCode;
	
	private String discountName;
	private float discountPercent;
	
	private MemberVO member;
	
}
