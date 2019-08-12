<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/civ/resources/css/theaterpage.css"/>
<script src="https://kit.fontawesome.com/244e92cc7b.js"></script>
<title>Document</title>
</head>

<body>
	<%@include file="/resources/include/header.jsp"%>
	<div class="theater_container">
		<div class="theater_img">
			<img src="${initParam['viewImagePath']}theater.png"
				style="width: 100%; height: 100%;">
		</div>
		<div class="theater_nav">
			<div class="theater_navmenu">
				<a href="#theater_timetableform" class="menubtn">상영시간표</a>
			</div>
			<div class="theater_navmenu">
				<a href="#theater_directions" class="menubtn">오시는 길</a>
			</div>
			<div class="theater_navmenu">
				<a href="#theater_facility" class="menubtn">편의시설</a>
			</div>
		</div>
		<div style="text-align: center;">
			<div class="theater_timetableform" id="theater_timetableform">
				<div style='text-align: left;'>
					<h3>상영시간표</h3>
				</div>
				<div class="theater_timeheader">
					<div class="dateLine"></div>
					<!-- <div class="theater_mark"><img src="./mark.png" style="width: 100%; height:100%;"></div> -->
					<div class="theater_timetable">
						<div id="scheduleList" style="margin-left: 20px;">
							
						</div>
					</div>
					<div class="theater_umm" style="text-align: left;">
						지연입장에 의한 관람불편을 최소화 하고자 본 영화는 약 10분 후 시작됩니다.<br> 쾌적한 관람 환경을 위해
						상영시간 이전에 입장 부탁드립니다.
					</div>
				</div>
			</div>
		</div>
		<br>
		<div class="theater_directions" id="theater_directions">
			<div>
				<h3>오시는 길</h3>
			</div>
			<div class="theater_dir_addr">
				<li style="font-size: 13px; color: #333333; padding: 5px">도로명
					주소 : (08768) 서울특별시 관악구 시흥대로 552 (신림동) 석천빌딩 7층 인크레파스 센터</li>
				<li style="font-size: 13px; color: #333333; padding: 5px">지번 주소
					: (08768) 서울특별시 관악구 신림동 1655-24 석천빌딩 7층 인크레파스 센터</li>
			</div>
			<div id="map" style="width:100%;height:350px;"></div>
			<div class="theater_dir_bus">
				<img src="${initParam['viewImagePath']}/bus.png"
					style="width: 100%; height: 100%;">
			</div>
			<div class="theater_dir_umm">
				<b style="font-size: 18px;">ㆍ주차안내</b><br>
				<tnew style="color: rgb(25, 133, 145);font-size:13px;">석천빌딩
				건물 內 지하 1층 및 석천빌딩 야외 주차장 이용 / 주차공간이 매우 협소하오니 대중교통을 이용하시기 바랍니다</tnew>
				<br> <br> <b>주차확인</b><br> ＞매표소에서 영화티켓 제시 후 주차할인 인증<br>
				<br> <b>주차요금</b><br> 영화관람 시 2시간 30분 무료주차가능 (초과 시 30분당
				1,000원 적용)<br> ＞주차 요금은 입차시간을 기준으로 합니다.<br> ＞영화관람 시 최대 2시간
				30분 무료 (초과 시 30분 당 1,000원)
			</div>
		</div>
		<br>
		<div class="theater_facility" id="theater_facility">
			<div>
				<h3>편의시설</h3>
			</div>
			<div class="theater_fac_info">
				<img src="${initParam['viewImagePath']}fac_info.png"
					style="width: 100%; height: 100%;">
			</div>
		</div>
	</div>
	</div>
	<%@include file="/resources/include/footer.jsp"%>
	<script src="https://code.jquery.com/jquery-3.4.1.js"
		integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
		crossorigin="anonymous"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<script src="/civ/resources/js/dateFormat.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f38410ab260f3194c29e05f2f56c508f&libraries=services"></script>
	<script src="/civ/resources/js/theaterpage.js?after"></script>
</body>

</html>