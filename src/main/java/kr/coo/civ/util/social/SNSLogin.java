package kr.coo.civ.util.social;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

import kr.coo.civ.vo.MemberVO;

public class SNSLogin {
	
	private OAuth20Service oauthService;
	private SNSValue sns;
	
	public SNSLogin(SNSValue naverSns) {
		this.oauthService = new ServiceBuilder(naverSns.getClientId())
				.apiSecret(naverSns.getClientSecret())
				.callback(naverSns.getRedirectUrl())
				.scope("profile")
				.build(naverSns.getApi20Instance());
		this.sns = naverSns;
	}
	
	public String getNaverAuthURL() {
		return this.oauthService.getAuthorizationUrl();
	}
	
	public MemberVO getUserProfile(String code) throws Exception {
		OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
		
		OAuthRequest request = new OAuthRequest(Verb.GET, this.sns.getProfileUrl());
		oauthService.signRequest(accessToken, request);
		
		Response response = oauthService.execute(request);
		return parseJson(response.getBody());
	}

	private MemberVO parseJson(String body) throws Exception {
		System.out.println("============================\n" + body + "\n==================");
		MemberVO user = new MemberVO();
		
		ObjectMapper mapper = new ObjectMapper();
		JsonNode rootNode = mapper.readTree(body);
		
		if (this.sns.isNaver()) {
			JsonNode resNode = rootNode.get("response");
			user.setUserNick(resNode.get("nickname").asText());
			user.setUserName(resNode.get("name").asText());
			user.setUserId(resNode.get("email").asText());
			user.setUserGender(resNode.get("gender").asText());
		}
		
		return user;
	}

}
