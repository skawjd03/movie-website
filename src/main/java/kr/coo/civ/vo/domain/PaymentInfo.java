package kr.coo.civ.vo.domain;

import lombok.Data;

@Data
public class PaymentInfo {
	private int scheduleCode;
	private int money,adult,child,disorder,discountMoney;
	private String checkSeat,payNo;
}
