package kr.coo.civ.vo.dto;

import java.util.List;

import kr.coo.civ.vo.MovieVO;
import lombok.Data;



/**
 * 
 * 
 * @author HJS
 * @since 2019.07.18
 * @version 1.0
 * @see 영화 페이지 LIST 보기, ajax 플러스 버튼, HOME 버튼, 상영예정작 보기 버튼 구현 하기위해 작성함.
 *
 */	


@Data
public class MoviePageDTO {
	private MovieVO movievo;
	private List<MovieVO> list;	
}
