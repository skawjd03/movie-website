package kr.coo.civ.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.coo.civ.mapper.MoviePageMapper;
import kr.coo.civ.vo.MovieVO;
import kr.coo.civ.vo.domain.Criteria;
import kr.coo.civ.vo.dto.MovieDetailDTO;
import kr.coo.civ.vo.dto.MoviePageDTO;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

/**
 * 
 * 
 * @author HJS
 * @since 2019.07.18
 * @version 1.0
 * @see 영화 페이지 LIST 보기, ajax 플러스 버튼, HOME 버튼, 상영예정작 보기 버튼 구현 하기위해 작성함.
 *
 */	



@Service
@Log4j
public class MoviePageServicempl implements MoviePageService {
	@Setter(onMethod_=@Autowired)
	private MoviePageMapper mapper;
	
	// 영화 리스트 전체 보기
	@Override
	public List<MovieVO> selMovieList() {
		
		return mapper.selMovieList();
	}
	
	// 상영예정작 영화  보기
	@Override
	public List<MovieVO> selMovieSoon(){
			
		return mapper.selMovieSoon();
	}

}
