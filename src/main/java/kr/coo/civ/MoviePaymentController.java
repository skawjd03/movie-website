package kr.coo.civ;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.coo.civ.service.MemberService;
import kr.coo.civ.service.PaymentService;
import kr.coo.civ.util.imp.PaymentCheck;
import kr.coo.civ.vo.MemberVO;
import kr.coo.civ.vo.MovieVO;
import kr.coo.civ.vo.PaymentVO;
import kr.coo.civ.vo.domain.MovieQueryType;
import kr.coo.civ.vo.domain.PaymentInfo;
import kr.coo.civ.vo.domain.ShowPaymentInfo;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/payment/*")
@Log4j
public class MoviePaymentController {

	@Setter(onMethod_ = @Autowired)
	private PaymentService service;
	
	@Setter(onMethod_ = @Autowired)
	private MemberService memService;
	
	private static HashMap<Integer,ArrayList<String>> paymenting = new HashMap<Integer,ArrayList<String>>();
	
	// ################# 페이지 요청 #################
	// 결제 좌석 선택 페이지
	@GetMapping("/movieseat")
	public void getSeatPage(@RequestParam("selected") int sNo, Model model) {
		model.addAttribute("mInfo",service.getSeatInfo(sNo));
	}
	
	// 최종 결제 창
	@GetMapping("/payok")
	public void getPayokPage(HttpSession session,Model model) {
		PaymentInfo pInfo = (PaymentInfo)session.getAttribute("pInfo");
		model.addAttribute("pInfo",pInfo);
		model.addAttribute("paid",service.getPaid(pInfo.getPayNo()));
		session.removeAttribute("pInfo");
	}
	
	// 빠른예매 페이지
	@GetMapping("/reserve")
	public void getReservePage(Model model) {
		MovieQueryType type = new MovieQueryType();
		type.setType("개봉순");
		List<MovieVO> movieList = service.getMovieList(type);
		model.addAttribute("mList",movieList);
	}
	
	// 영화 티켓 구매 페이지
	@PostMapping("/sellticket")
	@RequestMapping(value = "/sellticket",method = {RequestMethod.GET,RequestMethod.POST})
	public String getPaymentPage(PaymentInfo info,Model model,HttpSession session,HttpServletRequest request,RedirectAttributes rttr) {
		if(session.getAttribute("loginInfo") == null) {
			session.setAttribute("redirectUrl", "/payment/sellticket");
			session.setAttribute("redirectPaymentInfo", info);
			return "redirect:/auth/login";
		}
		if(info.equals(new PaymentInfo())) {
			info = (PaymentInfo)session.getAttribute("redirectPaymentInfo");
			if(info == null) {
				return "redirect:/common/exception";
			}
		}
		model.addAttribute("mInfo",service.getSeatInfo(info.getScheduleCode()));
		int money = info.getAdult()*12000+info.getChild()*9000+info.getDisorder()*7000;
		info.setMoney(money);
		String mId = "merchant_"+ new Date().getTime();
		new PaymentCheck().setHackCheck(money+"", mId, new PaymentCheck().getImportToken());
		model.addAttribute("mId",mId);
		model.addAttribute("userPoint",memService.getUserPoint(((MemberVO)session.getAttribute("loginInfo")).getUserNo()));
		session.setAttribute("pInfo", info);
		return "/payment/payment";
	}
	
	
	// ################# 기능 요청 #################
	// 빠른예매 영화 목록 조회 ( 개봉순, 예매순, 평점순 )
	@ResponseBody 
	@PostMapping("/reserve/type")
	public List<MovieVO> getmovieList(MovieQueryType type) {
		return service.getMovieList(type);
	}
	
	// 빠른예매 영화 스케줄 조회 
	@ResponseBody
	@GetMapping("/schedule")
	public List<ShowPaymentInfo> getScheduleList(MovieQueryType type){
		return service.getScheduleList(type);
	}
	
	// 좌석 결제가능 여부 조회
	@ResponseBody
	@GetMapping("/checkseat")
	public boolean checkSeatNow(int scheduleCode, String checkSeat) {
		ArrayList<String> checkStr = paymenting.get(scheduleCode);
		boolean check = true;
		if(checkStr != null) {
			for(int i =0;i<checkSeat.split(",").length;i++) {
				if(checkStr.contains(checkSeat.split(",")[i])) {
					check=false;
					break;
				}
			}
			if(check) {
				check = service.getCheckSeat(scheduleCode, checkSeat);
			}
		}else {
			paymenting.put(scheduleCode, new ArrayList<String>());
		}
		
		if(check) {
			for(int i=0;i<checkSeat.split(",").length;i++) {
				paymenting.get(scheduleCode).add(checkSeat.split(",")[i]);
			}
		}
		
		return check;
	}
	
	// 결제 요청
	@PostMapping("/paid")
	@ResponseBody
	public String setPaid(PaymentVO paid ,int scheduleCode,HttpSession session) {
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		if(loginInfo == null) {
			return "로그인필요";
		}else {
			paid.setUserNo(loginInfo.getUserNo());
			PaymentInfo pinfo = (PaymentInfo)session.getAttribute("pInfo");
			pinfo.setPayNo(paid.getPayNo());
			return service.setPaid(scheduleCode, paid, (pinfo.getMoney()-pinfo.getDiscountMoney()));
		}
	}
	
	// 포인트 사용 검증
	@GetMapping("/checkpoint")
	@ResponseBody
	public int checkPoint(int point, String m_id,HttpSession session) {
		int userNo = ((MemberVO)session.getAttribute("loginInfo")).getUserNo();
		PaymentInfo pInfo = (PaymentInfo)session.getAttribute("pInfo");
		int paymoney = pInfo.getMoney();
		int dbmoney = memService.getUserPoint(userNo);
		int resultMoney = 0;
		int discountMoney = 0;
		
		if(dbmoney>10000 && point >10000) {
			resultMoney = paymoney-10000;
			discountMoney = 10000;
		}else {			
			if(point >= dbmoney) {
				resultMoney = paymoney>=dbmoney? paymoney-dbmoney : 0;
				discountMoney = paymoney>=dbmoney? dbmoney : paymoney;
			}else if(point < dbmoney){
				resultMoney = paymoney>=point? paymoney - point: 0;
				discountMoney =  paymoney>=point? point:paymoney;
			}
		}
		
		new PaymentCheck().setHackCheck(resultMoney+"", m_id, new PaymentCheck().getImportToken());
		pInfo.setDiscountMoney(discountMoney);
		return discountMoney;
	}
	
	// 결제 취소 ( 환불 )
	@GetMapping("/canclepayment")
	@ResponseBody
	public int canclePayment(PaymentVO pinfo) {
		int result = service.updatePaymentIsshow(pinfo);
		if(result == -1) {
			return -1;
		}else {
			return 1;
		}
	}
	
}
