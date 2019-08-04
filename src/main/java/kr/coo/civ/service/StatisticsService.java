package kr.coo.civ.service;

import java.util.List;

import kr.coo.civ.vo.statistics.DashboardDTO;
import kr.coo.civ.vo.statistics.GenderDTO;
import kr.coo.civ.vo.statistics.JoinUserCountDTO;
import kr.coo.civ.vo.statistics.ReserveRateDTO;
import kr.coo.civ.vo.statistics.SalesDTO;
import kr.coo.civ.vo.statistics.VisitorCountDTO;

public interface StatisticsService {
	public List<GenderDTO> getGenderData();
	public List<JoinUserCountDTO> getJoinUserCountData();
	public List<SalesDTO> getSalesData();
	public List<ReserveRateDTO> getReserveRateData();
	public int setVisitorCount(String logDate,String dbcnt);
	public List<VisitorCountDTO> getVisitorCount();
	public DashboardDTO getDashboardInfos();
}
