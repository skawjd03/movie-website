package kr.coo.civ.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;

import kr.coo.civ.vo.dto.ThumbsInfoDTO;

public class Encryption {

	public ThumbsInfoDTO getEncryption(HttpServletRequest request,ThumbsInfoDTO thumbs) {
		try {
            StringBuffer sbuf = new StringBuffer();
            MessageDigest mDiget = MessageDigest.getInstance("MD5");
            mDiget.update(request.getRemoteAddr().getBytes());
            byte[] msgStr = mDiget.digest();
            
            for(int i = 0; i<msgStr.length;i++) {
               String tmpText = Integer.toHexString((int)msgStr[i]&0x00ff);
               sbuf.append(tmpText);
            }
            thumbs.setMd5ip(sbuf.toString());
            thumbs.setUserNo(-1);
         } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
         }
		
		return thumbs;
	}
}
