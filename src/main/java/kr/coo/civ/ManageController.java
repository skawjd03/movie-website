package kr.coo.civ;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.coo.civ.service.ManageService;
import kr.coo.civ.vo.MemberVO;
import kr.coo.civ.vo.MovieVO;
import kr.coo.civ.vo.ScheduleVO;
import kr.coo.civ.vo.ServiceCommentVO;
import kr.coo.civ.vo.ServiceVO;
import kr.coo.civ.vo.domain.SearchInfo;
import kr.coo.civ.vo.dto.MemberSearchDTO;
import kr.coo.civ.vo.dto.ScheduleWithMovieVO;
import kr.coo.civ.vo.dto.ServiceWithImg;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@Log4j
public class ManageController {
	
	@Setter(onMethod_ = @Autowired)
	private ManageService service;

	@Setter(onMethod_ = @Autowired)
	ServletContext context;
	
	private static String[] imgCheck= {"png","PNG","jpg","JPG"};
	private static String[] videoCheck = {"mp4","MP4"};

	// ################# 페이지 요청 #################
	// 영화 스케줄 페이지
	@GetMapping("/movieschedule")
	public String schedulePage(Model model, HttpSession session) {
		model.addAttribute("movieNames", service.getMovieNames());
		return "/admin/movieschedule";
	}

	// 전광판 등록 페이지
	@GetMapping("/billboard")
	public String getBillboardPage(HttpSession session) {
		return "/admin/billboard";
	}

	// 좌석 예매 현황 페이지
	@GetMapping("/seatnow")
	public String schedulePage(HttpSession session) {
		return "/admin/nowseatstatus";
	}

	// 영화 등록 페이지
	@GetMapping("/movieupdatepage")
	public String movieUpdatePage(HttpSession session) {
		return "/admin/movieupdate";
	}

	// 회원관리 페이지
	@GetMapping("/membermanage")
	public String memberManagePage(Model model, HttpSession session) {
		model.addAttribute("memberVO", service.getMemberManageList());
		return "/admin/membermanage";
	}

	// 영화 상영 상태 관리 페이지
	@GetMapping("/moviemanage")
	public String getMovieManagePage(HttpSession session) {
		return "/admin/moviemanage";
	}

	// 대시보드 페이지
	@GetMapping("/dashboard")
	public String dashboardPage(HttpSession session) {
		return "/admin/dashboard";
	}

	// 문의 답변 페이지
	@GetMapping("/service")
	public String getServicepage(HttpSession session) {
		return "/admin/service";
	}
	
	// ################# 기능 요청 #################
	// 날짜별 스케줄 리스트 반환
	@GetMapping("/getScheduleList")
	@ResponseBody
	public List<ScheduleWithMovieVO> getScheduleList(String date, HttpSession session, HttpServletRequest request)
			throws RuntimeException {
		return service.getSCM(date);
	}

	// 영화정보 조회
	@GetMapping("getMovieDetail")
	@ResponseBody
	public MovieVO getMovieDetail(String movieCode, HttpSession session, HttpServletRequest request)
			throws RuntimeException {
		return service.getMovieDetailInfo(movieCode);
	}

	// 스케줄 업로드
	@PostMapping("/uploadschedule")
	@ResponseBody
	public List<ScheduleWithMovieVO> uploadSchedule(ScheduleVO vo, String sd, HttpSession session,
			HttpServletRequest request) throws RuntimeException {
		service.upSchedule(vo, sd);
		return service.getSCM(sd);
	}

	// 스케줄 삭제
	@GetMapping("/removeschedule")
	@ResponseBody
	public List<ScheduleWithMovieVO> uploadSchedule(String scheduleDate, String scheduleStart, String scheduleScreen,
			HttpSession session, HttpServletRequest request) throws RuntimeException {
		service.removeSchedule(scheduleDate, scheduleStart, scheduleScreen);
		return service.getSCM(scheduleDate);
	}

	// 좌석 예매 현황 조회
	@GetMapping("/nowSeatStatus")
	@ResponseBody
	public List<ScheduleWithMovieVO> getSeatStatus(String scheduleDate, HttpSession session, HttpServletRequest request)
			throws RuntimeException {
		return service.getSeatStatus(scheduleDate);
	}

