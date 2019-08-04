package kr.coo.civ;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.coo.civ.service.StatisticsService;
import kr.coo.civ.vo.statistics.DashboardDTO;
import kr.coo.civ.vo.statistics.GenderDTO;
import kr.coo.civ.vo.statistics.JoinUserCountDTO;
import kr.coo.civ.vo.statistics.ReserveRateDTO;
import kr.coo.civ.vo.statistics.SalesDTO;
import kr.coo.civ.vo.statistics.VisitorCountDTO;
import lombok.Setter;

@RestController
@RequestMapping("/statistics/*")
public class StatisticsController {

	@Setter(onMethod_ = @Autowired)
	private StatisticsService service;
	
	/**
	 *  RestController를 이용해서 Restfull 개발 흉내내기
	 *  APIkey를 이용한 인증은 미구현
	 *  json, xml 두방식의 포맷을 제공 
	 */
	
	// 성비 구해주는 RestAPI
	@RequestMapping(value = "/gender", method = RequestMethod.GET)
	public ResponseEntity<List<GenderDTO>> getGenderData(String format) {
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.setContentType(MediaType.APPLICATION_JSON);
		if (format != null && format.equals("xml")) {
			httpHeaders.setContentType(MediaType.APPLICATION_XML);
		}
		return new ResponseEntity<>(service.getGenderData(), httpHeaders, HttpStatus.OK);
	}

	// 사용자 수를 구해주는 RestAPI
	@RequestMapping(value = "/joincount", method = RequestMethod.GET)
	public ResponseEntity<List<JoinUserCountDTO>> getJoinUserCountData(String format) {
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.setContentType(MediaType.APPLICATION_JSON);
		if (format != null && format.equals("xml")) {
			httpHeaders.setContentType(MediaType.APPLICATION_XML);
		}
		return new ResponseEntity<>(service.getJoinUserCountData(), httpHeaders, HttpStatus.OK);
	}

	// 매출 구해주는 RestAPI
	@RequestMapping(value = "/sales", method = RequestMethod.GET)
	public ResponseEntity<List<SalesDTO>> getSalesData(String format) {
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.setContentType(MediaType.APPLICATION_JSON);
		if (format != null && format.equals("xml")) {
			httpHeaders.setContentType(MediaType.APPLICATION_XML);
		}
		return new ResponseEntity<>(service.getSalesData(), httpHeaders, HttpStatus.OK);
	}

	// 예매율 구해주는 RestAPI
	@RequestMapping(value = "/reserverate", method = RequestMethod.GET)
	public ResponseEntity<List<ReserveRateDTO>> getReserveRateData(String format) {
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.setContentType(MediaType.APPLICATION_JSON);
		if (format != null && format.equals("xml")) {
			httpHeaders.setContentType(MediaType.APPLICATION_XML);
		}
		return new ResponseEntity<>(service.getReserveRateData(), httpHeaders, HttpStatus.OK);
	}

	// 해당 날짜 시간대별 방문객을 구해주는 구해주는 RestAPI
	@RequestMapping(value = "/visitorcount", method = RequestMethod.GET)
	public ResponseEntity<List<VisitorCountDTO>> getVisitorCount(String format) {
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.setContentType(MediaType.APPLICATION_JSON);
		if (format != null && format.equals("xml")) {
			httpHeaders.setContentType(MediaType.APPLICATION_XML);
		}
		return new ResponseEntity<>(service.getVisitorCount(), httpHeaders, HttpStatus.OK);
	}

	// 해당 날짜 대시보드 구해주는 RestAPI
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public ResponseEntity<DashboardDTO> get(String format, String nowDate) {
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.setContentType(MediaType.APPLICATION_JSON);
		if (format != null && format.equals("xml")) {
			httpHeaders.setContentType(MediaType.APPLICATION_XML);
		}
		return new ResponseEntity<>(service.getDashboardInfos(), httpHeaders, HttpStatus.OK);
	}

}
