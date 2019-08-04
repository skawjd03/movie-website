package kr.coo.civ.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.coo.civ.vo.statistics.GenderDTO;
import kr.coo.civ.vo.statistics.JoinUserCountDTO;
import kr.coo.civ.vo.statistics.ReserveRateDTO;
import kr.coo.civ.vo.statistics.SalesDTO;
import kr.coo.civ.vo.statistics.VisitorCountDTO;

public interface StatisticsMapper {
	public List<GenderDTO> selectGenderData();
	public List<JoinUserCountDTO> selectJoinUserCountData();
	public List<SalesDTO> selectSalesData();
	public List<ReserveRateDTO> selectReserveRateData();
	public int updateVisitorCount(@Param("logDate") String logDate,@Param("dbcnt") String dbcnt);
	public List<VisitorCountDTO> selectVisitorCount();
}
