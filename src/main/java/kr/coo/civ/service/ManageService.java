package kr.coo.civ.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.coo.civ.vo.MemberVO;
import kr.coo.civ.vo.MovieVO;
import kr.coo.civ.vo.ScheduleVO;
import kr.coo.civ.vo.ServiceCommentVO;
import kr.coo.civ.vo.ServiceVO;
import kr.coo.civ.vo.domain.SearchInfo;
import kr.coo.civ.vo.dto.MemberSearchDTO;
import kr.coo.civ.vo.dto.ScheduleWithMovieVO;
import kr.coo.civ.vo.dto.ServiceWithImg;

public interface ManageService {
	public List<ScheduleWithMovieVO> getSCM(String scheduleDate);
	public List<MovieVO> getMovieNames();
	public MovieVO getMovieDetailInfo(String movieCode);
	public int upSchedule(ScheduleVO schedule, String sd);
	public int removeSchedule(String scheduleDate, String scheduleStart, String scheduleScreen);
	public List<ScheduleWithMovieVO> getSeatStatus(String scheduleDate);
	public int uploadMovie(MultipartFile[] imageFiles, MultipartFile[] videoFiles, MultipartFile wideposter,MultipartFile poster, MovieVO mvo, String downPath,String dbPath);
	public List<MovieVO> getMovieManageList(int pageNum);
	public MovieVO changeMovieIsshow(MovieVO mvo);
	public int changeTotalView(MovieVO mvo);
	public List<ServiceVO> getServiceList(SearchInfo sInfo);
	public ServiceWithImg getServiceInfo(int serviceNo);
	public int upServiceComment(ServiceCommentVO scvo);
	public List<MemberVO> getMemberManageList();
	public List<MemberVO> SearchMemberList(MemberSearchDTO msto);
	public MemberVO updateMemberManage(MemberVO mvo, String isshow);
	public boolean removeMemberManage(int userNo);
	public List<MemberVO> addMemberManage(MemberVO mvo, String isshow);
	public int uploadBillboard(MultipartFile billboardimg,String link,String finishDate,String path);
}
