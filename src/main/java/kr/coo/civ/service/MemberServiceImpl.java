package kr.coo.civ.service;

import java.io.File;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.coo.civ.mapper.MemberMapper;
import kr.coo.civ.util.FileUtil;
import kr.coo.civ.vo.MemberDibsVO;
import kr.coo.civ.vo.MemberShipVO;
import kr.coo.civ.vo.MemberVO;
import kr.coo.civ.vo.MovieVO;
import kr.coo.civ.vo.ServiceVO;
import kr.coo.civ.vo.domain.SearchInfo;
import kr.coo.civ.vo.dto.PaymentWithMovieDTO;
import kr.coo.civ.vo.dto.ServiceWithScommentWithSImgDTO;
import lombok.Setter;

@Service
public class MemberServiceImpl implements MemberService {

	@Setter(onMethod_=@Autowired)
	private MemberMapper mapper;
	
	private String[] imgCheck = { ".JPG", ".jpg",".PNG",".png" };
	
	@Override
	@Transactional
	public int newMemberShip(MemberShipVO msv) {
		int result = 0;
		
		if(mapper.insertMemberShipInfo(msv) >0 | mapper.insertMemberShipGrade(msv) > 0) {
			result = 1;
		}else {
			result = -1;
		}
		
		return result;
	}

	@Override
	public int getUserPoint(int userNo) {
		Integer result = mapper.selectUserPoint(userNo);
		if(result == null) {
			result = -1;
		}
		return result;
	}

	@Override
	public MemberShipVO getMyinfo(int userNo) {
		return mapper.selectMyinfo(userNo);
	}

	@Override
	public List<ServiceVO> getServiceList(int userNo) {
		return mapper.selectServiceList(userNo);
	}

	@Override
	public ServiceWithScommentWithSImgDTO getServiceInfo(int serviceNo) {
		return mapper.selectServiceInfo(serviceNo);
	}

	@Override
	public List<PaymentWithMovieDTO> getMyPayment(int userNo, SearchInfo sinfo) {
		return mapper.selectMyPayment(userNo, sinfo);
	}

	@Override
	public String getMemberShipJoinCheck(int userNo) {
		return mapper.selectMemberShipJoinCheck(userNo);
	}
	
	@Override
	public int changeUserNick(String changeNick, int userNo) {
		int result = 0;
		if(mapper.updateUserNick(changeNick, userNo) > 0) {
			result = 1;
		}else {
			result = -1;
		}
		return result;
	}

	@Override
	public int changeProfile(MultipartFile proFile, String path,int userNo,MemberVO user) {
		String profileName = proFile.getOriginalFilename();
		int strIndex = profileName.lastIndexOf(".");
		String ext = profileName.substring(strIndex);
		Arrays.sort(imgCheck);
		if(Arrays.binarySearch(imgCheck, ext) <= 0) return -1;
		profileName = FileUtil.rename(path, profileName);
		File saveProfile = new File(path,profileName);
		int result = 0;
		if(mapper.updateUserProfile(profileName, userNo) > 0) {
			try {	
				proFile.transferTo(saveProfile);
				user.setUserProfile(profileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
			result = 1;
		}else {
			result = -1;
		}
		return result;
	}
	
	@Override
	public List<MemberDibsVO> getMyDibsList(int userNo) {
		return mapper.selectMyDibsList(userNo);
	}

	@Override
	public int removeDibs(int dibsNo) {
		int result = 0;
		if(mapper.deleteDibs(dibsNo) > 0) {
			result = 1;			
		}else {
			result = -1;
		}
		return result;
	}

	@Override
	public MovieVO getRandomMovie() {
		return mapper.selectRandomMovie();
	}

}
