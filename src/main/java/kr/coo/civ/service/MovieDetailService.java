package kr.coo.civ.service;

import kr.coo.civ.vo.MemberDibsVO;
import kr.coo.civ.vo.MovieCommentVO;
import kr.coo.civ.vo.domain.Criteria;
import kr.coo.civ.vo.dto.MovieDetailDTO;
import kr.coo.civ.vo.dto.ThumbsInfoDTO;

public interface MovieDetailService {
	public MovieDetailDTO getMovieDetail(Criteria cri,String movieCode,String md5ip,int userNo); 
	public MovieDetailDTO getCommentDTO(Criteria cri,String movieCode,String md5ip,int userNo);
	public MovieDetailDTO getImgVideo(String movieCode,String imgVideo);
	public String writeMovieComment(String userId,String movieCode,MovieCommentVO cvo);
	public int thumbsChange(ThumbsInfoDTO tidto);
	
	public int dibsChange(MemberDibsVO mdv); 
	public int checkDibs(String movieCode,int userNo);
}
