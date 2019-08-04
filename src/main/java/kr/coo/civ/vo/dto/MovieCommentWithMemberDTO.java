package kr.coo.civ.vo.dto;

import kr.coo.civ.vo.MemberVO;
import kr.coo.civ.vo.MovieCommentVO;
import lombok.Data;

@Data
public class MovieCommentWithMemberDTO {
	private MemberVO member;
	private MovieCommentVO comment;
}
