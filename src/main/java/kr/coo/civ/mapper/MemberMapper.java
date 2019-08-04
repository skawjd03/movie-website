package kr.coo.civ.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.coo.civ.vo.MemberDibsVO;
import kr.coo.civ.vo.MemberShipVO;
import kr.coo.civ.vo.MovieVO;
import kr.coo.civ.vo.ServiceVO;
import kr.coo.civ.vo.domain.SearchInfo;
import kr.coo.civ.vo.dto.PaymentWithMovieDTO;
import kr.coo.civ.vo.dto.ServiceWithScommentWithSImgDTO;

public interface MemberMapper {
	public int insertMemberShipInfo(MemberShipVO msv);
	public int insertMemberShipGrade(MemberShipVO msv);
	public Integer selectUserPoint(int userNo);
	public MemberShipVO selectMyinfo(int userNo);
	public List<ServiceVO> selectServiceList(int userNo);
	public ServiceWithScommentWithSImgDTO selectServiceInfo(int serviceNo);
	public List<PaymentWithMovieDTO> selectMyPayment(@Param("userNo") int userNo,@Param("sinfo") SearchInfo sinfo);
	public String selectMemberShipJoinCheck(int userNo);
	public int updateUserNick(@Param("changeNick")String changeNick,@Param("userNo")int userNo);
	public int updateUserProfile(@Param("profileName")String profileName,@Param("userNo")int userNo);
	
	public List<MemberDibsVO> selectMyDibsList(int userNo);
	public int deleteDibs(int dibsNo);
	public MovieVO selectRandomMovie();
}
