package kr.coo.civ.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.coo.civ.mapper.ManageMapper;
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
			MultipartFile poster, MovieVO mvo, String downPath, String dbPath) {
		int result = 1;

		// 와이드랑 포스터 두개 저장하고 저장한 파일이름으로 db에 올린다. vo 랑 같이
		String posterName = poster.getOriginalFilename().split("\\.")[0] + new Date().getTime() + '.'
				+ poster.getOriginalFilename().split("\\.")[1];
		File savePoster = new File(downPath, posterName);

		String wideposterName = wideposter.getOriginalFilename().split("\\.")[0] + new Date().getTime() + '.'
				+ wideposter.getOriginalFilename().split("\\.")[1];
		File widesavePoster = new File(downPath, wideposterName);

		mvo.setMoviePoster(posterName);
		mvo.setMovieWideposter(wideposterName);
		
		if (mapper.insertMovie(mvo) <= 0) {
			result = -1;
		}

		String[] imageNames = new String[imageFiles.length];
		File[] images = new File[imageFiles.length];
		for (int i = 0; i < imageFiles.length; i++) {
			imageNames[i] = imageFiles[i].getOriginalFilename().split("\\.")[0] + new Date().getTime() + '.'
					+ imageFiles[i].getOriginalFilename().split("\\.")[1];
			images[i] = new File(downPath, imageNames[i]);
			if (mapper.insertMovieImg(mvo.getMovieCode(), imageNames[i]) <= 0) {
				result = -1;
			}
		}

		String[] videoNames = new String[imageFiles.length];
		File[] videos = new File[videoFiles.length];
		for (int i = 0; i < videoFiles.length; i++) {
			videoNames[i] = videoFiles[i].getOriginalFilename().split("\\.")[0] + new Date().getTime() + '.'
					+ videoFiles[i].getOriginalFilename().split("\\.")[1];
			videos[i] = new File(downPath, videoNames[i]);
			if (mapper.insertMovieVideo(mvo.getMovieCode(), videoNames[i]) <= 0) {
				result = -1;
			}
		}

		if (result == 1) {
			try {
				poster.transferTo(savePoster);
				wideposter.transferTo(widesavePoster);
				for (int i = 0; i < imageFiles.length; i++) {
					imageFiles[i].transferTo(images[i]);
				}
				for (int i = 0; i < videoFiles.length; i++) {
					videoFiles[i].transferTo(videos[i]);
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return result;
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
	public int uploadBillboard(MultipartFile billboardimg, String link, String finishDate,String path) {
		String posterName = billboardimg.getOriginalFilename().split("\\.")[0]+new Date().getTime()+'.'+billboardimg.getOriginalFilename().split("\\.")[1];
		File saveBillboard = new File(path,posterName);
		
		int result = mapper.insertBillboard(posterName, link, finishDate);
		
		if(result > 0) {
			try {
				billboardimg.transferTo(saveBillboard);
			} catch (IllegalStateException | IOException e) {
				return 0;
			}
			return 1;
		}else {			
			return 0;
		}
		
	}

}