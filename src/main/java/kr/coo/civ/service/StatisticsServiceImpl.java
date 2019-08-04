package kr.coo.civ.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.coo.civ.mapper.StatisticsMapper;
import kr.coo.civ.vo.statistics.DashboardDTO;
import kr.coo.civ.vo.statistics.GenderDTO;
import kr.coo.civ.vo.statistics.JoinUserCountDTO;
import kr.coo.civ.vo.statistics.ReserveRateDTO;
import kr.coo.civ.vo.statistics.SalesDTO;
import kr.coo.civ.vo.statistics.VisitorCountDTO;
import lombok.Setter;

@Service
public class StatisticsServiceImpl implements StatisticsService{

	@Setter(onMethod_=@Autowired)
	private StatisticsMapper mapper;
	
	@Override
	public List<GenderDTO> getGenderData() {
		return mapper.selectGenderData();
	}

	@Override
	public List<JoinUserCountDTO> getJoinUserCountData() {
		return mapper.selectJoinUserCountData();
	}

	@Override
	public List<SalesDTO> getSalesData() {
		return mapper.selectSalesData();
	}

	@Override
	public List<ReserveRateDTO> getReserveRateData() {
		return mapper.selectReserveRateData();
	}

	@Override
	public int setVisitorCount(String logDate,String dbcnt) {
		return mapper.updateVisitorCount(logDate,dbcnt);
	}

	@Override
	public List<VisitorCountDTO> getVisitorCount() {
		return mapper.selectVisitorCount();
	}

	@Override
	public DashboardDTO getDashboardInfos() {
		DashboardDTO ddto = new DashboardDTO();
		ddto.setGenderInfo(mapper.selectGenderData());
		ddto.setJoinUserCountInfo(mapper.selectJoinUserCountData());
		ddto.setReserveRateInfo(mapper.selectReserveRateData());
		ddto.setSalesInfo(mapper.selectSalesData());
		ddto.setVisitorCountInfo(mapper.selectVisitorCount());
		return ddto;
	}

}
