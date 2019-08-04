package kr.coo.civ;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.coo.civ.service.HomeService;
import kr.coo.civ.vo.domain.SearchInfo;
import kr.coo.civ.vo.dto.ScheduleWithMovieVO;
import kr.coo.civ.vo.dto.TotalScheduleDTO;
import lombok.Setter;


@Controller
public class HomeController {
	
	protected Log log = LogFactory.getLog(HomeController.class);
	
	@Setter(onMethod_=@Autowired)
	private HomeService service;
	
	// ################# 페이지 요청 #################
	// 프론트 메인페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		log.debug("프론트 메인페이지 요청");
		model.addAttribute("list",service.getFrontMainMovie());
		return "home";
	}
	
	// 메인 페이지
	@GetMapping("/main")
	public void getMainPage(Model model) {
		log.debug("메인페이지 요청");
		model.addAttribute("slideList",service.getBillboardList());
		model.addAttribute("posterList",service.getMainMoviePosterList());
	}
	
	// 영화관 페이지
	@RequestMapping(value="/theater", method=RequestMethod.GET)
	public void theaterPage(String date,Model model) {
		log.debug("영화관페이지 요청");
		if(date == null) {
			date = new SimpleDateFormat("yyyy/MM/dd").format(new Date());
		}
		model.addAttribute("list",service.getTotalSchedule(date));
	}
	
	
	// ################# 기능 요청 #################
	// 영화관 스케줄 목록 요청
	@GetMapping(value="/theater/schedule")
	@ResponseBody
	public List<TotalScheduleDTO> getSchedule(String date){
		List<TotalScheduleDTO> list = service.getTotalSchedule(date);
		return list;
	}
	
	// 스케줄 좌석 예매 현황
	@GetMapping("/theater/scheduleseat")
	@ResponseBody
	public ScheduleWithMovieVO getScheduleSeat(String scCode) {
		return service.getScheduleSeat(scCode);
	}
	
	// 메인페이지 영화 순위표 요청
	@GetMapping("/mainmovielist")
	public String getMainMovieList(SearchInfo type,Model model) {
		model.addAttribute("movieList",service.getMainMovieList(type));
		model.addAttribute("checkSearch",type.getType());
		return "make/mainMovieList";
	}
}