<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Document</title>
<style>
body {
	background-color: white;
}

@font-face {
	font-family: 'S-CoreDream-9Black';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-9Black.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.LOGO {
	font-size: 70pt;
	color: #d7d8db;
	text-align: center;
	font-family: 'S-CoreDream-9Black';
}

.linkList {
	background-color: #9b3341;
	text-align: center;
}

.linkBtn {
	color: #313031;
	font-size: 16pt;
	font-weight: bold;
	margin: 0px 2px;
}

.linkBtn:hover {
	box-shadow: -3px 0px 30px 0px black;
}

.headLine {
	background-color: #e5e2e1;
	text-align: right;
}

.lineBtn {
	font-size: 9pt;
	font-weight: bold;
}

.main_Container {
	background-color: #3a3d3d;
}
</style>
</head>

<body>
	<div class="main_Container">
		<div class="headLine">
			<c:if test="${sessionScope.loginInfo.userId == null}">
				<a class="w3-btn lineBtn" href="/civ/auth/login">LOGIN</a>
			</c:if>
			<c:if test="${sessionScope.loginInfo.userId != null}">
				<a href="/civ/auth/logout" class="w3-btn lineBtn">LOGOUT</a>
				<a href="/civ/member/myinfo"><button class="w3-btn lineBtn">MYPAGE</button></a>
			</c:if>
			<a href="/civ/Notice/noticeForm.s5"><button class="w3-btn lineBtn" style="margin-right: 15px;">SERVICE</button></a>
		</div>
		<a href="/civ/main" style="text-decoration: none;"><h1 class="LOGO">ISLOGGO</h1></a>
		<div class="linkList">
			<a href="/civ/movie/moviepage"> <button class="w3-btn linkBtn">MOVIE</button></a>
			<a href="/civ/theater"><button class="w3-btn linkBtn">THEATER</button></a>
			<a href="/civ/payment/reserve" class="w3-btn linkBtn">RESERVE</a>
			<a href="/civ/member/membership"><button class="w3-btn linkBtn">MEMBERSHIP</button></a>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		crossorigin="anonymous"></script>

</body>

</html>