package kr.coo.civ.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class PaymentVO {
   private String movieCode,payNo,paySeat,screen,payWhere,payMethod,resDate,isshow;
   private int userNo,payPrice;
   private Date resTime;
}