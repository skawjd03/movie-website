package kr.coo.civ.util.social;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class NaverAPI extends DefaultApi20 implements NaverUrls{
	
	private NaverAPI() {
	}
	
	private static class InstanceHolder{
		private static final NaverAPI INSTANCE = new NaverAPI();
	}
	
	public static NaverAPI getInstance() {
		return InstanceHolder.INSTANCE;
	}
	
	@Override
	public String getAccessTokenEndpoint() {
		return NAVER_ACCESS_TOKEN;
	}

	@Override
	protected String getAuthorizationBaseUrl() {
		return NAVER_AUTH;
	}
	
}
