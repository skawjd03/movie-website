package kr.coo.civ.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.coo.civ.vo.MemberVO;
import kr.coo.civ.vo.MovieVO;
import kr.coo.civ.vo.ScheduleVO;
import kr.coo.civ.vo.ServiceCommentVO;
import kr.coo.civ.vo.ServiceVO;
import kr.coo.civ.vo.domain.SearchInfo;
import kr.coo.civ.vo.dto.MemberSearchDTO;
import kr.coo.civ.vo.dto.ScheduleWithMovieVO;
import kr.coo.civ.vo.dto.ServiceWithImg;

public interface ManageMapper {

	public List<ScheduleWithMovieVO> selectSCM(String scheduleDate);

	public List<MovieVO> selectMovieNames();

	public MovieVO selectMovieDetailInfo(String movieCode);

	public int insertSchedule(@Param("schedule") ScheduleVO schedule, @Param("sd") String sd);

	public int deleteSchedule(@Param("scheduleDate") String scheduleDate, @Param("scheduleStart") String scheduleStart,
			@Param("scheduleScreen") String scheduleScreen);

	public int selectMovieRank(String movieCode);

	public float selectMovieGrade(String movieCode);

	public List<ScheduleWithMovieVO> selectSeatStatus(String scheduleDate);

	public int insertMovie(MovieVO vo);

	public int insertMovieImg(@Param("movieCode") String movieCode, @Param("movieImg") String movieImg);

	public int insertMovieVideo(@Param("movieCode") String movieCode, @Param("movieVideo") String movieVideo);

	public List<MovieVO> selectManageList(@Param("startNum") int startNum, @Param("finishNum") int finishNum);

	public int updateMovieIsshow(MovieVO mvo);

	public int updateTotalView(MovieVO mvo);

	public List<MemberVO> selectMemberManageList();

	public List<MemberVO> selectSearchMemberList(MemberSearchDTO msto);

	public int updateMemberManage(@Param("mvo") MemberVO mvo, @Param("isshow") String isshow);

	public MemberVO selectOneMember(int userNo);

	public int deleteMember(int userNo);

	public int insertMember(@Param("mvo") MemberVO mvo, @Param("isshow") String isshow);
	
	public List<ServiceVO> selectServiceList(SearchInfo sInfo);

	public ServiceWithImg selectServiceInfo(int serviceNo);

	public int insertServiceComment(ServiceCommentVO scvo);

	public int updateServiceReplyCheck(int serviceNo);

	public int rereplycheck(int serviceNo);
	
	public int insertBillboard(@Param("billboardImg") String billboardImg,@Param("billboardLink") String billboardLink,@Param("finishDate") String finishDate);
}
