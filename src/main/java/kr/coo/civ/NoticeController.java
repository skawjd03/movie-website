package kr.coo.civ;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import kr.coo.civ.mapper.NoticeDAO;
import kr.coo.civ.service.ServiceService;
import kr.coo.civ.vo.BranchVO;
import kr.coo.civ.vo.MemberVO;
import kr.coo.civ.vo.domain.PageUtil;
import kr.coo.civ.vo.dto.NoticeDTO;
import kr.coo.civ.vo.dto.ServiceDTO;
import kr.coo.civ.vo.dto.ServiceImgDTO;
import lombok.Setter;

@Controller
@RequestMapping("/Notice")
public class NoticeController {
	
	@Autowired
	NoticeDAO noticeDAO;
	
	@Autowired
	ServiceService svcImg;
	
	@Setter(onMethod_ = @Autowired)
	ServletContext context;
	
	public static final int BLOCK_LIST = 10;
	public static final int BLOCK_PAGE = 3;
	
	@RequestMapping("/noticeForm.s5")
	public ModelAndView noticeForm(ModelAndView mv) {
		mv.setViewName("service/service");
		return mv;
	}
	
/*
	List<NoticeDTO> list = noticeDAO.noticeTitle();
	mv.addObject("TITLE", list);
*/
	@PostMapping("showNotice.s5")
	@ResponseBody
	public NoticeDTO showNotice(NoticeDTO ntDTO) {
		List<NoticeDTO> list = noticeDAO.noticeTitle();
		ntDTO.setList(list);
		int cnt = list.size();
		return ntDTO;
	}

	
	@RequestMapping("/noticeList.s5")
	@ResponseBody 
	public NoticeDTO noticeList(NoticeDTO ntDTO,HttpServletRequest req) { 
		String strPage = req.getParameter("nowPage");
		int nowPage = 1;
		if(strPage != null) {
			try{
				nowPage = Integer.parseInt(strPage);
			}catch(Exception e) {}
		}
		
		int totalCount = noticeDAO.totalCnt();
		
		PageUtil pUtil = new PageUtil(nowPage, totalCount);
		
		List<NoticeDTO> list= noticeDAO.noticeList(pUtil);
		ntDTO.setpUtil(pUtil);
		ntDTO.setList(list);
	 
		return ntDTO; 
	}

	
	@RequestMapping("/noticeSearch.s5")
	@ResponseBody
	public NoticeDTO noticeSearch(NoticeDTO ntDTO , HttpServletRequest req) {
		String word = ntDTO.getWord();
		
		String strPage = req.getParameter("nowPage");
		
		int nowPage = 1;
		if(strPage != null) {
			try{
				nowPage = Integer.parseInt(strPage);
			}catch(Exception e) {}
		}
		
		int searchTotal = noticeDAO.searchTotal(word);
		
		PageUtil pUtil = new PageUtil(nowPage, searchTotal);
		pUtil.setWord(word);
		
		
		List<NoticeDTO> list= noticeDAO.noticeSearch(pUtil);
		
		
		ntDTO.setpUtil(pUtil);
		ntDTO.setList(list);
		ntDTO.setIsSearch("Y");
		return ntDTO;
	}
	
	@RequestMapping("/noticeDetail.s5")
	public ModelAndView noticeDetail(ModelAndView mv,NoticeDTO ntDTO, RedirectView rv) {
		
		int no = ntDTO.getN_no();
		System.out.println(no);
		// hit +1
		int cnt = noticeDAO.noticeHit(no);
		System.out.println(cnt);
		NoticeDTO ntDTO1 = noticeDAO.noticeDetail(no-1);
		NoticeDTO ntDTO2 = noticeDAO.noticeDetail(no+1);
		ntDTO = noticeDAO.noticeDetail(no);
		
		mv.addObject("DATA1", ntDTO1);
		mv.addObject("DATA", ntDTO);
		mv.addObject("DATA2", ntDTO2);
		
		mv.setViewName("service/serviceNoticeDetail");
		return mv;
	}
	
	@RequestMapping("/map.s5")
	public ModelAndView getMap(ModelAndView mv) {
		String branch = "����";
		BranchVO bDTO = noticeDAO.branchInfo(branch);
		
		mv.addObject("DATA",bDTO);
		mv.setViewName("service/map");
		return mv;
	}
	
	@RequestMapping("/branchInfo.s5")
	@ResponseBody
	public BranchVO branchInfo(BranchVO BranchVO) {
		String branch = BranchVO.getBr_name();
		
		BranchVO bDTO = noticeDAO.branchInfo(branch);
		return bDTO;
	}
	

	@PostMapping("/qRegister.s5")
	public ModelAndView qRegister(ModelAndView mv, ServiceDTO svcDTO, ServiceImgDTO serviceImgDTO, RedirectView rv,HttpSession session) {
		System.out.println("1.s_img : " + serviceImgDTO.getS_img()[0].getName());
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		if(loginInfo == null) {
			rv.setUrl("/civ/auth/login");
			mv.setView(rv);
			return mv;
		}
		svcDTO.setU_no(loginInfo.getUserNo());
		int cnt = noticeDAO.questionRegistor(svcDTO);
		if(cnt != 1) {
			rv.setUrl("noticeForm.s5");
			mv.setView(rv);
			return mv;
		}
		
		int imgcnt = serviceImgDTO.getS_img().length;
		serviceImgDTO.setU_no(svcDTO.getU_no());
		
		for(int i = 0 ; i < imgcnt; i++) {
			serviceImgDTO = svcImg.uploadProc(serviceImgDTO.getS_img()[i], serviceImgDTO,context.getRealPath(context.getInitParameter("uploadPath")),context.getInitParameter("uploadPath"));
			int upimg = noticeDAO.questionImg(serviceImgDTO);
			System.out.println( (i+1) + "��° �̹��� ��� �Ϸ� ");
		}
		
		rv.setUrl("../");
		mv.setView(rv);
		
		return mv;
	};
	
	
}
