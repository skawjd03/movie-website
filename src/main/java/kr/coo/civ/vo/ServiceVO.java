package kr.coo.civ.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ServiceVO {
   private String serviceTitle,serviceContent,serviceKindof,serviceImg;
   private int serviceNo,userNo;
   private String serviceDate,replyCheck;
}