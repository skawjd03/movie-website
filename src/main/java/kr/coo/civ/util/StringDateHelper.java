package kr.coo.civ.util;

import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;



public class StringDateHelper{
	
	public static String getCalcTime(String strDate,String strDate2,String dataFormat) {
		SimpleDateFormat format = new SimpleDateFormat(dataFormat);
		String result = "";
		try {
			Date date = format.parse(strDate);
			Date date2 = format.parse(strDate2);
			int gap = (int)(date2.getTime()-date.getTime())/(1000 * 60);
			result = ((gap/60)+"")+":"+(gap%60);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static boolean compareDate(String strDate,String strDate2,String dataFormat) {
		boolean result = true;
		
		int check1 = Integer.parseInt(getCalcTime(strDate, strDate2, dataFormat).split(":")[0]);
		int check2 = Integer.parseInt(getCalcTime(strDate, strDate2, dataFormat).split(":")[1]);
		
		if(check1<0 || check2<0) {
			result=false;
		}
		
		return result;
	}
	
	public static String oneDatePlus(String date,String dataFormat) {
		SimpleDateFormat format = new SimpleDateFormat(dataFormat);
		String result = "";
		try {
			Date d = format.parse(date);
			d.setDate(d.getDate()+1);
			result = format.format(d);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public static void main(String...ar) {
		System.out.println(compareDate("2019/07/01-11:00", "2019/07/01", "yyyy/MM/dd"));
		System.out.println(oneDatePlus("2019/07/01-02:00", "yyyy/MM/dd-HH:mm"));
	}

}
