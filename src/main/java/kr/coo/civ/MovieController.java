package kr.coo.civ;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.coo.civ.service.MovieDetailService;
import kr.coo.civ.service.MoviePageService;
import kr.coo.civ.util.Encryption;
import kr.coo.civ.vo.MemberDibsVO;
import kr.coo.civ.vo.MemberVO;
import kr.coo.civ.vo.MovieCommentVO;
import kr.coo.civ.vo.MovieVO;
import kr.coo.civ.vo.domain.Criteria;
import kr.coo.civ.vo.domain.PageingInfo;
import kr.coo.civ.vo.dto.MovieDetailDTO;
import kr.coo.civ.vo.dto.ThumbsInfoDTO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/movie/*")
public class MovieController {

	@Setter(onMethod_=@Autowired)
	private MovieDetailService service;
	
	@Setter(onMethod_=@Autowired)
	private MoviePageService mservice;

	// ################# 페이지 요청 #################
	// 영화 상세보기 페이지 ( 모달창 )
	@GetMapping("/moviedetail")
	public void movieDetailPage(String movieCode,Model model,HttpSession session,HttpServletRequest request) {
		MemberVO userVo = (MemberVO)session.getAttribute("loginInfo");
		MovieDetailDTO mddto = null;
		int ss = 0;
		if(userVo != null) {
			mddto = service.getMovieDetail(new Criteria(), movieCode,null,userVo.getUserNo());	
			ss = service.checkDibs(movieCode,userVo.getUserNo());
		}else {
			ThumbsInfoDTO thumbs = new Encryption().getEncryption(request, new ThumbsInfoDTO());
			mddto = service.getMovieDetail(new Criteria(), movieCode,thumbs.getMd5ip(),thumbs.getUserNo());	
		}
		model.addAttribute("mddto",mddto);
		model.addAttribute("dibsCheck",ss);
		model.addAttribute("pageMaker",new PageingInfo(mddto.getCri()));
	}
	
	// 영화 상세보기 페이지 ( 일반 페이지 )
	@GetMapping("/moviedetailpage2")
	public void movieDetailPage2(String movieCode,Model model,HttpSession session,HttpServletRequest request) {
		MemberVO userVo = (MemberVO)session.getAttribute("loginInfo");
		MovieDetailDTO mddto = null;
		int ss = 0;
		if(userVo != null) {
			mddto = service.getMovieDetail(new Criteria(), movieCode,null,userVo.getUserNo());	
			ss = service.checkDibs(movieCode,userVo.getUserNo());
		}else {
			ThumbsInfoDTO thumbs = new Encryption().getEncryption(request, new ThumbsInfoDTO());
			mddto = service.getMovieDetail(new Criteria(), movieCode,thumbs.getMd5ip(),thumbs.getUserNo());	
		}
		model.addAttribute("mddto",mddto);
		model.addAttribute("dibsCheck",ss);
		model.addAttribute("pageMaker",new PageingInfo(mddto.getCri()));
	}
	
	
	// ################# 기능 요청 #################
	// 댓글 페이지 호출
	@GetMapping("/pagechange")
	@ResponseBody
	public MovieDetailDTO pageChange(String movieCode,Criteria cri,HttpSession session,HttpServletRequest request) {
		MemberVO userVo = (MemberVO)session.getAttribute("loginInfo");
		MovieDetailDTO mddto = null;
		if(userVo != null) {
			mddto = service.getCommentDTO(cri, movieCode,null,userVo.getUserNo());
			System.out.println(mddto);
		}else {
			ThumbsInfoDTO thumbs = new Encryption().getEncryption(request, new ThumbsInfoDTO());
			mddto = service.getCommentDTO(cri, movieCode,thumbs.getMd5ip(),0);
		}
		return mddto;
	}
	
	// 트레일러
	@ResponseBody
	@GetMapping("/imgvideo")
	public MovieDetailDTO getImgVideo(String movieCode,String imgVideo) {
		return service.getImgVideo(movieCode, imgVideo);
	}
	
	// 댓글 작성
	@PostMapping("/commentwrite")
	@ResponseBody
	public String commentWrite(MovieCommentVO cvo,String movieCode,HttpSession session) {
		MemberVO userVo = (MemberVO)session.getAttribute("loginInfo");
		String userId = userVo.getUserId();
		System.err.println(cvo.getCommentContent()+cvo.getCommentStar()+movieCode+userId);
		String re = service.writeMovieComment(userId, movieCode, cvo);
		System.err.println(re);
		return re;
	}
	
	// 추천
	@ResponseBody
	@GetMapping("/thumbsup")
	public String thumbsup(ThumbsInfoDTO thumbs,HttpSession session,HttpServletRequest request) {
		MemberVO nowMem = (MemberVO) session.getAttribute("loginInfo");
		if(nowMem == null) {
			thumbs = new Encryption().getEncryption(request, thumbs);
		}else {
			thumbs.setUserNo(nowMem.getUserNo());
		}
		System.err.println(thumbs);
		int result = service.thumbsChange(thumbs);
	      
	    return thumbs.getCheck();
	}
	
	// 영화 찜하기
	@GetMapping("/moviedibs")
	@ResponseBody
	public String movieDibs(String movieCode,HttpSession session) {
		MemberVO nowMem = (MemberVO) session.getAttribute("loginInfo");
		System.err.println(movieCode);
		MemberDibsVO mdv = new MemberDibsVO();
		String result = "";
		if(nowMem == null) {
			result = "loginPlz";
		}else {
			mdv.setDibsMovieCode(movieCode);
			mdv.setUserNo(nowMem.getUserNo());
			if(service.dibsChange(mdv) > 0) {
				result = mdv.getCheck();
			}else {
				result = "DibsError";
			}
		}
		System.err.println(result);
		return result;
	}
	
	
	
	/**
	 * 
	 * 
	 * @author HJS
	 * @since 2019.07.18
	 * @version 1.0
	 * @see 영화 페이지 LIST 보기, ajax 플러스 버튼, HOME 버튼, 상영예정작 보기 버튼 구현 하기위해 작성함.
	 *
	 */	
	
	
	
	// 영화 페이지 메인
	@GetMapping("/moviepage")
	public ModelAndView moviePage(ModelAndView mv) {
		ArrayList<MovieVO> list = (ArrayList<MovieVO>)mservice.selMovieList();
		int vimg = 7;
		mv.addObject("LIST", list);
		mv.addObject("VIMG", vimg);
		return mv;
	}
	
	// + 버튼 더 보기..
	@GetMapping("/showallimg")
	@ResponseBody
	public List<MovieVO> showallImg(MovieVO mvVO) {
		return mservice.selMovieList();
	}
	
	// HOME 버튼 돌려놔
	@GetMapping("/moviehome")
	@ResponseBody
	public List<MovieVO> movieHome(MovieVO mvVO) {
		return mservice.selMovieList();
	}
	
	// 상영 예정작 보기..
	@GetMapping("/moviesoon")
	@ResponseBody
	public List<MovieVO> moviesoon(MovieVO mvVO) {
		return mservice.selMovieSoon();
	}
	
}