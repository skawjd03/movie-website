package kr.coo.civ.service;

import kr.coo.civ.vo.FavoriteMovieVO;
import kr.coo.civ.vo.InflowRouteVO;
import kr.coo.civ.vo.MemberVO;

public interface AuthService {
	public MemberVO checkNaverMember(MemberVO mvo);
	public boolean upNaverMember(MemberVO mvo,FavoriteMovieVO fvo,InflowRouteVO ivo);
	public boolean phoneCheck(String userPhone);
	public String idCheck(String userId);
	public boolean joinUser(MemberVO mvo,FavoriteMovieVO fvo,InflowRouteVO ivo);
	public MemberVO loginCheck(MemberVO vo);
}
	