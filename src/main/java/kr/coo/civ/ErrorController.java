package kr.coo.civ;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/common")
public class ErrorController {

	@RequestMapping(value = "/throwable",method = {RequestMethod.GET,RequestMethod.POST})
	public String throwable(Model model) {
		model.addAttribute("errorCode","throwable");
		model.addAttribute("errorMsg","예외가 발생했습니다.");
		return "/error";
	}
	
	@RequestMapping(value = "/exception",method = {RequestMethod.GET,RequestMethod.POST})
	public String exception(Model model) {
		model.addAttribute("errorCode","exception");
		model.addAttribute("errorMsg","예외가 발생했습니다.");
		return "/error";
	}
	
	@RequestMapping(value = "/400",method = {RequestMethod.GET,RequestMethod.POST})
	public String pageError400(Model model) {
		model.addAttribute("errorCode","400");
		model.addAttribute("errorMsg","잘못된 요청입니다.");
		return "/error";
	}
	
	@RequestMapping(value = "/403",method = {RequestMethod.GET,RequestMethod.POST})
	public String pageError403(Model model) {
		model.addAttribute("errorCode","403");
		model.addAttribute("errorMsg","접근 금지되었습니다.");
		return "/error";
	}
	@RequestMapping(value = "/404",method = {RequestMethod.GET,RequestMethod.POST})
	public String pageError404(Model model) {
		model.addAttribute("errorCode","404");
		model.addAttribute("errorMsg","요청하신 페이지는 존재하지 않습니다.");
		return "/error";
	}
	@RequestMapping(value = "/405",method = {RequestMethod.GET,RequestMethod.POST})
	public String pageError405(Model model) {
		model.addAttribute("errorCode","405");
		model.addAttribute("errorMsg","요청된 메소드가 허용되지 않습니다.");
		return "/error";
	}
	@RequestMapping(value = "/500",method = {RequestMethod.GET,RequestMethod.POST})
	public String pageError500(Model model) {
		model.addAttribute("errorCode","500");
		model.addAttribute("errorMsg","서버에 오류가 발생했습니다.");
		return "/error";
	}
	@RequestMapping(value = "/503",method = {RequestMethod.GET,RequestMethod.POST})
	public String pageError503( Model model) {
		model.addAttribute("errorCode","503");
		model.addAttribute("errorMsg","서비스를 사용할 수 없습니다.");
		return "/error";
	}
	@RequestMapping(value = "/401",method = {RequestMethod.GET,RequestMethod.POST})
	public String pageError401_1( Model model) {
		model.addAttribute("errorCode","접근제한");
		model.addAttribute("errorMsg","해당 페이지에 대한 접근권한이 없습니다.");
		return "/error";
	}
}

