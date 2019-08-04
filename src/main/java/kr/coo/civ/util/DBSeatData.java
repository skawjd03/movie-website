package kr.coo.civ.util;

public class DBSeatData {
	
	public static String getPlusSeat(String[] dbSeat,String[] seats) {
		for(int i = 0; i<seats.length;i++) {
			int rowIndex = seats[i].split("-")[0].toCharArray()[0] - 65;
			int colIndex = Integer.parseInt(seats[i].split("-")[1]);
			int hexInt = 0x80000>>(colIndex);
			int dbhexInt = Integer.parseInt(dbSeat[rowIndex].substring(2),16);
			dbSeat[rowIndex] = "0x"+Integer.toHexString(dbhexInt+hexInt);
		}
		String tmpStr = "";
		for(int i = 0;i<dbSeat.length;i++) {
			if(i==dbSeat.length-1) {
				tmpStr+=dbSeat[i];
			}else {
				tmpStr+=dbSeat[i]+",";
			}
		}
		return tmpStr;
	}
	
	public static String getMinusSeat(String[] dbSeat,String[] seats) {
		for(int i = 0; i<seats.length;i++) {
			int rowIndex = seats[i].split("-")[0].toCharArray()[0] - 65;
			int colIndex = Integer.parseInt(seats[i].split("-")[1]);
			int hexInt = 0x80000>>(colIndex);
			int dbhexInt = Integer.parseInt(dbSeat[rowIndex].substring(2),16);
			dbSeat[rowIndex] = "0x"+Integer.toHexString(dbhexInt-hexInt);
		}
		String tmpStr = "";
		for(int i = 0;i<dbSeat.length;i++) {
			if(i==dbSeat.length-1) {
				tmpStr+=dbSeat[i];
			}else {
				tmpStr+=dbSeat[i]+",";
			}
		}
		return tmpStr;
	}
	
}
