package kr.coo.civ;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import kr.coo.civ.service.AuthService;
import kr.coo.civ.util.social.SNSLogin;
import kr.coo.civ.util.social.SNSValue;
import kr.coo.civ.vo.FavoriteMovieVO;
import kr.coo.civ.vo.InflowRouteVO;
import kr.coo.civ.vo.MemberVO;
import lombok.Setter;

@Controller
@RequestMapping("/auth")
public class AuthController {

	@Inject
	private SNSValue sns;

	@Setter(onMethod_ = @Autowired)
	private AuthService service;

	// ################# 페이지 요청 #################
	// 로그인 페이지 요청
	@GetMapping("/login")
	public String getloginpage(Model model, HttpSession session, HttpServletRequest request) {
		SNSLogin snsLogin = new SNSLogin(sns);
		model.addAttribute("naver_login_url", snsLogin.getNaverAuthURL());
		Map<String, ?> inputMap = RequestContextUtils.getInputFlashMap(request);
		if (null != inputMap) {
			model.addAttribute("errorId", inputMap.get("errorId"));
			model.addAttribute("loginErrorMsg", inputMap.get("loginErrorMsg"));
		}
		return "/auth/naverLogin";
	}
	
	// 소셜 로그인 회원가입 페이지
	@GetMapping("/socialjoin")
	public void socailJoinPage() {
	}

	// 일반 유저 회원가입 페이지
	@GetMapping("/join")
	public String getJoinPage() {
		return "/auth/sitejoin";
	}
	

	// ################# 기능 요청 #################
	// 네이버 로그인 콜백 주소
	@RequestMapping(value = "/{snsService}/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String socialCallback(@PathVariable("snsService") String serviceName, @RequestParam String code, Model model,
			HttpSession session) {
		SNSLogin snsLogin = new SNSLogin(sns);
		MemberVO user = null;
		MemberVO dbMember = null;
		String returnUrl = "";

		try {
			user = snsLogin.getUserProfile(code);
			dbMember = service.checkNaverMember(user);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (dbMember == null) {
			session.setAttribute("naverJoinInfo", user);
			returnUrl = "/auth/socialjoin";
		} else {
			session.setAttribute("loginInfo", dbMember);
			String redirectUrl = (String) session.getAttribute("redirectUrl");
			if (redirectUrl != null) {
				session.removeAttribute("redirectUrl");
				return "redirect:" + redirectUrl;
			}
			returnUrl = "/main";
		}

		return "redirect:" + returnUrl;
	}

	// 소셜 회원가입 요청
	@PostMapping("/socialjoindo")
	public String socailJoinDo(MemberVO mvo, String[] phone, String[] birth, InflowRouteVO ivo, FavoriteMovieVO fvo,
			HttpSession session) throws Exception {
		MemberVO user = (MemberVO) session.getAttribute("naverJoinInfo");
		user.setUserNick(mvo.getUserNick());
		user.setUserPhone(phone[0] + phone[1] + phone[2]);
		user.setUserGenre(mvo.getUserGenre());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		user.setUserBirth(birth[0] + "-" + birth[1] + "-" + birth[2]);

		sdf = new SimpleDateFormat("yyyyMMdd");

		if (user.getUserPhone().matches("^01(?:0|1|[6-9])(\\d{3}|\\d{4})(\\d{4})$")
				& user.getUserNick().matches("^[a-zA-Z가-힣0-9_]{3,15}$")
				& sdf.format(user.getUserBirth()).matches("^((19|20)\\d\\d)(0[1-9]|1[012])(0[1-9]|[12][0-9]|3[01])$")) {
			if (service.upNaverMember(user, fvo, ivo)) {
				session.removeAttribute("naverJoinInfo");
				session.setAttribute("loginInfo", user);
				return "redirect:/";
			} else {
				return "redirect:/common/500";
			}
		} else {
			return "redirect:/common/400";
		}
	}

	// 핸드폰 중복 체크 요청
	@GetMapping("/phonecheck")
	@ResponseBody
	public boolean phonecheck(String phone) {
		return service.phoneCheck(phone.replaceAll("-", ""));
	}

	// 로그아웃 요청
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginInfo");
		return "redirect:/main";
	}

	// 아이디 중복 체크 요청
	@ResponseBody
	@GetMapping("/idcheck")
	public String idCheck(String userId) {
		System.err.println("idCheck 들어옴");
		return service.idCheck(userId);
	}

	// 일반 유저 회원가입 요청
	@PostMapping("/userjoin")
	public String userJoin(MemberVO mvo, FavoriteMovieVO fvo, InflowRouteVO ivo, String[] strBirth, String routeText)
			throws ParseException {
		mvo.setUserBirth(strBirth[0]+strBirth[1]+strBirth[2]);
		if (ivo.getRoutePath().equals("기타")) {
			ivo.setRoutePath(routeText);
		}
		mvo.setUserPhone(mvo.getUserPhone().replace("-", ""));
		if (mvo.getUserId().matches("^[a-zA-Z0-9_]{4,15}$")
				& mvo.getUserPassword().matches("^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$")
				& mvo.getUserNick().matches("^[a-zA-Z가-힣0-9_]{3,15}$")
				& mvo.getUserPhone().matches("^01(?:0|1|[6-9])(\\d{3}|\\d{4})(\\d{4})$")
				& mvo.getUserBirth().matches("^((19|20)\\d\\d)(0[1-9]|1[012])(0[1-9]|[12][0-9]|3[01])$")) {
			if (service.joinUser(mvo, fvo, ivo)) {
				mvo.setUserBirth(strBirth[0] + "-" + strBirth[1] + "-" + strBirth[2]);
				return "redirect:/auth/login";
			} else {
				return "redirect:/common/500";
			}
		} else {
			System.err.println("정규식 검사 실패");
			return "redirect:/common/400";
		}
	}

	// 로그인 요청
	@RequestMapping(value = "/loginDo", method = RequestMethod.POST)
	public String loginDo(MemberVO vo, RedirectAttributes rttr, HttpSession session) {
		MemberVO dbUser = service.loginCheck(vo);
		if (dbUser == null) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("errorId", vo.getUserId());
			map.put("loginErrorMsg", "아이디 또는 비밀번호를 다시 확인하세요.");
			rttr.addFlashAttribute("errorMap", map);
			return "redirect:/auth/login";
		} else {
			String redirectUrl = (String) session.getAttribute("redirectUrl");
			session.setAttribute("loginInfo", dbUser);
			if (redirectUrl != null) {
				session.removeAttribute("redirectUrl");
				return "redirect:" + redirectUrl;
			}
			if (dbUser.getUserRole().equals("Y")) {
				return "redirect:/admin/dashboard";
			} else {
				return "redirect:/main";
			}
		}
	}

}
