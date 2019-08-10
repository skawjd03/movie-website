package kr.coo.civ.mapper;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.coo.civ.vo.BranchVO;
import kr.coo.civ.vo.domain.PageUtil;
import kr.coo.civ.vo.dto.NoticeDTO;
import kr.coo.civ.vo.dto.ServiceDTO;
import kr.coo.civ.vo.dto.ServiceImgDTO;

public class NoticeDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List<NoticeDTO> noticeTitle() {
		return sqlSession.selectList("ntSQL.noticeTitle");
	}
	
	public List<NoticeDTO> noticeList(PageUtil pUtil){
		return sqlSession.selectList("ntSQL.noticeList", pUtil);
	}
	
	public int totalCnt() {
		return sqlSession.selectOne("ntSQL.totalCnt");
	}
	
	////////////
	public List<NoticeDTO> noticeSearch(PageUtil pUtil){
		return sqlSession.selectList("ntSQL.noticeSearch", pUtil);
	}
	
	public int searchTotal(String word) {
		return sqlSession.selectOne("ntSQL.searchTotal", word);
	}
	
	///////////////
	
	public int noticeHit(int no) {
		return sqlSession.update("ntSQL.noticeHit", no);
	}
	
	public NoticeDTO noticeDetail(int no){
		return sqlSession.selectOne("ntSQL.noticeContent", no);
	}
	
	// question upload----------------------
	public int questionRegistor(ServiceDTO serviceDTO) {
		return sqlSession.insert("svSQL.quetionRegistor", serviceDTO);
	}
	
	public int questionImg(ServiceImgDTO serviceImgDTO) {
		return sqlSession.insert("svSQL.questionImg", serviceImgDTO);
	}
	
	public BranchVO branchInfo(String brname) {
		BranchVO bDTO = sqlSession.selectOne("ntSQL.branchInfo", brname);
		return bDTO;
	}

	public List<NoticeDTO> selList(PageUtil pUtil){
		return sqlSession.selectList("ntSQL.selList", pUtil);
	}
	
}
