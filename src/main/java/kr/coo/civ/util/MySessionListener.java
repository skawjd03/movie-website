package kr.coo.civ.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import kr.coo.civ.service.StatisticsService;

//import com.payment.service.StatisticsService;

public class MySessionListener implements HttpSessionListener {
	
	private static StatisticsService service;
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:");
	
	public MySessionListener() {
	}

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		HttpSession session = se.getSession(); 
		session.setMaxInactiveInterval(60*20);
		ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(session.getServletContext()); 
		if(service == null) {
			service = (StatisticsService) context.getBean("statisticsServiceImpl");
		}
		System.out.println("리스너");
		String nowTime = sdf.format(new Date())+"00";
		service.setVisitorCount(nowTime,"0");
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		
	}

}
