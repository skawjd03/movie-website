package kr.coo.civ.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class EncryptString {
	
	public static String makeMd5Str(byte[] str) {	
		StringBuffer sbuf = new StringBuffer();
		MessageDigest mDiget;
		try {
			mDiget = MessageDigest.getInstance("MD5");
			mDiget.update(str);
			byte[] msgStr = mDiget.digest();
			
			for(int i = 0; i<msgStr.length;i++) {
				String tmpText = Integer.toHexString((int)msgStr[i]&0x00ff);
				sbuf.append(tmpText);
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return sbuf.toString();
	}
	
}
