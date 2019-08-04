package kr.coo.civ.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.coo.civ.mapper.AuthMapper;
import kr.coo.civ.vo.FavoriteMovieVO;
import kr.coo.civ.vo.InflowRouteVO;
import kr.coo.civ.vo.MemberVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AuthServiceImpl implements AuthService {

	@Setter(onMethod_ = @Autowired)
	private AuthMapper mapper;

	@Override
	public MemberVO checkNaverMember(MemberVO mvo) {
		return mapper.selectNaverMember(mvo.getUserId());
	}

	@Override
	@Transactional
	public boolean upNaverMember(MemberVO mvo, FavoriteMovieVO fvo, InflowRouteVO ivo) {
		boolean result = true;

		if (mapper.insertNaverMember(mvo) <= 0) {
			result = false;
		} else {
			if (ivo.getRoutePath() != null) {
				ivo.setUserNo(mvo.getUserNo());
				if (mapper.insertInflowRoute(ivo) <= 0) {
					result = false;
				}
			}
			if (!fvo.getMovieName().equals("")) {
				fvo.setUserNo(mvo.getUserNo());
				if (mapper.insertFavoriteMovie(fvo) <= 0) {
					result = false;
				}
			}
		}

		return result;
	}

	@Override
	public boolean phoneCheck(String userPhone) {
		int result = mapper.phoneCheck(userPhone);
		if (result > 0) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public String idCheck(String userId) {
		int result = mapper.selectIdCheck(userId).getCount();
		if (result == 0) {
			return "unique";
		} else {
			return "overlap";
		}
	}

	@Override
	public boolean joinUser(MemberVO mvo, FavoriteMovieVO fvo, InflowRouteVO ivo) {

		boolean result = true;
		if (mapper.insertJoinUser(mvo) <= 0) {
			result = false;
		} else {
			if (!fvo.getMovieName().equals("")) {
				fvo.setUserNo(mvo.getUserNo());
				if (mapper.insertFavoriteMovie(fvo) <= 0) {
					result = false;
				}
			}
			if (!ivo.getRoutePath().equals("")) {
				ivo.setUserNo(mvo.getUserNo());
				if (mapper.insertInflowRoute(ivo) <= 0) {
					result = false;
				}
			}
		}
		return result;
	}

	@Override
	public MemberVO loginCheck(MemberVO vo) {
		return mapper.selectMember(vo);
	}

}
