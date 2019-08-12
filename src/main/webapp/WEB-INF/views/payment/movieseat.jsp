<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!DOCTYPE html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="/civ/resources/css/movieseatpage.css?after" />
<title>좌석페이지</title>
<style>
body {
	font-size: 10px !important;
}
</style>
</head>

<body>
	<%@include file="/resources/include/header.jsp"%>
	<div style="">
		<div class="movie_seat">
			<div class="movie_people">
				<span> 어른
					<button id="ap" class="headcountBtn">+</button> <b class="soo"
					id="aval">0</b>
					<button id="am" class="minus-fixed headcountBtn">-</button>
				</span> <span> 어린이
					<button id="cp" class="headcountBtn">+</button> <b class="soo"
					id="cval">0</b>
					<button id="cm" class="minus-fixed headcountBtn">-</button>
				</span> <span> 장애인
					<button id="dp" class="headcountBtn">+</button> <b class="soo"
					id="dval">0</b>
					<button id="dm" class="minus-fixed headcountBtn">-</button>
				</span>
			</div>
			<div class="movie_seat_choice">
				<div class="screen">screen</div>
				<div class="seat-box seat_container">
					<div class="seat_choice_box"></div>
					<div class="seat_notice">
						<h5>좌석안내</h5>
						<div>
							<div class="block" style="background-color: rgb(27, 31, 233);">
							</div>
							선택좌석
						</div>
						<div>
							<div class="block" style="background-color: grey;">X</div>
							예매완료
						</div>
						<div>
							<div class="block"
								style="background-color: rgb(255, 255, 255); border: 0.5px solid black;">
							</div>
							선택불가
						</div>
						<div>
							<div class="block" style="background-color: grey;"></div>
							예매가능
						</div>
						<div>
							<div class="block" style="background-color: rgb(115, 241, 42);">
							</div>
							장애인석
						</div>
					</div>
				</div>
			</div>


			<div class="detail_imgbox">
				<div class="movie_check">
					<h5>영화</h5>
					<div
						style="display: inline-block; border-right: 1px solid rgb(214, 208, 208); width: 300px;">
						<div class="movie_postBox">
							<img src="${initParam['viewUploadPath']}${mInfo.movie.moviePoster}" style="width: 100%;" />
						</div>
						<div class="movie_postInfo">
							<div
								style="width: 110px; height: 30px; text-align: center; display: inline-block;">

								<c:choose>
									<c:when test="${mInfo.movie.movieAge == '12세이상관람가'}">
										<p class="ptags"
											style="background-color: #3bade0; border: 3px solid #3bade0;">12</p>
									</c:when>
									<c:when test="${mInfo.movie.movieAge == '15세이상관람가'}">
										<p class="ptags"
											style="background-color: #f1ac3f; border: 3px solid #f1ac3f;">15</p>
									</c:when>
									<c:when test="${mInfo.movie.movieAge == '청소년관람불가'}">
										<p class="ptags"
											style="background-color: #d23e42; border: 3px solid #d23e42;">19</p>
									</c:when>
									<c:when test="${mInfo.movie.movieAge == '전체관람가'}">
										<p class="ptags"
											style="background-color: #51a95a; border: 3px solid #51a95a;">전</p>
									</c:when>
								</c:choose>
								<c:out value="${mInfo.movie.movieName}" />
							</div>
							<div class="postInfo"
								style="margin-left: 20px; margin-top: 10px;">
								<c:out value="${mInfo.movie.movieGenre}" />
								<br>
								<c:out value="${mInfo.movie.movieRuntime}" />
								분
							</div>
						</div>
					</div>
					<div class="middle"
						style="display: inline-block; border-right: 1px solid rgb(214, 208, 208); width: 300px;">
						<div style="display: inline-block;">
							<div class="paymentInfo">
								<div class="paymentInfo_title">예매정보</div>
								<div style="display: flex;">
									<div class="payment_left">
										상영일<br> 상영시간<br> 상영관<br> 좌석
									</div>
									<div class="payment_right">
										<c:out value="${mInfo.schedule.scheduleDate}" />
										<br>
										<c:out value="${mInfo.showtime}" />
										<br>
										<c:out value="${mInfo.schedule.scheduleScreen}" />
										<br>
										<div id="user-selected" style="display: inline-block"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="payInfo">
						<div class="pay_title">총 결제 금액</div>
						<div style="display: flex;">
							<div class="payment_left">결제금액</div>
							<div class="payment_right payall">0</div>
						</div>
						<a class="btn paymentDo">결제하기</a>
					</div>
				</div>
			</div>
		</div>
		<form id="paymentGo" action="/civ/payment/sellticket" method="post">
			<input id="checkSeat" name="checkSeat" type="hidden" value="" /> <input
				id="adult" name="adult" type="hidden" value="" /> <input id="child"
				name="child" type="hidden" value="" /> <input id="disorder"
				name="disorder" type="hidden" value="" /> <input name="scheduleCode"
				type="hidden" value="${mInfo.schedule.scheduleCode}" />
		</form>
		<%@include file="/resources/include/footer.jsp"%>
		<script
			integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
			crossorigin="anonymous"
			src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
		<script src="/civ/resources/js/drawseat.js?after"></script>
		<script>
			$().ready(function() {
				$('.paymentDo').on('click', function(e) {
					if ($('#checkSeat').val() == "") {
						alert('좌석을 선택하세요.');
						return;
					}
					$('#paymentGo').submit();
				});
			});

			var seat = "${mInfo.schedule.seat}".split(",");
			var webSocket = new WebSocket(
					"ws://192.168.219.101/civ/websocket/${mInfo.schedule.scheduleCode}");
			webSocket.onopen = function(message) {
			};

			webSocket.onclose = function(message) {
				disconnect();
			};

			webSocket.onerror = function(message) {
			};

			webSocket.onmessage = function(message) {
				movieSeatDraw(message.data.split(','));
			};
			movieSeatDraw(seat);
			function disconnect() {
				webSocket.close();
			}
		</script>
</body>

</html>