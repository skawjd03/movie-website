package kr.coo.civ.vo.dto;

import java.util.List;

import kr.coo.civ.vo.ServiceImgVO;
import lombok.Data;

@Data
public class ServiceWithImg {

	private int serviceNo,userNo;
	private String serviceTitle,serviceContent;
	private List<ServiceImgVO> imgPath;
}
