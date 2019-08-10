<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<script src="https://kit.fontawesome.com/244e92cc7b.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<title>Document</title>
<style>
@font-face {
	font-family: 'Goyang';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Goyang.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'NEXEN_TIRE_Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_eight@1.0/NEXEN_TIRE_Bold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'S-CoreDream-8Heavy';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-8Heavy.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'KimNamyun';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/KimNamyun.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'BMJUA';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.myPageContainer {
	display: inline-block;
	width: 1300px;
	padding: 10px;
}

.myPageContainer>div {
	border: 2px solid #333333;
}

.profile, .payAndService, .movieChoice {
	text-align: left;
}

.profile>div {
	
}

.profileImg {
	height: 90%;
}

.header {
	margin-top: 0;
	margin-bottom: 0;
	font-family: 'Goyang';
	font-weight: bold;
}

.headerBox>div, .dataBox>div {
	padding: 10px;
}

.scrollBox {
	overflow: auto;
	width: 100%;
	display: inline-block;
	height: 160px;
}

.scrollBox2 {
	overflow: auto;
	width: 100%;
	display: inline-block;
	height: 252px;
}

.dataBox>div {
	text-align: center;
}

.movieBox {
	height: 400px;
	text-align: center;
	padding-top: 30px;
	border-right: 2px solid #333333;
}

.movieLinkBox {
	height: 50px;
}

.movieLinkBox>a>button {
	border-radius: 5px;
	border: 2px solid #6b6b6b;
	margin: 10px 5px 5px 5px;
	font-size: 12px;
	background-color: #cccccc;
}

.movieLinkBox>a>button:hover {
	background-color: #8b8b8b;
}

.reRecommend {
	margin-right: 70px;
}

.hard {
	font-weight: bold;
	font-size: 17pt;
}

.normal {
	font-size: 14pt;
}

.fa-camera {
	color: #dededd;
	font-size: 25pt;
	position: relative;
	bottom: 20px;
	left: 230px;
	display: inline-block;
}

.fileInput {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.fa-pencil-alt {
	text-decoration-line: underline;
}

.latelyMovie {
	margin-top: 5px;
	overflow-y: auto;
	border: 1px solid #666666;
	height: 70px;
}

.latelyMovieList {
	display: inline-block;
	height: 50px;
	background-color: red;
}

.fa-edit {
	position: relative;
	float: right;
	right: 90px;
	bottom: 26px;
	font-size: 14pt;
}

.payscroll {
	margin: 3px;
}

.searchBtn {
	padding: 6px;
	border: 2px solid gray !important;
	border-radius: 6px;
	margin-bottom: 10px;
}

.searchLabel {
	padding: 6px;
}

#datepickerstart, #datepickerfinish {
	width: 120px;
	display: inline-block !important;
}

.payscroll {
	height: 25px;
}

.payscrollHeader {
	border: 1px solid #333333;
	border-bottom: 0;
	border-right: 0;
}

.payscrollHeader>div {
	border-right: 1px solid #333333;
}

.longCol {
	text-align: center !important;
	width: 160px;
	padding: 6px !important;
}

.shortCol {
	text-align: center !important;
	width: 80px;
	padding: 6px !important;
}

.w3-card {
	display: inline-block;
	margin: 5px;
}

.fa-times-circle {
	color: white;
	background-color: #333333;
	border-radius: 50%;
	margin: 3px;
	margin-left: 167px;
}

.fa-times-circle:hover {
	background-color: #6e6e6e;
}

.myinfoprofile p {
	margin: 5px;
}

.cardImg img {
	width: 90%;
}

.membershipLabel, .membershipvalue {
	display: inline-block;
	margin: 5px 0px 5px 0px;
	font-weight: bold;
}

.gradebar {
	height: 13px;
	border-top-left-radius: 6px;
	border-bottom-left-radius: 6px;
	position: relative;
	bottom: 13px;
	background-color: rgb(212, 51, 59);
}

.gradebarback {
	height: 13px;
	border-radius: 6px;
	background-color: rgb(214, 214, 214);
}