	// 영화 업로드
	@PostMapping("/movieupload")
	public String updateMovieData(MultipartFile[] imageFiles, MultipartFile[] videoFiles, MultipartFile wideposter,
			MultipartFile poster, Model model, MovieVO mvo, HttpSession session) {
		
		int result = service.uploadMovie(imageFiles, videoFiles, wideposter, poster, mvo,
				context.getRealPath(context.getInitParameter("uploadPath")));
		if (result == 1) {
			return "/admin/movieschedule";
		} else {
			return "redirect:/common/exception";
		}
	}
	
	// 영화 상태 관리 페이지 영화리스트 요청
	@GetMapping("/moviemanagelist")
	@ResponseBody
	public List<MovieVO> getMovieManage(int pageNum, HttpSession session, HttpServletRequest request)
			throws RuntimeException {
		return service.getMovieManageList(pageNum);
	}

	// 영화 상태 수정 ( 상영, 비상영 )
	@GetMapping("/movieIsshowChange")
	@ResponseBody
	public MovieVO movieChangeIsshow(String movieCode, HttpSession session, HttpServletRequest request)
			throws RuntimeException {
		MovieVO mvo = new MovieVO();
		mvo.setMovieCode(movieCode);
		return service.changeMovieIsshow(mvo);
	}
	
	// 영화진흥원 제공 총 관람관객 최근 데이터로 업로드하는 요청
	@GetMapping("/changetotalview")
	@ResponseBody
	public int chagneTotalView(MovieVO mvo, HttpSession session) throws RuntimeException {
		int result = service.changeTotalView(mvo);

		return result;
	}

	// 고객센터 1:1문의 리스트 조회
	@GetMapping("/servicelist")
	@ResponseBody
	public List<ServiceVO> getServiceList(SearchInfo sInfo, HttpSession session, HttpServletRequest request)
			throws RuntimeException {
		List<ServiceVO> list = service.getServiceList(sInfo);
		return list;
	}

	// 1:1문의 정보 ( 제목, 내용 , 작성자 등등.. )
	@GetMapping("/serviceinfo")
	@ResponseBody
	public ServiceWithImg getServiceInfo(int serviceNo, HttpSession session, HttpServletRequest request)
			throws RuntimeException {
		return service.getServiceInfo(serviceNo);
	}

	// 1:1문의 답변 등록
	@GetMapping("/upservicecomment")
	@ResponseBody
	public int upServiceComment(ServiceCommentVO scvo, HttpSession session, HttpServletRequest request)
			throws RuntimeException {
		return service.upServiceComment(scvo);
	}
	
	// 메인페이지에서 보일 전광판 업로드
	@PostMapping("/uploadbillboard")
	public String uploardBillboard(MultipartFile billboardimg, String link, String finishDate, HttpSession session) {
		String path = context.getRealPath(context.getInitParameter("uploadPath"));
		if (service.uploadBillboard(billboardimg, link, finishDate, path) != 1) {
			return "redirect:/common/throwable";
		}
		return "redirect:/main";
	}

	// 회원관리 회원정보 검색
	@PostMapping("/searchmember")
	@ResponseBody
	public List<MemberVO> searchMember(MemberSearchDTO msto, HttpSession session, HttpServletRequest request)
			throws RuntimeException {
		return service.SearchMemberList(msto);
	}

	// 회원관리 회원정보 수정
	@ResponseBody
	@PostMapping("/updatemember")
	public MemberVO updateMember(MemberVO mvo, String isshow, HttpSession session, HttpServletRequest request)
			throws RuntimeException {
		return service.updateMemberManage(mvo, isshow);
	}

	// 회원관리 회원 삭제
	@ResponseBody
	@PostMapping("/removemember")
	public boolean removeMember(int userNo, HttpSession session, HttpServletRequest request) throws RuntimeException {
		return service.removeMemberManage(userNo);
	}

	// 회원관리 회원 추가
	@ResponseBody
	@PostMapping("/addmember")
	public List<MemberVO> addMember(MemberVO mvo, String isshow, HttpSession session, HttpServletRequest request)
			throws RuntimeException {
		return service.addMemberManage(mvo, isshow);
	}

}
