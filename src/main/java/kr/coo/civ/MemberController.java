package kr.coo.civ;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.coo.civ.service.MemberService;
import kr.coo.civ.util.CreateCardNumber;
import kr.coo.civ.vo.MemberShipVO;
import kr.coo.civ.vo.MemberVO;
import kr.coo.civ.vo.domain.SearchInfo;
import kr.coo.civ.vo.dto.PaymentWithMovieDTO;
import lombok.Setter;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Setter(onMethod_ = @Autowired)
	private MemberService service;

	@Setter(onMethod_ = @Autowired)
	private ServletContext context;

	// ################# 페이지 요청 #################
	// 멤버십 페이지
	@GetMapping("/membership")
	public void getMembershipPage() {
	}
	
	// 마이페이지
	@GetMapping("/myinfo")
	public String getMyInfoPage(HttpSession session, Model model) {
		MemberVO user = ((MemberVO) session.getAttribute("loginInfo"));
		if (user == null) {
			session.setAttribute("redirectUrl", "/member/myinfo");
			return "redirect:/auth/login";
		}

		model.addAttribute("myInfo", service.getMyinfo(user.getUserNo()));
		model.addAttribute("serviceList", service.getServiceList(user.getUserNo()));
		model.addAttribute("DibsList", service.getMyDibsList(user.getUserNo()));
		model.addAttribute("RandomMovie", service.getRandomMovie());
		return "/member/myinfo";
	}

	// 멤버십 가입 페이지
	@GetMapping("/membershipagree")
	public String getMembershipAgreePage(HttpSession session, Model model, HttpServletResponse response) {
		MemberVO logininfo = (MemberVO) session.getAttribute("loginInfo");
		
		if (logininfo == null) {
			session.setAttribute("redirectUrl", "/member/membershipagree");
			return "redirect:/auth/login";
		}
		
		if (session.getAttribute("redirectUrl") != null) {
			session.removeAttribute("redirectUrl");
		}
		String mJoinCheck = service.getMemberShipJoinCheck(logininfo.getUserNo());
		
		if (mJoinCheck != null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>alert('이미 맴버쉽 회원이십니다.'); history.back();</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		model.addAttribute("memberName", logininfo.getUserName());
		String phone = logininfo.getUserPhone();
		model.addAttribute("memberPhone",
				phone.substring(0, 3) + "-" + phone.substring(3, 7) + "-" + phone.substring(7));
		
		return "/member/membershipagree";
	}
	
	
	// ################# 기능 요청 #################
	// 멤버십 가입 요청
	@GetMapping("/createmembership")
	public String createMembershipCard(HttpSession session) {
		MemberShipVO membership = new MemberShipVO();
		int userNo = (int) ((MemberVO) session.getAttribute("loginInfo")).getUserNo();
		membership.setUserNo(userNo);
		membership.setCardNo(CreateCardNumber.makeCardNum(userNo));

		if (service.newMemberShip(membership) != 1) {
			return "redirect:/common/throwable";
		}

		return "redirect:/member/myinfo";
	}

	// 문의 답변 정보조회
	@GetMapping("/serviceinfo")
	public String getServiceInfo(int serviceNo, Model model) {
		model.addAttribute("serviceInfo", service.getServiceInfo(serviceNo));
		return "make/myinfoService";
	}

	// 결제 정보 조회
	@GetMapping("/mypayment")
	@ResponseBody
	public List<PaymentWithMovieDTO> getMyPayment(SearchInfo info, HttpSession session) {
		MemberVO user = ((MemberVO) session.getAttribute("loginInfo"));
		if (user == null) {
			return null;
		} else {
			return service.getMyPayment(user.getUserNo(), info);
		}
	}

	// 닉네임 체인지
	@PostMapping("/changenick")
	@ResponseBody
	public int changeNick(String changeNick, HttpSession session) {
		MemberVO userVo = (MemberVO) session.getAttribute("loginInfo");
		if (userVo != null) {
			return service.changeUserNick(changeNick, userVo.getUserNo());
		}
		return -2;
	}

	// 찜목록 삭제
	@ResponseBody
	@GetMapping("/removedibs")
	public int removeDibs(int dibsNo) {
		return service.removeDibs(dibsNo);
	}

	// 프로필 수정
	@PostMapping("/changeprofile")
	public String changeProfile(MultipartFile proFile, HttpSession session) {
		MemberVO userVo = (MemberVO) session.getAttribute("loginInfo");
		if (userVo != null) {
			if (service.changeProfile(proFile, context.getRealPath(context.getInitParameter("profilePath")), userVo.getUserNo(),userVo) == 1) {
				return "redirect:/member/myinfo";
			}
		}
		return "redirect:/common/trowable";
	}
}
