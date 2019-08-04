package kr.coo.civ.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CreateCardNumber {
	private static SimpleDateFormat sdf = new SimpleDateFormat("MMdd");
	public static String makeCardNum(int userNo) {	
		return getNowDate()+'-'+makeUsernoFormat(userNo)+"-"+randNum();
	}
	
	private static String makeUsernoFormat(int userNo) {
		String result = userNo+"";
		int cnt = 4-result.length();
		for(int i = 0; i<cnt;i++) {
			result += "0";
		}
		return result;
	}
	
	private static String getNowDate() {
		return sdf.format(new Date());
	}
	
	private static String randNum() {
		int num = (int)(Math.random()*(9999-1000)+1000);
		int num2 = (int)(Math.random()*(9999-1000)+1000);
		return num+"-"+num2;
	}
	
}