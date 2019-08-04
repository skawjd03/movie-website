package kr.coo.civ.vo.dto;

import java.util.List;

import kr.coo.civ.vo.ServiceCommentVO;
import kr.coo.civ.vo.ServiceImgVO;
import kr.coo.civ.vo.ServiceVO;
import lombok.Data;

@Data
public class ServiceWithScommentWithSImgDTO {
	private ServiceVO service;
	private ServiceCommentVO comment;
	private List<ServiceImgVO> imgList;
}
