package kr.coo.civ.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.coo.civ.vo.MemberDibsVO;
import kr.coo.civ.vo.MovieCommentVO;
import kr.coo.civ.vo.MovieImgVO;
import kr.coo.civ.vo.MovieVO;
import kr.coo.civ.vo.MovieVideoVO;
import kr.coo.civ.vo.domain.Criteria;
import kr.coo.civ.vo.dto.MovieCommentWithMemberDTO;
import kr.coo.civ.vo.dto.ThumbsInfoDTO;

public interface MovieDetailMapper {
	public MovieVO selectMovieDetail(String movieCode);
	public List<MovieCommentWithMemberDTO> selectMovieCommentList(@Param("cri")Criteria cri,@Param("movieCode")String movieCode,@Param("userNo")int userNo,@Param("md5ip")String md5ip);
	public int countTotal(String movieCode);
	public float selectMovieGrade(String movieCode);
	public List<MovieImgVO> selectMovieImg(String movieCode);
	public List<MovieVideoVO> selectMovieVideo(String movieCode);
	public int insertMovieComment(@Param("userId")String userId,@Param("movieCode")String movieCode,@Param("cvo")MovieCommentVO cvo);
	
	public int updateLikes(ThumbsInfoDTO tidto);
	public int insertThumbs(ThumbsInfoDTO tidto);
	
	public int insertDibs(MemberDibsVO mdv);
	public int selectDibs(@Param("movieCode")String movieCode,@Param("userNo")int userNo);
}
