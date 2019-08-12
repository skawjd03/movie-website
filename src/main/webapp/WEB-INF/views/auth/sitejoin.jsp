<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="/civ/resources/css/font.css" />
<title>Document</title>
<link rel="stylesheet" href="/civ/resources/css/sitejoinpage.css">
</head>

<body>
	<%@include file="/resources/include/header.jsp"%>

	<div class="join_container">
		<div class="joinTotalBox">
			<h3 style="border-bottom: 2px solid #313031;">회원가입</h3>
			<div class="join_noticeBox">
				<h4>이용약관</h4>
				<div class="join_notice">
					<%@include file="/resources/include/conditions.jsp"%>
				</div>
				<li style="font-size: 10pt; margin-top: 5px; font-family: 'BMJUA';">이용자는
					영화관 서비스 이용약관에 대한 동의를 거부할 권리가 있으나, 미 동의 시 회원가입을 하실 수 없습니다.</li> <input
					type="checkbox" class="agreeBtn"> 동의
			</div>
			<div class="joinformBox">
				<h3 style="display: inline-block;">기본정보 입력</h3>
				<span class="Keymsg"> (*표시)는 필수 입력 정보입니다.</span>
				<form action="/civ/auth/userjoin" method="post" id="form">
					<h5 class="joinlabel">*아이디</h5>
					<br> <input class="joininput" type="text" id="userid"
						name="userId" placeholder="아이디를 입력해주세요 (대소문자,숫자  4~15글자)"
						maxlength="15" /> <input class="idcheckBtn" type="button"
						value="중복확인" /> <br>
					<h5 class="joinlabel">*비밀번호</h5>
					<br> <input class="joininput" type="password" id="pswd1"
						name="pswd1" placeholder="비밀번호를 입력해주세요" maxlength="20"><br>
					<div class="pswd1label"></div>
					<h5 class="joinlabel">비밀번호확인</h5>
					<br> <input class="joininput" type="password" id="pswd2"
						name="userPassword" placeholder="비밀번호를 한번 더 입력해주세요" maxlength="20"><br>
					<div class="pswd2label"></div>
					<h5 class="joinlabel">*이름</h5>
					<br> <input class="joininput" type="text" id="username"
						name="userName" placeholder="이름을 입력해주세요" /><br>
					<h5 class="joinlabel">*생년월일</h5>
					<br> <input type="text" id="userbirthyear" name="strBirth"
						placeholder="년(4자)" maxlength="4"><select class="sel"
						name="strBirth">
						<option value="월">월</option>
						<option value="01">1</option>
						<option value="02">2</option>
						<option value="03">3</option>
						<option value="04">4</option>
						<option value="05">5</option>
						<option value="06">6</option>
						<option value="07">7</option>
						<option value="08">8</option>
						<option value="09">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
						<input type="text" id="userbirthday" name="strBirth"
						placeholder="일" maxlength="2">
						<br>
						<h5 class="joinlabel">*성별</h5>
						<br>
						<select class="sel" style="margin: 0;" id="usergender"
						name="userGender">
							<option value="성별">성별</option>
							<option value="남">남</option>
							<option value="여">여</option>
					</select>
						<br>
						<h5 class="joinlabel">*전화번호</h5>
						<br>
						<input class="joininput" type="tel" id="userphone"
						name="userPhone" placeholder="전화번호를 입력해주세요 (-포함)" maxlength="13">
						<br>
						<h5 class="joinlabel">좋아하는 장르</h5>
						<br>
						<input type="checkbox" class="favgenre" name="userGenre"
						value="액션"> 액션
						<input type="checkbox" class="favgenre" name="userGenre"
						value="SF·판타지"> SF·판타지
						<input type="checkbox" class="favgenre" name="userGenre"
						value="드라마"> 드라마
						<input type="checkbox" class="favgenre" name="userGenre"
						value="로맨스"> 로맨스
						<input type="checkbox" class="favgenre" name="userGenre"
						value="코미디"> 코미디
						<input type="checkbox" class="favgenre" name="userGenre"
						value="공포"> 공포
						<input type="checkbox" class="favgenre" name="userGenre"
						value="느와르"> 느와르
						<br>
						<h5 class="joinlabel">가장 인상깊게 본 영화</h5>
						<br>
						<input class="joininput" type="text" id="favmovie"
						name="movieName" placeholder="제일 인상깊었던 영화를 입력해주세요">
						<br>
						<h5 class="joinlabel">사이트 유입경로</h5>
						<br>
						<select class="sel" id="inflowroute" name="routePath"
						style="margin: 0;">
							<option value="">유입경로</option>
							<option value="검색">검색</option>
							<option value="지인추천">지인추천</option>
							<option value="블로그 및 카페">블로그및카페</option>
							<option value="SNS">SNS</option>
							<option value="기타">기타</option>
					</select>
						<br>
						<textarea id="routeText" name="routeText" disabled></textarea>
						<br>
						<h5 class="joinlabel">*닉네임</h5>
						<br>
						<input class="joininput" type="text" id="usernick" name="userNick"
						placeholder="닉네임을 입력해주세요" maxlength="15">
						<br>
						<div class="joinbtnBox">
							<input class="joinBtn" type="button" value="회원가입" />
						</div>
				</form>
			</div>
		</div>
	</div>
<%@include file="/resources/include/footer.jsp"%>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		crossorigin="anonymous"></script>
	<script src="/civ/resources/js/sitejoinpage.js?after"></script>
</body>

</html>