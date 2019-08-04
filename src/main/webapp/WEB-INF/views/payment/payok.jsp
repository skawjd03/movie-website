<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <title>결제확인페이지</title>
    <style>
    
    .ok_container {
        	display:inline-block;
        	text-align:left;
            width: 950px;
            height: 680px;
            background-color: antiquewhite;
            border-left: 2px solid #8f8f8f;
            border-right: 2px solid #8f8f8f;
        }
        .ok_ok {
            background-color: rgb(212, 212, 212);
            border-top: 2px solid black;
            height: 100px;
            padding: 20px 50px 20px 50px;
        }

        .ok_info {
            height: 480px;
            background-color: rgb(250, 244, 234);
            padding: 10px 50px 0px 50px;
            overflow: auto;
            
            border-bottom: 2px solid #cfcfcf;

        }

        .ok_bye {
            height: 100px;
            background-color: #616161;
            text-align: center;
            padding-top: 25px;
            border-bottom: 2px solid #8f8f8f;
        }

        a {
            color: #000;
            text-align: center;
            text-decoration: none !important;
        }
        
        .ok_btn {
            background-color: #9e9e9e;
            width: 100px !important;
            height: 50px !important;
            border: 0px;
            color: aliceblue;
            font-size: 16px;
            font-weight: 700;
            padding: 10px 20px 10px 20px;
            border-radius: 5%;
            cursor: pointer;
            box-shadow: 0 2px rgb(214, 214, 214);
        }

        .ok_btn:hover {
            background-color: rgb(216, 210, 203);
            color: #808080;
        }

        .ok_btn:active {
            background-color: rgb(216, 210, 203);
            box-shadow: 0 5px #808080;
            transform: translateY(4px);
        }
        .ok_label{
            width:100%;
            padding: 20px 0px 20px 0px;
            border-bottom: 2px solid #e4e4e4;
        }
        label{
            font-weight: bold;
            width: 100px;
            font-size: 16px;
        }
        .ok_val{
            display: inline-block;
            padding-left: 150px;
            border-left: 2px solid #c8c8c8;
        }
        p{
            display: inline-block;
            font-size: 16px;
        }
        .nav_moviemenubar{
        	text-align: center !important;
        }
        .login_id_container,.login_pw_container{
		height: 60px;
	}
	.login_id_img,.login_pw_img{
		width:48px;
		height: 48px;
	}
    </style>
</head>

<body>
	<%@include file="/resources/include/header.jsp" %>
	<div style="margin-top: 100px; margin-bottom: 100px; text-align: center;">
	    <h1>결제 확인</h1>
	    <br>
	    <div class="ok_container">
	        <div class="ok_ok">
	            <b style="font-size:14px;">결제성공</b><br>
	            <rb>- 결제가 정상적으로 처리되었습니다.</rb><br>
	            <rb>- 결제내역은 아래와 같습니다.</rb>
	        </div>
	        <div class="ok_info">
	            <div class="ok_label"> <label>회원 아이디</label> <div class="ok_val"><p>${loginInfo.userId}</p></div></div>
	            <div class="ok_label"> <label>영화</label> <div class="ok_val"><p>${paid.movie.movieName}</p></div></div>
	            <div class="ok_label"> <label>상영관</label> <div class="ok_val"><p>${paid.payment.screen }</p></div></div>
	            <div class="ok_label"> <label>좌석 번호</label> <div class="ok_val"><p>${paid.payment.paySeat}</p></div></div>
	            <div class="ok_label"> <label>상영 날짜</label> <div class="ok_val"><p>${paid.payment.resDate }</p></div></div>
	            <div class="ok_label"> <label>거래 번호</label> <div class="ok_val"><p>${paid.payment.payNo }</p></div></div>
	            <div class="ok_label"> <label>거래 수단</label><div class="ok_val"> <p>${paid.payment.payMethod }</p></div></div>
	            <div class="ok_label"><label>결제 금액</label> <div class="ok_val"><p>${paid.payment.payPrice }</p></div>원</div>
	        </div>
	        <div class="ok_bye">
	            <a class="ok_btn" href="/civ/member/myinfo">확인</a>
	        </div>
	    </div>
	</div>
	<%@include file="/resources/include/footer.jsp"%>
</body>

</html>