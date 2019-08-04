package kr.coo.civ.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.coo.civ.vo.MemberDibsVO;
import kr.coo.civ.vo.MemberShipVO;
import kr.coo.civ.vo.MemberVO;
import kr.coo.civ.vo.MovieVO;
import kr.coo.civ.vo.ServiceVO;
import kr.coo.civ.vo.domain.SearchInfo;
import kr.coo.civ.vo.dto.PaymentWithMovieDTO;
import kr.coo.civ.vo.dto.ServiceWithScommentWithSImgDTO;

public interface MemberService {
	public int newMemberShip(MemberShipVO msv);
	public int getUserPoint(int userNo);
	public MemberShipVO getMyinfo(int userNo);
	public List<ServiceVO> getServiceList(int userNo);
	public ServiceWithScommentWithSImgDTO getServiceInfo(int serviceNo);
	public List<PaymentWithMovieDTO> getMyPayment(int userNo,SearchInfo sinfo);
	public String getMemberShipJoinCheck(int userNo);
	public int changeUserNick(String changeNick,int userNo);
	public int changeProfile(MultipartFile proFile,String path,int userNo,MemberVO user);
	public List<MemberDibsVO> getMyDibsList(int userNo);
	public int removeDibs(int dibsNo);
	public MovieVO getRandomMovie();
}
