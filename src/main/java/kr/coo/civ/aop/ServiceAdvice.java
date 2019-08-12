package kr.coo.civ.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import com.google.gson.Gson;

import kr.coo.civ.ServiceController;
import kr.coo.civ.vo.MemberVO;
import kr.coo.civ.vo.ServiceCommentVO;
import lombok.extern.log4j.Log4j;

@Aspect
@Log4j
@Component
public class ServiceAdvice {

	@Pointcut("execution(* kr.coo.civ.mapper.NoticeDAO.questionRegistor(*)) && args(scvo)")
	public void pointService(ServiceCommentVO scvo) {
	}

	@AfterReturning(pointcut = "pointService(scvo)", returning = "returnValue")
	public void sendService(ServiceCommentVO scvo, Object returnValue) {
		System.out.println("여기로 왔습니다.");
		if ((Integer) returnValue == 1) {
			Gson g = new Gson();
			System.out.println(g.toJson(scvo));
			ServiceController.sendDate("");
		}
	}

	@Pointcut("execution(* kr.coo.civ.ManageController.*(..))")
	public void managePoint() {
	}
	
	@Around("managePoint()")
	public Object sessionCheck(ProceedingJoinPoint pjp) throws Throwable,RuntimeException {
		HttpSession session = null;
		HttpServletRequest request = null;
		Object result = null;
		String type = pjp.getSignature().getDeclaringTypeName();

		for (Object o : pjp.getArgs()) {
			if (o instanceof HttpSession) {
				session = (HttpSession) o;
			}else if(o instanceof HttpServletRequest) {
				request = (HttpServletRequest)o;
			}
		}
		
		if (session.getAttribute("loginInfo") == null) {
			return "redirect:/auth/login";
		}else {			
			if(!((MemberVO)session.getAttribute("loginInfo")).getUserRole().equals("Y")) {
				if(request != null && request.getHeader("AJAX").equals("true")) {
					throw new RuntimeException("권한 오류");
				}
				return "redirect:/common/401";
			}else {
				result = pjp.proceed();
			}
		}
		
		return result;
	}
}
