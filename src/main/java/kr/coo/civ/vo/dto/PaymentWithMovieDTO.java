package kr.coo.civ.vo.dto;

import kr.coo.civ.vo.MovieVO;
import kr.coo.civ.vo.PaymentVO;
import lombok.Data;

@Data
public class PaymentWithMovieDTO {
	private MovieVO movie;
	private PaymentVO payment;
}
