package kr.coo.civ.mapper;

import java.util.List;

import kr.coo.civ.vo.MovieVO;



/**
 * 
 * 
 * @author HJS
 * @since 2019.07.18
 * @version 1.0
 * @see 영화 페이지 LIST 보기, ajax 플러스 버튼, HOME 버튼, 상영예정작 보기 버튼 구현 하기위해 작성함.
 *
 */	


public interface MoviePageMapper {
	public List<MovieVO> selMovieList();
	public List<MovieVO> selMovieSoon();
}
