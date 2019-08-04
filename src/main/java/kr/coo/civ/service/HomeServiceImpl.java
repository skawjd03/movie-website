package kr.coo.civ.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.coo.civ.mapper.HomeMapper;
import kr.coo.civ.vo.BillboardVO;
import kr.coo.civ.vo.MovieVO;
import kr.coo.civ.vo.domain.SearchInfo;
import kr.coo.civ.vo.dto.ScheduleWithMovieVO;
import kr.coo.civ.vo.dto.TotalScheduleDTO;
import lombok.Setter;

@Service
public class HomeServiceImpl implements HomeService{

	@Setter(onMethod_=@Autowired)
	private HomeMapper mapper;

	@Override
	public List<TotalScheduleDTO> getTotalSchedule(String date) {
		List<TotalScheduleDTO> list = mapper.getTotalSchedule(date);
		return list;
	}

	@Override
	public ScheduleWithMovieVO getScheduleSeat(String scCode) {
		return mapper.selectScheduleSeat(scCode);
	}

	@Override
	public List<MovieVO> getFrontMainMovie() {
		return mapper.selectFrontMainMovie();
	}

	@Override
	public List<BillboardVO> getBillboardList() {
		return mapper.selectBillboardList();
	}

	@Override
	public List<MovieVO> getMainMovieList(SearchInfo type) {
		return mapper.selectMainMovieList(type);
	}

	@Override
	public List<MovieVO> getMainMoviePosterList() {
		return mapper.selectMainMoviePosterList();
	}
	
}
