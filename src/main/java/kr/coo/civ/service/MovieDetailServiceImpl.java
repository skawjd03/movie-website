package kr.coo.civ.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.coo.civ.mapper.MovieDetailMapper;
import kr.coo.civ.vo.MemberDibsVO;
import kr.coo.civ.vo.MovieCommentVO;
import kr.coo.civ.vo.domain.Criteria;
import kr.coo.civ.vo.domain.PageingInfo;
import kr.coo.civ.vo.dto.MovieDetailDTO;
import kr.coo.civ.vo.dto.ThumbsInfoDTO;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class MovieDetailServiceImpl implements MovieDetailService {

	@Setter(onMethod_=@Autowired)
	private MovieDetailMapper mapper;
	
	@Override
	public MovieDetailDTO getMovieDetail(Criteria cri, String movieCode,String md5ip,int userNo) {
		MovieDetailDTO mddto = new MovieDetailDTO();
		mddto.setMovievo(mapper.selectMovieDetail(movieCode));
		mddto.setCommentvo(mapper.selectMovieCommentList(cri, movieCode,userNo,md5ip));
		mddto.getMovievo().setGrade(mapper.selectMovieGrade(movieCode));
		mddto.setMovieImg(mapper.selectMovieImg(movieCode));
		mddto.setMovieVideo(mapper.selectMovieVideo(movieCode));
		cri.setTotal(mapper.countTotal(movieCode));
		mddto.setCri(cri);
		return mddto;
	}

	@Override
	public MovieDetailDTO getCommentDTO(Criteria cri, String movieCode,String md5ip,int userNo) {
		MovieDetailDTO mddto = new MovieDetailDTO();
		mddto.setCommentvo(mapper.selectMovieCommentList(cri, movieCode,userNo,md5ip));
		cri.setTotal(mapper.countTotal(movieCode));
		mddto.setCri(cri);
		mddto.setPageinfo(new PageingInfo(cri));
		return mddto;
	}

	@Override
	public MovieDetailDTO getImgVideo(String movieCode, String imgVideo) {
		MovieDetailDTO mddto = new MovieDetailDTO();
		if(imgVideo.equals("trailer")) {
			mddto.setMovieVideo(mapper.selectMovieVideo(movieCode));
		}else if(imgVideo.equals("stilcut")) {
			mddto.setMovieImg(mapper.selectMovieImg(movieCode));
		}
		return mddto;
	}

	@Override
	public String writeMovieComment(String userId, String movieCode, MovieCommentVO cvo) {
		String result = "";
		if(mapper.insertMovieComment(userId, movieCode, cvo) <= 0) {
			result = "false";
		}else {
			result = "success";
		}
		return result;
	}

	@Override
	@Transactional
	public int thumbsChange(ThumbsInfoDTO tidto) {
		 int result = 0;
	      
	      if(mapper.insertThumbs(tidto) > 0) {
	         if(mapper.updateLikes(tidto)>0) {
	            result = 1;
	         }else {
	            result = -1;
	         }
	      }else {
	         result = -1;
	      }
	      
	      return result;
	}

	@Override
	public int dibsChange(MemberDibsVO mdv) {
		mdv.setDibsMovieName(mapper.selectMovieDetail(mdv.getDibsMovieCode()).getMovieName());
		int result = 0;
		if(mapper.insertDibs(mdv) > 0) {
			result = 1;
		}else {
			result = -1;
		}
		return result;
	}

	@Override
	public int checkDibs(String movieCode, int userNo) {
		return mapper.selectDibs(movieCode, userNo);
	}
}