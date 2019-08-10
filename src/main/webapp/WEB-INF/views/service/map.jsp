<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
	html, body{
		margin: 0px;
		padding: 0px;
	}
	.mainCon_l{
		display: inline-block;
		width: 30%;
		height: 500px;
		float: left;
		margin: 0px;
		padding: 0px;
		border: 1px solid black;
	}
	
	.mainCon_r{
		display: inline-block;
		width: 68%;
		height: 500px;
		border: 1px solid black;
	}
	
	ul{
		text-decoration: none;
	}
	
	#mcl{
		width: 100%;
		height: 40px;
		
	}
	
	#mcl ul li{
		display: inline-block;
		border: 1px solid gray;
		padding: 5px;
		width: 24%;
		float: left;
	}
	
	#mcl ul li a{
		font-size: 15pt;
		font-family: bold;
		color: black;
	}
	
	#mcl ul li:hover > a{
		text-decoration: none;
		color: #3399CC;
	}
	
	.dspin1{
		display: inline-block;
		padding: 6px;
		font-size: 15pt;
		border: 1px dashed green;
		border-radius: 15px;
		margin: 15px 0px 0px 10px;
	}
	.dspin2{
		width: 95%;
		margin-left: 10%;
		word-break:break-all;
		padding: 5px;
	}
	
	.btnArea{
		margin-top: 20%;
	}
	
	.qckR{
		width: 150px;
		height: 60px;
		border: 1px solid red;
	}
	
	.mvst{

	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('.mvbr').click(function(){
			/* $('#tel').empty(); */
			var branch =$(this).text();
			
			$('.mvbr').css('background-color', 'white');
			$(this).css('background-color', 'lightgray');
			
			$.ajax({
				url: "branchInfo.s5",
				type: "POST",
				dataType: "json",
				data: {
					"br_name": branch
				},
				success: function(data){
					$('#loc').text(data.br_loc);
					$('#tel').html(data.br_tel);
				},
				eorror: function(){
					alert('에러에러');
				}
			});
			
			
		});
		
		
		$('.cont').parents().css('text-align', 'center');
		
		
		
	});
</script>
<body>
	
		<%@include file="/resources/include/header.jsp"%>
	<hr>
	<div style="height: 500px;">
	<div class="mainCon_l">
			<div  id="mcl">
			<ul style="text-align: center;">
				<li class="mvbr" onclick="setCenter()"><a>본점</a></li>
				<li class="mvbr" onclick="setCountry()"><a>방화점</a></li>
				<li class="mvbr" onclick="setOneroom()"><a>우리집</a></li>
				<li class="mvbr" onclick="setMasan()"><a>마산점</a></li>
			</ul>
			</div>
			<div>
				<div style="text-align: left; margin-top: 5px;" id="brInfo">
					<div class="dspin1">오시는 길</div>
					<div class="dspin2" id="loc">${DATA.br_loc}</div>
					<div class="dspin1">문의</div>
					<div class="dspin2" id="tel">${DATA.br_tel}</div>
				</div>
			</div>
			
			<div class="btnArea">
				<input class="qckR" type="button" value="빠른예매">
			</div>
	</div>
	<div id="map" class="mainCon_r"></div>
	</div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=def924f573d9090dd76c7b8da19d316f&libraries=services,clusterer,drawing"></script>
<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(37.482135820690296 , 126.90140369253969), // 지도의 중심좌표
		        level: 5 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
	
		
		
	
		
		// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
		var positions = [
		    {
		        content: '<div style="width:150px;text-align:center;">본점</div>', 
		        latlng: new kakao.maps.LatLng(37.482106, 126.901402)
		    },
		    {
		        content: '<div style="width:150px;text-align:center;">원룸</div>', 
		        latlng: new kakao.maps.LatLng(37.481655, 126.898449)
		    },
		    {
		        content: '<div style="width:150px;text-align:center;">방화점</div>',
		        latlng: new kakao.maps.LatLng(37.578979, 126.819251)
		    },
		    {
		        content: '<div style="width:150px;text-align:center;">마산집</div>',
		        latlng: new kakao.maps.LatLng(35.175703, 128.555224)
		    }
		];
		
		for (var i = 0; i < positions.length; i ++) {
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng // 마커의 위치
		    });
		
		    // 마커에 표시할 인포윈도우를 생성합니다 
		    var infowindow = new kakao.maps.InfoWindow({
		        content: positions[i].content // 인포윈도우에 표시할 내용
		    });
		
		    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
		    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		}
		
		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}
		
		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		}
		var iwContent = '<div style="padding:5px;">Hello World!</div>',
	    iwRemoveable = true;

	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
	    content : iwContent,
	    removable : iwRemoveable
	});
		function setCenter() { map.setCenter(new daum.maps.LatLng(37.482106, 126.901402));}
		function setCountry() { map.setCenter(new daum.maps.LatLng(37.578979, 126.819251)); }
		function setOneroom() { map.setCenter(new daum.maps.LatLng(37.481655, 126.898449)); }
		function setMasan() { map.setCenter(new daum.maps.LatLng(35.175703, 128.555224)); }
		
		$('.mvst').click(function(){
			var thSt = $(this).$('.mvst');
			thSt.css('background-color' , 'red')
			
		});
	
		</script>
	
	<hr>
	<%@include file="/resources/include/footer.jsp"%>
</body>
</html>