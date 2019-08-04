package kr.coo.civ.vo.dto;

import java.util.List;

import kr.coo.civ.vo.MovieImgVO;
import kr.coo.civ.vo.MovieVO;
import kr.coo.civ.vo.MovieVideoVO;
import kr.coo.civ.vo.domain.Criteria;
import kr.coo.civ.vo.domain.PageingInfo;
import lombok.Data;

@Data
public class MovieDetailDTO {
	private MovieVO movievo;
	private List<MovieCommentWithMemberDTO> commentvo;
	private List<MovieImgVO> movieImg;
	private List<MovieVideoVO> movieVideo;
	private Criteria cri;
	private PageingInfo pageinfo;
}