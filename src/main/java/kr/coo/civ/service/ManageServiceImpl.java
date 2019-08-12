package kr.coo.civ.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.coo.civ.mapper.ManageMapper;
import kr.coo.civ.util.FileUtil;
import kr.coo.civ.util.StringDateHelper;
import kr.coo.civ.vo.MemberVO;
import kr.coo.civ.vo.MovieVO;
import kr.coo.civ.vo.ScheduleVO;
import kr.coo.civ.vo.ServiceCommentVO;
import kr.coo.civ.vo.ServiceVO;
import kr.coo.civ.vo.domain.SearchInfo;
import kr.coo.civ.vo.dto.MemberSearchDTO;
import kr.coo.civ.vo.dto.ScheduleWithMovieVO;
import kr.coo.civ.vo.dto.ServiceWithImg;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ManageServiceImpl implements ManageService {

	@Setter(onMethod_ = @Autowired)
	private ManageMapper mapper;

	private String[] imgCheck = { ".JPG", ".jpg",".PNG",".png" };
	private String[] videoCheck = { ".MP4",".mp4" };

	public ScheduleWithMovieVO getSWMV(String start, String finish, int screen) {
		ScheduleWithMovieVO swmv = new ScheduleWithMovieVO();
		ScheduleVO ssvo = new ScheduleVO();
		ssvo.setScheduleStart(start);
		ssvo.setScheduleFinish(finish);
		ssvo.setScheduleScreen(screen + "관");
		MovieVO mmvo = new MovieVO();
		swmv.setMovie(mmvo);
		swmv.setSchedule(ssvo);
		return swmv;
	}

	@Override
	public List<ScheduleWithMovieVO> getSCM(String scheduleDate) {
		List<ScheduleWithMovieVO> realList = new ArrayList<ScheduleWithMovieVO>();
		List<ScheduleWithMovieVO> list = mapper.selectSCM(scheduleDate);
		String formatStr = "yyyy/MM/dd-HH:mm";
		String time = scheduleDate + "-06:00";
		int screen = 1;

		if (list.size() == 0) {
			for (int i = 1; i < 8; i++) {
				realList.add(getSWMV(scheduleDate + "-06:00",
						StringDateHelper.oneDatePlus(scheduleDate + "-02:00", formatStr), i));
			}
			return realList;
		}

		for (int i = 0; i < list.size(); i++) {
			ScheduleVO svo = list.get(i).getSchedule();
			int nowScreen = Integer.parseInt(svo.getScheduleScreen().substring(0, 1));
			String nowStart = svo.getScheduleStart();
			String nowFinish = svo.getScheduleFinish();
			if (screen != nowScreen) {
				time = scheduleDate + "-06:00";
				if (realList.size() != 0 & !StringDateHelper.oneDatePlus(scheduleDate + "-02:00", formatStr)
						.equals(realList.get(realList.size() - 1).getSchedule().getScheduleFinish())) {
					String inSt = realList.get(realList.size() - 1).getSchedule().getScheduleFinish();
					String inFin = StringDateHelper.oneDatePlus(scheduleDate + "-02:00", formatStr);
					realList.add(getSWMV(inSt, inFin, screen));
					screen++;
				}
				for (; screen < nowScreen; screen++) {
					String inSt = scheduleDate + "-06:00";
					String inFin = StringDateHelper.oneDatePlus(scheduleDate + "-02:00", formatStr);
					realList.add(getSWMV(inSt, inFin, screen));
				}

			}

			if (!time.equals(nowStart)) {
				realList.add(getSWMV(time, nowStart, screen));
				realList.add(list.get(i));
			} else {
				realList.add(list.get(i));
			}
			time = nowFinish; // 2019/07/06
		}

		if (screen != 8) {
			for (; screen <= 7; screen++) {
				if (!realList.get(realList.size() - 1).getSchedule().getScheduleFinish()
						.equals(StringDateHelper.oneDatePlus(scheduleDate + "-02:00", formatStr))) {
					realList.add(getSWMV(realList.get(realList.size() - 1).getSchedule().getScheduleFinish(),
							StringDateHelper.oneDatePlus(scheduleDate + "-02:00", formatStr), screen));
				} else {
					realList.add(getSWMV(scheduleDate + "-06:00",
							StringDateHelper.oneDatePlus(scheduleDate + "-02:00", formatStr), screen));
				}
			}
		}

		return realList;
	}

	@Override
	public List<MovieVO> getMovieNames() {
		List<MovieVO> list = mapper.selectMovieNames();
		return list;
	}

	@Override
	public MovieVO getMovieDetailInfo(String movieCode) {
		MovieVO vo = mapper.selectMovieDetailInfo(movieCode);
		vo.setRank(mapper.selectMovieRank(movieCode));
		vo.setGrade(mapper.selectMovieGrade(movieCode));
		return vo;
	}

	@Override
	public int upSchedule(ScheduleVO schedule, String sd) {
		int result = mapper.insertSchedule(schedule, sd);
		if (result > 0) {
			return 1;
		} else {
			return 0;
		}
	}

	@Override
	public int removeSchedule(String scheduleDate, String scheduleStart, String scheduleScreen) {
		int result = mapper.deleteSchedule(scheduleDate, scheduleStart, scheduleScreen);
		if (result > 0) {
			return 1;
		} else {
			return 0;
		}
	}

	@Override
	public List<ScheduleWithMovieVO> getSeatStatus(String scheduleDate) {
		return mapper.selectSeatStatus(scheduleDate);
	}

	@Override
	public int uploadMovie(MultipartFile[] imageFiles, MultipartFile[] videoFiles, MultipartFile wideposter,
			MultipartFile poster, MovieVO mvo, String downPath) {
		Arrays.sort(imgCheck);
		Arrays.sort(videoCheck);
		int result = 1;

		// 와이드랑 포스터 두개 저장하고 저장한 파일이름으로 db에 올린다. vo 랑 같이
		String posterName = poster.getOriginalFilename();
		int strIndex = posterName.lastIndexOf(".");
		String ext = posterName.substring(strIndex);
		if (Arrays.binarySearch(imgCheck, ext) <= 0)
			return -1;

		posterName = FileUtil.rename(downPath, posterName);
		File savePoster = new File(downPath, posterName);

		String wideposterName = "";
		File widesavePoster = null;
		if(wideposter != null) {
			wideposterName = wideposter.getOriginalFilename();
			strIndex = wideposterName.lastIndexOf(".");
			ext = wideposterName.substring(strIndex);
			if (Arrays.binarySearch(imgCheck, ext) <= 0) return -1;
			wideposterName = FileUtil.rename(downPath, wideposterName);
			widesavePoster = new File(downPath, wideposterName);
		}
		

		mvo.setMoviePoster(posterName);
		mvo.setMovieWideposter(wideposterName);

		if (mapper.insertMovie(mvo) <= 0) {
			return -1;
		}

		String stilcutName = "";
		File[] images = new File[imageFiles.length];
		for (int i = 0; i < imageFiles.length; i++) {
			stilcutName = imageFiles[i].getOriginalFilename();
			strIndex = stilcutName.lastIndexOf(".");
			ext = stilcutName.substring(strIndex);
			stilcutName = FileUtil.rename(downPath, stilcutName);

			if(Arrays.binarySearch(imgCheck, ext) <= 0) {
				System.out.println(ext);
				System.out.println(Arrays.binarySearch(imgCheck, ext) +"불통");
				return -1;
			}
			if (  mapper.insertMovieImg(mvo.getMovieCode(), stilcutName) <= 0) return -1;
			
			images[i] = new File(downPath, stilcutName);
		}
		String videoName = "";
		File[] videos = new File[videoFiles.length];
		if(videoFiles != null) {
			for (int i = 0; i < videoFiles.length; i++) {
				videoName = videoFiles[i].getOriginalFilename();
				strIndex = videoName.lastIndexOf(".");
				ext = videoName.substring(strIndex);
	
				videoName = FileUtil.rename(downPath, videoName);
				
				if(Arrays.binarySearch(videoCheck, ext) <= 0) return -1;
				if (mapper.insertMovieVideo(mvo.getMovieCode(), videoName) <= 0) return -1;
				
				videos[i] = new File(downPath, videoName);
			}
		}

		try {
			
			poster.transferTo(savePoster);
			if(wideposter != null) {
				wideposter.transferTo(widesavePoster);				
			}
			
			for (int i = 0; i < imageFiles.length; i++) {
				imageFiles[i].transferTo(images[i]);
			}
			if(videoFiles != null) {
				for (int i = 0; i < videoFiles.length; i++) {
					videoFiles[i].transferTo(videos[i]);
				}				
			}
			return 1;
		} catch (IllegalStateException e) {
			return -1;
		} catch (IOException e) {
			return -1;
		}
	}

	@Override
	public List<MovieVO> getMovieManageList(int pageNum) {
		return mapper.selectManageList((pageNum - 1) * 8, pageNum * 8);
	}

	@Override
	public MovieVO changeMovieIsshow(MovieVO mvo) {
		mapper.updateMovieIsshow(mvo);
		return mvo;
	}

	@Override
	public int changeTotalView(MovieVO mvo) {
		return mapper.updateTotalView(mvo);
	}

	@Override
	public List<ServiceVO> getServiceList(SearchInfo sInfo) {
		return mapper.selectServiceList(sInfo);
	}

	@Override
	public ServiceWithImg getServiceInfo(int serviceNo) {
		return mapper.selectServiceInfo(serviceNo);
	}

	@Override
	@Transactional
	public int upServiceComment(ServiceCommentVO scvo) {
		int check = mapper.rereplycheck(scvo.getServiceNo());
		int result = -1;
		if (check != 0) {
			return 2;
		} else {
			result = mapper.insertServiceComment(scvo);
			if (result > 0) {
				mapper.updateServiceReplyCheck(scvo.getServiceNo());
				return 1;
			} else {
				return -1;
			}
		}
	}

	@Override
	public List<MemberVO> getMemberManageList() {
		return mapper.selectMemberManageList();
	}

	@Override
	public List<MemberVO> SearchMemberList(MemberSearchDTO msto) {
		return mapper.selectSearchMemberList(msto);
	}

	@Override
	public MemberVO updateMemberManage(MemberVO mvo, String isshow) {
		int result = mapper.updateMemberManage(mvo, isshow);
		return mapper.selectOneMember(mvo.getUserNo());
	}

	@Override
	public boolean removeMemberManage(int userNo) {
		boolean result = false;
		if (mapper.deleteMember(userNo) <= 0) {
			result = false;
		} else {
			result = true;
		}
		return result;
	}

	@Override
	public List<MemberVO> addMemberManage(MemberVO mvo, String isshow) {
		int result = mapper.insertMember(mvo, isshow);
		return mapper.selectMemberManageList();
	}

	@Override
	public int uploadBillboard(MultipartFile billboardimg, String link, String finishDate, String downPath) {
		Arrays.sort(imgCheck);
		Arrays.sort(videoCheck);
		String billboardName = billboardimg.getOriginalFilename();
		int strIndex = billboardName.lastIndexOf(".");
		String ext = billboardName.substring(strIndex);
		if(Arrays.binarySearch(imgCheck, ext) <= 0) {
			return -1;
		}
		

		int result = mapper.insertBillboard(billboardName, link, finishDate);
		File saveBillboard = new File(downPath, billboardName);
		
		if (result > 0) {
			try {
				billboardimg.transferTo(saveBillboard);
			} catch (IllegalStateException | IOException e) {
				return -1;
			}
			return 1;
		} else {
			return -1;
		}

	}

}