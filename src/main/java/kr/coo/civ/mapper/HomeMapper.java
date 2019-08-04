package kr.coo.civ.mapper;

import java.util.List;

import kr.coo.civ.vo.BillboardVO;
import kr.coo.civ.vo.MovieVO;
import kr.coo.civ.vo.domain.SearchInfo;
import kr.coo.civ.vo.dto.ScheduleWithMovieVO;
import kr.coo.civ.vo.dto.TotalScheduleDTO;

public interface HomeMapper {

	public List<TotalScheduleDTO> getTotalSchedule(String date);
	public ScheduleWithMovieVO selectScheduleSeat(String scCode);
	public List<MovieVO> selectFrontMainMovie();
	public List<BillboardVO> selectBillboardList();
	public List<MovieVO> selectMainMovieList(SearchInfo type);
	public List<MovieVO> selectMainMoviePosterList();
	
}
