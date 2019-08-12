package kr.coo.civ.util.social;

import org.springframework.util.StringUtils;

import com.github.scribejava.core.builder.api.DefaultApi20;

import lombok.Data;

@Data
public class SNSValue implements NaverUrls{

	private String clientId;
	private String clientSecret;
	private String redirectUrl;
	private String service;
	private DefaultApi20 api20Instance;
	private String profileUrl;
	
	private boolean isNaver;
	
	public SNSValue(String service,String cid, String cs, String url) {
		this.service = service;
		this.clientId = cid;
		this.redirectUrl = url;
		this.clientSecret = cs;
		
		isNaver = StringUtils.pathEquals(service, "naver");
		
		if(isNaver) {
			this.api20Instance = NaverAPI.getInstance();
			this.profileUrl = NAVER_PROFILE_URL;
		}
	}

}
