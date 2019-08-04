package kr.coo.civ.service;

import java.util.List;

import kr.coo.civ.vo.BillboardVO;
import kr.coo.civ.vo.MovieVO;
import kr.coo.civ.vo.domain.SearchInfo;
import kr.coo.civ.vo.dto.ScheduleWithMovieVO;
import kr.coo.civ.vo.dto.TotalScheduleDTO;

public interface HomeService {
	public List<TotalScheduleDTO> getTotalSchedule(String date);
	public ScheduleWithMovieVO getScheduleSeat(String scCode);
	public List<MovieVO> getFrontMainMovie();
	public List<BillboardVO> getBillboardList();
	public List<MovieVO> getMainMovieList(SearchInfo type);
	public List<MovieVO> getMainMoviePosterList();
}
