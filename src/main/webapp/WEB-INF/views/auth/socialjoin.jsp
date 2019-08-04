<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="/civ/resources/css/font.css" />
<title>Insert title here</title>
<link rel="stylesheet" href="/civ/resources/css/socialjoinpage.css"/>
</head>
<body>
	<%@include file="/resources/include/header.jsp"%>
	<div class="joinContainer">
		<div class="joinBox">
			<h3 style="border-bottom: 2px solid #313131; text-align: left;">회원가입</h3>
			<div class="agreeContainer">
				<h4>이용약관</h4>
				<div class="agreeBox">
					<%@include file="/resources/include/conditions.jsp"%>
				</div>
				<li style="font-size: 10pt; margin-top: 5px; font-family: 'BMJUA';">이용자는
					영화관 서비스 이용약관에 대한 동의를 거부할 권리가 있으나, 미 동의 시 회원가입을 하실 수 없습니다.</li>
					<span style="float: right;"><input id="agreeCheck" class="agreeBtn" type="checkbox"> 네이버 개인정보 사용 동의</span>
			</div>
			<div class="userInfoContainer">
				<div class="userInfoBox">
					<h4>기본정보입력</h4>
					<div style="text-align: left; width: 60%; display: inline-block;">
						<form class="form-group" id="frm"
							action="/civ/auth/socialjoindo" method="post">
							<div class="highInput">
								<label style="display: block;">*닉네임</label> 
								<input class="form-control" placeholder="닉네임 입력" id="userNick" name="userNick" type="text"> 
									<span id="idCheckSpan" class=""></span>
							</div>
							<br> <label style="display: block;">*생일</label>
							<div style="margin-bottom: 55px; width:500px;">
								<div class="col-sm-4 birthDiv" style="padding-left: 0;">
									<input class="form-control checkBirth" id="birthYear"
										name="birth" placeholder="년도" type="text">
								</div>
								<div class="col-sm-4 birthDiv">
									<select class="form-control checkBirth" id="birthMonth"
										name="birth">
										<option value="" selected="selected">--</option>
										<c:forEach var="d" begin="1" end="12">
											<option value="${d}">${d}</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-sm-4 birthDiv" style="padding-right: 0;">
									<input class="form-control checkBirth" id="birthDate"
										name="birth" placeholder="일" type="text"> <span
										id="birthCheckSpan" class=""></span>
								</div>
							</div>
							<br>
							<label style="display: block;">*전화번호</label>
							<div style="margin-bottom: 55px; width:500px;">
								<div class="col-sm-4" style="padding-left: 0;">
									<select class="form-control checkPhone" name="phone"
										id="phone1">
										<option value="">--</option>
										<option value="010">010</option>
										<option value="011">011</option>
									</select>
								</div>
								<div class="col-sm-4">
									<input class="form-control checkPhone" name="phone"
										style="padding-right: 0;" maxlength="4" type="text"
										id="phone2">
								</div>
								<div class="col-sm-4" style="padding-right: 0;">
									<input class="form-control checkPhone" name="phone"
										maxlength="4" type="text" id="phone3"> <span
										id="phoneCheckSpan" class=""></span>
								</div>
							</div>
							<br>
							<label style="display: block;">가장 감명깊게 본 영화</label> 
							<div class="highInput">
								<input
									class="form-control" type="text" name="movieName"> <br>
							</div>
							<label style="display: block;">좋아하는 영화 장르</label>
							<div style="width: 500px;">
								<input name="userGenre" type="checkbox" value="액션"> 액션 <input
									name="userGenre" type="checkbox" value="로맨스"> 로맨스 <input
									name="userGenre" type="checkbox" value="가족"> 가족 
								<input name="userGenre" type="checkbox" value="공포"> 공포 <input
									name="userGenre" type="checkbox" value="느와르"> 느와르 <input
									name="userGenre" type="checkbox" value="판타지">SF·판타지 
								<input name="userGenre" type="checkBox" value="드라마"> 드라마
							</div>
							<br>
							<label style="display: block;">유입 경로</label>
							<div style="width:800px;">
								<input class="routeClass" name="routePath" type="radio">
								검색 <input class="routeClass" name="routePath" type="radio">
								블로그 <input class="routeClass" name="routePath" type="radio">
								SNS <br> <input class="routeClass" id="otherPath"
									type="radio"> 기타 <br>
								<textarea id="pathTextarea" class="form-control"
									name="routePath" style="resize: none;" disabled="disabled"></textarea>
							</div>
							<div class="btnBox">
								<input class="joinBtn" type="button" value="취소"> <input class="joinBtn" id="submitBtn"
									type="button" value="회원가입">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@include file="/resources/include/footer.jsp"%>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<script src="/civ/resources/js/socialjoinpage.js"></script>
</body>
</html>