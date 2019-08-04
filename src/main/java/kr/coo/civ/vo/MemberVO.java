package kr.coo.civ.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberVO {
   private String userName,userId,userPassword,userPhone,userGenre,userGender,userNick,socialcheck,userRole,userProfile,userBirth,joinDate;
   private int userNo,count;
}