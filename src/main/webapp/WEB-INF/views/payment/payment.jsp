<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<title>결제페이지</title>
<link rel="stylesheet" href="/civ/resources/css/font.css" />
<style>
body, html {
	margin: 0px;
	padding: 0px;
}

.pay_container {
	width: 950px;
	height: 795px;
	margin-left: auto;
	margin-right: auto;
	margin-bottom:200px;;
}

.select_info {
	padding: 20px 50px 20px 50px;
	background-color: white;
	border-top: 2px solid rgb(35, 31, 32);
}

.m_img {
	width: 200px;
	height: 250px;
}

.m_name {
	display:inline-block;
	font-size: 30px;
	font-family: 'GoyangDeogyang';
}

.detaile_info {
	display: inline-block;
	padding: 20px;
	font-family: 'BMJUA';
}

.detaile {
	display: inline-block;
	font-size: 11pt;
	opacity: 0.7;
	font-weight:bold;
	margin-right: 10px;
	color: #555555;
}


.pay_total {
	padding: 20px;
	height: 61px;
	background-color: #9e9e9e;
}

p {
	font-size: 18px;
	display: inline-block;
	margin: 0px;
	color: whitesmoke;
}

.payall {
	float: right;
	display: inline-block;
	font-size: 25px;
	color: whitesmoke;
	line-height: 15px;
}

.pay_methodform {
	height: 400px;
	margin-top: 40px;
}

h2 {
	color: whitesmoke;
	height: 67px;
	padding: 15px;
	background-color: rgb(64, 64, 64);
	font-weight: bold;
	line-height: 35px;
	margin-bottom: 0px;
}

.choice_form {
	padding: 40px 0px 40px 50px;
	border-left: 2px solid #b3b3b3;
	border-right: 2px solid #b3b3b3;
}

.choice_method {
	padding: 30px 30px 30px 70px;
	width: 850px;
	height: 93px;
	background-color: rgb(241, 239, 239);
	font-size: 16px;
	border-top: 2px solid #b3b3b3;
}

.selected {
	display: inline-block;
	margin-right: 40px;
}

.pay_last {
	height: 154px;
	background-color: rgb(42, 46, 50);
}

.pay_orderform {
	width: 353px;
	border-right: 2px solid #b3b3b3;
	display: inline-block;
}

.pay_allform {
	position: relative;
	top: -100px;
	display: inline-block;
	height: 154px;
	width: 550px;
}

dd {
	font-size: 14px;
	font-weight: bold;
	color: rgb(205, 193, 151);
	padding: 20px;
}

.font_sujung {
	color: rgb(167, 169, 172);
	font-size: 14px;
	padding-left: 20px;
}

.font_sujung2 {
	float: right;
	font-size: 14px;
	padding-right: 20px;
}

.font_sujung3 {
	font-size: 14px;
	font-weight: bold;
}

strong {
	font-size: 24px;
	color: white;
}

.money {
	margin-left: 210px;
	margin-top: 20px;
}

#check-module {
	background-color: #9e9e9e;
	width: 100px;
	height: 50px;
	border: 0px;
	color: aliceblue;
	font-size: 16px;
	font-weight: 700;
	border-radius: 5%;
	margin-top: 90px;
	float: right;
	cursor: pointer;
	box-shadow: 0 2px rgb(214, 214, 214);
}

#check-module:hover {
	background-color: rgb(216, 210, 203);
}

#check-module:active {
	background-color: rgb(216, 210, 203);
	box-shadow: 0 5px #808080;
	transform: translateY(4px);
}

.dd_sujung {
	font-size: 14px;
	font-weight: bold;
	color: rgb(205, 193, 151);
	padding: 20px;
	display: inline-block;
}

.dd_sujung2 {
	position: relative;
	top: 50px;
	right: 70px;
	font-size: 40px;
	color: white;
	display: inline-block;
}
.m_img{
	display: inline-block;
}
zara{
	font-weight: bold;
	font-size: 15pt;
	color: black;
	font-family: 'GoyangDeogyang';
}
</style>
</head>