.gradevalue {
	font-family: 'KimNamyun';
	font-size: 13pt;
}

.membershipbox {
	border-left: 2px solid #333333;
	width: 600px;
	padding: 10px;
	border-top: 2px solid #333333;
}

.memberText {
	margin: 20px;
	font-size: 20pt;
	font-family: 'BMJUA';
	margin-bottom: 30px;
}
</style>
</head>

<body>
	<%@include file="/resources/include/header.jsp"%>
	<div class="w3-center">
		<div class="myPageContainer">
			<div>
				<div class="profile">
					<div style="display: flex;">
						<div style="width: 985px;">
							<div>
								<h3 class="header" style="padding: 10px;">프로필</h3>
							</div>
						</div>
						<div style="border-left: 2px solid #333333; width: 600px;">
							<div>
								<h3 class="header" style="padding: 10px;">멤버쉽</h3>
							</div>
						</div>
					</div>
					<div style="display: flex;">
						<div style="width: 994px;">
							<div class="w3-row"
								style="border-top: 2px solid #333333; height: 311px;">
								<div class="w3-col s5"
									style="height: 105%; padding: 30px; border-right: 1px solid #333333;">
									<img src="${myInfo.member.userProfile}"
										class="w3-circle profileImg" alt="프로필 사진"
										style="width: 100%; height: 100%;"> <a><label
										for="profileImgFile"><i class="fas fa-camera"></i></label><input
										id="profileImgFile" onchange="changeProfile(this)" type="file"
										accept=".jpg,.gif,.png" class="fileInput"></a>
								</div>
								<div class="w3-col s6">
									<div class="w3-row">
										<div>
											<div style="height: 280px;">
												<div
													style="border-bottom: 1px solid #333333; margin-left: 10px; margin-bottom: 20px; padding: 10px; width: 443px;">
													<text class="hard">${myInfo.member.userName}님</text>
													<text class="normal">${myInfo.member.userId}</text>
													<br>
													<text id="nickText" class="normal">닉네임 :
													${myInfo.member.userNick}</text>
													<a onclick="nickChange();"><i class="fas fa-pencil-alt"></i></a>
												</div>
												<div class="w3-row" style="margin-left: 20px;">
													<div style="font-size: 13pt; font-weight: bold;">
														개인정보</div>
													<div class="w3-col s3 myinfoprofile">
														<p>성별</p>
														<p>전화번호</p>
														<p>생일</p>
													</div>
													<div class="w3-col s9 myinfoprofile">
														<p>${myInfo.member.userGender}자</p>
														<p>${myInfo.member.userPhone}</p>
														<p>${myInfo.member.userBirth}</p>
														<a onclick=""><i class="fas fa-edit"></i></a>
													</div>
													<div style="position: relative; bottom: 10px;">
														<text style="font-size: 13pt; font-weight: bold;">종아하는
														장르</text>
														<div style="margin: 5px;">${myInfo.member.userGenre}</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="membershipbox">
							<div class="w3-row">
								<div style="text-align: center;">
									<p class="memberText">

										<c:choose>
											<c:when test="${myInfo.discountName == null}">
												<text>멤버십 회원이 아닙니다.</text>
											</c:when>
											<c:when test="${myInfo.discountName == 'GOLD'}">
                                 현재 회원 등급은
                                    <text style="color:gold">골드</text>입니다.
                                 </c:when>
											<c:when test="${myInfo.discountName == 'SILVER'}">
                                 현재 회원 등급은
                                    <text style="color:silver">실버</text>입니다.
                                 </c:when>
											<c:otherwise>
                                 현재 회원 등급은
                                    <text style="color:#af621e">브론즈</text>입니다.
                                 </c:otherwise>
										</c:choose>

									</p>
								</div>
								<div>
									<div class="w3-col s5">
										<div class="cardImg">
											<c:choose>
												<c:when test="${myInfo.discountName == null}">
													<a href="/civ/member/membership"><img
														src="/civ/resources/img/nocard.png"></a>
												</c:when>
												<c:when test="${myInfo.discountName == 'GOLD'}">
													<img src="/civ/resources/img/card_vvip.png">
												</c:when>
												<c:when test="${myInfo.discountName == 'SILVER'}">
													<img src="/civ/resources/img/card_vip.png">
												</c:when>
												<c:otherwise>
													<img src="/civ/resources/img/card.png">
												</c:otherwise>
											</c:choose>
										</div>
									</div>
									<div class="w3-col s6" style="margin-left: 20px;">
										<div class="w3-row">
											<div class="w3-col s3 ">
												<label class="membershipLabel">등급</label><br> <label
													class="membershipLabel">정립률</label><br> <label
													class="membershipLabel">포인트</label><br>
											</div>
											<div class="w3-col s9">
												<label class="membershipvalue">${myInfo.discountName}</label><br>
												<label class="membershipvalue">${myInfo.discountPercent}%</label><br>
												<label class="membershipvalue">${myInfo.cardPoint }
													p</label>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div style="margin-top: 30px;">
								<div id="userTotalPrice" style="height: 20px;">
									<span style="float: right;"> ${myInfo.membgPrice } 원 </span>
									<text style="float: left"
										style="font-weight: bold; font-family: 'BMJUA';"> 회원님의
									티켓 누적 구매금액 </text>
								</div>
								<div class="gradebarback"></div>
								<c:if test="${(myInfo.membgPrice/400000*100)>=99}">
									<div class="gradebar" style="width: 99%;"></div>
								</c:if>
								<c:if test="${(myInfo.membgPrice/400000*100)<99}">
									<div class="gradebar"
										style="width: ${myInfo.membgPrice/400000*100}%;"></div>
								</c:if>
								<div class="markline"
									style="font-size: 3px; position: relative; bottom: 12px;">
									<span style="margin-left: 2px;">|</span> <span
										style="margin-left: 125px;">|</span> <span
										style="margin-left: 110px;">|</span> <span
										style="margin-left: 116px;">|</span>
								</div>
								<div class="gradevalue"
									style="display: flex; width: 460px; position: relative; bottom: 24px;">
									<span>0</span> <span style="margin-left: 110px;">100,000</span>
									<span style="margin-left: 75px;">200,000</span> <span
										style="margin-left: 80px;">300,000</span>
								</div>
							</div>
						</div>
					</div>

				</div>
				<div class="payAndService w3-row"
					style="border-bottom: 2px solid #333333; border-top: 2px solid #333333;">
					<div class="headerBox">
						<div class="w3-col s6" style="border-right: 2px solid #333333;">
							<div>
								<h3 class="header">결제내역</h3>
							</div>
						</div>
						<div class="w3-col s6">
							<div>
								<h3 class="header">문의내역</h3>
							</div>
						</div>
					</div>
					<div class="dataBox">
						<div class="w3-col s6"
							style="border-top: 2px solid #333333; border-right: 2px solid #333333;">
							<div class="w3-row" style="text-align: left; padding: 5px;">
								<div class="w3-col s2 searchLabel">
									<label>조회내용</label>
								</div>
								<div class="w3-col s10">
									<button class="w3-button searchBtn">결제완료</button>
									<button class="w3-button searchBtn">환불</button>
									<button class="w3-button searchBtn">전체</button>
								</div>
								<div class="w3-col s2 searchLabel">
									<label>조회기간</label>
								</div>
								<div class="w3-col s10">
									<input type="text" id="datepickerstart" autocomplete=off>
									~ <input autocomplete=off type="text" id="datepickerfinish">
									<button onclick="paymentList();">조회하기</button>
								</div>
							</div>
							<div>
								<table class="w3-table-all">
									<thead>
										<tr class="w3-light-grey" class="scrollboxtable">
											<th class="longCol">영화</th>
											<th class="longCol">좌석</th>
											<th class="shortCol">금액</th>
											<th class="longCol">시간</th>
											<th class="shortCol">상영관</th>
											<th class="shortCol">상태</th>
										</tr>
									</thead>
								</table>
							</div>
							<div class="scrollBox">
								<table class="w3-table-all">
									<tbody class="paymentTable">
									</tbody>
								</table>
							</div>
						</div>
						<div class="w3-col s6" style="border-top: 2px solid #333333;">
							<div>
								<table class="w3-table-all">
									<thead>
										<tr class="w3-light-grey">
											<th class="shortCol">문의번호</th>
											<th class="shortCol">카테고리</th>
											<th class="longCol">문의제목</th>
											<th class="longCol">문의일</th>
											<th class="shortCol">답변유무</th>
										</tr>
									</thead>
								</table>
							</div>
							<div class="scrollBox2">
								<table class="w3-table-all">
									<tbody>
										<c:forEach var="sList" items="${serviceList}">
											<tr class="serviceInfoGo w3-hover-light-gray"
												sNo="${sList.serviceNo}">
												<td class="shortCol">${sList.serviceNo}</td>
												<td class="shortCol">${sList.serviceKindof}</td>
												<td class="longCol">${sList.serviceTitle}</td>
												<td class="longCol">${sList.serviceDate}</td>
												<c:if test="${sList.replyCheck == 'N'}">
													<td class="shortCol">답변대기</td>
												</c:if>
												<c:if test="${sList.replyCheck == 'Y'}">
													<td class="shortCol">답변완료</td>
												</c:if>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="movieChoice w3-row">
					<div class="w3-col s9">
						<div
							style="border-bottom: 2px solid #333333; border-right: 2px solid #333333; padding: 10px;">
							<h3 class="header">찜한영화</h3>
						</div>
						<div class="movieBox">
							<div>
								<div class="swiper-container">
									<div class="swiper-wrapper">
										<c:forEach var="dList" items="${DibsList}">
											<div class="swiper-slide dibsSlide_${dList.dibsNo}">
												<div class="w3-card" style="width: 200px;">
													<div style="position: absolute;">
														<a onclick="dibsRemove(${dList.dibsNo})"><i
															class="far fa-times-circle fa-2x"></i></a>
													</div>
													<div>
														<img src="${dList.moviePoster}" style="width: 100%;">
													</div>
													<div class="w3-container movieLinkBox">
														<a
															href="/civ/movie/moviedetailpage2?movieCode=${dList.movieCode}"><button>상세보기</button></a>
														<a href="/civ/payment/reserve?movieCode=${dList.movieCode}"><button>빠른예매</button></a>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="w3-col s3">
						<div style="border-bottom: 2px solid #333333; padding: 10px;">
							<h3 class="header">추천영화</h3>
						</div>
						<div style="text-align: center; padding-top: 30px;">
							<div class="w3-card" style="width: 200px;">
								<img src="${RandomMovie.moviePoster}" style="width: 100%;">
								<div class="w3-container movieLinkBox">
									<a
										href="/civ/movie/moviedetailpage2?movieCode=${RandomMovie.movieCode}"><button>상세보기</button></a>
									<a href="/civ/payment/reserve?movieCode=${RandomMovie.movieCode}"><button>빠른예매</button></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="myModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content inputModal"></div>
		</div>
	</div>

	<form id="FILE_FORM" method="post" enctype="multipart/form-data"
		action="/civ/member/changeprofile" accept-charset="UTF-8"></form>
		<%@include file="/resources/include/footer.jsp"%>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script src="/civ/resources/js/datepicker.js"></script>
	<script>
	var swiper = new Swiper('.swiper-container', {
        slidesPerView: 4,
        centeredSlides: true,
        spaceBetween: 0,
        grabCursor: true,
        pagination: {
          el: '.swiper-pagination',
          clickable: true,
        },
  });
	
        $('.serviceInfoGo').click(function(){
			var sNo = $(this).attr('sNo');
			$.ajax({
				type:"get",
				url:"/civ/member/serviceinfo",
				data:{"serviceNo":sNo},
				success:function(data){
					$('.inputModal').html('');
					$('.inputModal').html(data);
					$("#myModal").modal("show");
				}
			});
        });
        var type = null;
        $('.searchBtn').click(function(){
			$('.searchBtn').css('backgroundColor','white');
			$(this).css('backgroundColor','#d9d9d9');
			var checkType = $(this).html();
			if(checkType=='결제완료'){
				type="Y";
			}else if(checkType=="환불"){
				type="N";
			}else if(checkType=="전체"){
				type="";
			}
       	});
		function paymentList(){
			var startTime = $('#datepickerstart').val();
			var finishTime = $('#datepickerfinish').val();

			if(startTime != '' && startTime > finishTime){
				alert('시작기간 오류');
				return;
			}else if(finishTime != '' && finishTime < startTime){
				alert('종료기간 오류');
				return;
			}
			
			$.ajax({
				type:"get",
				url:"/civ/member/mypayment.json",
				data:{"type":type,"startDate":startTime,"finishDate":finishTime},
				success:function(data){
					$('.paymentTable').html('');
					for(var i = 0; i< data.length; i++){
						var tr = $("<tr style='font-size: 10pt;' class='w3-hover-light-blue scrollboxtable' pNo='"+data[i].payment.payNo+"'></tr>");
						tr.append('<td class="longCol">'+data[i].movie.movieName+'</td>');
						tr.append('<td class="longCol">'+data[i].payment.paySeat+'</td>');
						tr.append('<td class="shortCol">'+data[i].payment.payPrice+'</td>');
						tr.append('<td class="longCol">'+data[i].payment.resDate+'</td>');
						tr.append('<td class="shortCol">'+data[i].payment.screen+'</td>');
						if(data[i].payment.isshow == 'Y'){
							tr.append('<td class="shortCol makeBtn">결제</td>');
						}else{
							tr.append('<td class="shortCol">환불</td>');							
						}
						$('.paymentTable').append(tr);
					}
					$('.scrollboxtable').hover(function(){
						var pno = $(this).attr('pNo');
						$(this).children('.makeBtn').html('<button id="canclePayment">환불</button>');
						$('#canclePayment').click(function(){
							$.ajax({
								type:"get",
								data:{"payNo":pno},
								url:"/civ/payment/canclepayment.json",
								success:function(data){
									if(data!=-1){
										alert('성공');
										location.reload();
									}else{
										alert('환불 오류!!');
									}
								}
							});
						});
					},function(){
						$(this).children('.makeBtn').html('<td class="shortCol makeBtn">결제</td>');
					});
				}
			});
		}
        function canclePayment(pno){
        	alert(pno);
        }
        $("#datepickerstart").datepicker({
            dateFormat: 'yy/mm/dd'
            , changeYear: true
        });
        
        $("#datepickerfinish").datepicker({
            dateFormat: 'yy/mm/dd'
            , changeYear: true
        });
        
        function nickChange(){
	    	var changeNick = prompt('새로운 닉네임을 입력하세요', '');
	    	var nickreg = /([^가-힣\x20^a-z^A-Z^0-9]{3,15})/i;
			if(changeNick == ''){
				alert('닉네임을 입력해주세요.');
				return;
			}
			if(changeNick.length < 3 || nickreg.test(changeNick)){
				alert('닉네임은 3~15글자 (한글,영대소문자,숫자)만 가능합니다.');
				return;
			}
			$.ajax({
				type:'post',
				url:'/civ/member/changenick.json',
				data:{'changeNick':changeNick},
				success:function(data){
					if(data == 1){
						$('#nickText').html('닉네임 : '+changeNick);
					}else{
						alert('닉네임 변경 실패');
					}
				}
			});
	    };

	    function dibsRemove(dibsno){
	         $.ajax({
	            type:'get',
	            url:'/civ/member/removedibs.json',
	            data:{'dibsNo':dibsno},
	            success:function(data){
	               if(data == 1){
	                  $('.dibsSlide_'+dibsno).remove();
	               }else{
	                  alert('삭제 오류');
	               }
	            }
	         });
	      }
	    
	    function changeProfile(data){
	    	$('#profileImgFile').clone().appendTo('#FILE_FORM').hide().attr('name','proFile');
	    	$('#FILE_FORM').submit();
	    }; 
    </script>
</body>

</html>