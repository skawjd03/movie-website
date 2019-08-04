package kr.coo.civ.mapper;

import kr.coo.civ.vo.FavoriteMovieVO;
import kr.coo.civ.vo.InflowRouteVO;
import kr.coo.civ.vo.MemberVO;

public interface AuthMapper {
	public MemberVO selectNaverMember(String userId);
	public int insertNaverMember(MemberVO vo);
	public int insertInflowRoute(InflowRouteVO vo);
	public int insertFavoriteMovie(FavoriteMovieVO fm);
	public int phoneCheck(String userPhone);
	public MemberVO selectIdCheck(String userId);
	public int insertJoinUser(MemberVO vo);
	public MemberVO selectMember(MemberVO vo);
}