<body>
	<%@include file="/resources/include/header.jsp" %>
	<div style="text-align: center;">
		<h1 style="margin-top: 40px; width: 950px; display: inline-block; text-align: left;">
			<b>주문/결제</b>
		</h1>
	</div>
	<div class="pay_container">
		<div class="select_info">
			<div>
				<div class="m_img">
					<img class="m_img" src="${initParam['viewUploadPath']}${mInfo.movie.moviePoster}" alt="">
				</div>
				<div style="display: inline-block; width: 600px; padding: 30px;">
					<div class="m_name">
						<strong1 style="font-weight: bold"> <c:out
							value="${mInfo.movie.movieName}" />(디지털)</strong1>
					</div>
					<div class="detaile_info">
						<div class="detaile">
							상영일
							<zara><c:out value="${mInfo.schedule.scheduleDate}" /></zara>
							(일)
						</div>
						<div class="detaile">
							상영시간
							<zara><c:out value="${mInfo.showtime}" /></zara>
						</div>
						<div class="detaile">
							상영관
							<zara><c:out value="${mInfo.schedule.scheduleScreen}" /></zara>
						</div>
						<br>
						<div class="detaile">
							관람인원
							<zara>
							<c:if test="${pInfo.adult ne null}">어른 <c:out value="${pInfo.adult}" />명</c:if>
							<c:if test="${pInfo.child ne null}">어린이 <c:out value="${pInfo.child}" />명</c:if>
							<c:if test="${pInfo.disorder ne null}">장애인 <c:out value="${pInfo.disorder}" />명</c:if>
							</zara>
						</div>
						<div class="detaile">
							좌석
							<zara><c:out value="${pInfo.checkSeat}" /></zara>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="pay_total">
			<p>총 주문금액</p>
			<div class="payall">
				<fmt:formatNumber value="${pInfo.money}" pattern="#,###" />
				원
			</div>
		</div>
		<div class="pay_methodform">
			<h2 style="margin-bottom: 0;">결제수단</h2>
			<div class="choice_form">
				<c:if test="${userPoint != -1 }">
					<div class="choice_method" style="padding:20px 30px 10px 70px;">
					<p style="color: black">포인트 : <point>${userPoint}</point>원</p> <p style="color:black; font-size:8pt;"> (포인트는 최대 10000원까지 사용할 수 있습니다.)</p><br>
					<input id="pointSet" type="text"> <button onclick="allmoney(${userPoint})">전액사용</button>
				</div>
				</c:if>
				<div class="choice_method">
					<div class="selected">
						<input type="radio" name="paycard" id="paycard" value="card"
							checked> 신용카드
					</div>
					<div class="selected">
						<input type="radio" name="paycard" id="payphone" value="phone">
						휴대폰결제
					</div>
					<div class="selected">
						<input type="radio" name="paycard" id="paymu" value="vbank">
						무통장입금
					</div>
					<div class="selected">
						<input type="radio" name="paycard" id="trans" value="trans">
						실시간계좌이체
					</div>
					<div class="selected">
						<input type="radio" name="paycard" id="samsung" value="samsung">
						삼성페이
					</div>
				</div>

			</div>
			<div class="pay_last">
				<div class="pay_orderform">
					<dd>주문금액</dd>
					<p class="font_sujung">할인금액</p>
					<p class="font_sujung2">
						<money id="paymentMoney"><fmt:formatNumber value="${pInfo.money}" pattern="#,###" /></money>
						원
					</p>
					<div class="money" style="text-align:right; margin-right:20px;">
						<strong><money id="discountMoney" style="color:white;"><fmt:formatNumber value="0" pattern="#,###" /></money></strong>
						<p class="font_sujung3">원</p>
					</div>
				</div>
				<div class="pay_allform">
					<dd class="dd_sujung">총 결제 금액</dd>
					<dd class="dd_sujung2">
						<money id="finalMoney"><fmt:formatNumber value="${pInfo.money}" pattern="#,###" /></money>
						원
					</dd>
					<button id="check-module" type="button">결제 테스트</button>
				</div>
			</div>
		</div>
	</div>
	<form id="form" action="/reserve/payokGo.do" method="post">
		<input id="scheduleCode" name="scheduleCode" type="hidden" value="${pInfo.scheduleCode}">
		<input id="checkSeat" name="paySeat" type="hidden">
		<input id="merchant_uid" name="payNo" type="hidden"> 
		<input id="paid_amount" name="payPrice" type="hidden">
		<input id="pay_method" name="payMethod" type="hidden">
	</form>
	
	<%@include file="/resources/include/footer.jsp"%>
	<script integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		crossorigin="anonymous"
		src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

	<script type="text/javascript"
		src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script>
        $("#check-module").click(function () {
        	paymentDo();
        });
		var mid = '${mId}';
		var money = ${pInfo.money};
		var point = ${userPoint};
        function paymentDo(){
        	$.ajax({
        		type:"get",
        		url:"/civ/payment/checkseat",
        		data:{'scheduleCode':${pInfo.scheduleCode},'checkSeat':'${pInfo.checkSeat}'},
        		success:function(data){
        			if(data){
        				var IMP = window.IMP; // 생략가능
        	            IMP.init('imp93258645');
        	            IMP.request_pay({
        	                pg: 'html5_inicis',
        	                pay_method: $(":input:radio[name=paycard]:checked").val(),
        	                merchant_uid: mid,
        	                name: '테스트 주문',
        	                amount:money,
        	                buyer_tel: '${sessionScope.loginInfo.userPhone}'
        	            }, function (rsp) {
        	                if (rsp.success) {
        	                	$('#checkSeat').val('${pInfo.checkSeat}');
        	                    $('#merchant_uid').val(rsp.merchant_uid);
        	                    $('#paid_amount').val(rsp.paid_amount);
        	                    $('#pay_method').val(rsp.pay_method); // 결제수단
        	                    var queryString = $("#form").serialize() ;
        	                    $.ajax({
        	                    	type: "post",
        	                        url: "/civ/payment/paid",
        	                        data : queryString,
        	                        success: function (data) {
        	                        	if(data=="failed"){
        	                        		alert('결제 실패');
        	                        	}else{
        	                        	    location.href="/civ/payment/payok";
        	                        	}
        	                        }
        	                    })
        	                } else {
        	                    alert('결제 실패하셨습니다.');
        	                }
        	            });
        			}else{
        				alert('결제 금액 오류!!!!!');
        			}
        		}
        	});
        }

        function allmoney(point){
        	$.ajax({
            	type:"get",
            	url:"/civ/payment/checkpoint.json",
            	data:{'point':point,'m_id':mid},
            	success:function(data){
            		setMoneyData(data.discountMoney);
					mid = data.mId;
                }
            });
        }

        $('#pointSet').on('change',function(e){
        	$.ajax({
            	type:"get",
            	url:"/civ/payment/checkpoint.json",
            	data:{'point':$(this).val(),'m_id':mid},
            	success:function(data){
					setMoneyData(data.discountMoney);
					mid = data.mId;
                }
            });
        });
        
        function setMoneyData(data){
        	$('#pointSet').val(data);
			$('#discountMoney').html('-'+data);
			money = 24000-data;
			$('#finalMoney').html(money);
			$('point').html(point-data);
        }
       
    </script>

</body>

</html>