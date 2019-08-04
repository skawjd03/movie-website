<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<link href="https://www.w3schools.com/w3css/4/w3.css" rel="stylesheet">
<link rel="stylesheet" href="/civ/resources/css/font.css" />
<link
	href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap&subset=korean"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/244e92cc7b.js"></script>
<link href="/civ/resources/css/membermanagepage.css" rel="stylesheet">
</head>

<body>
	<div class="admin_container">
		<%@include file="/resources/include/adminnav.jsp"%>
		<div class="w3-main">
			<h1 class="dashTitle">Member management</h1>
			<div class="memberInfoSearchBox">
				<div class="searchBox">
					<div style="border-bottom: 1px solid #e8e8e8;">
						<input type="radio" name="socialCheck" value="올" />
						<p class="searchOption">모든회원</p>
						<input type="radio" name="socialCheck" value='소셜' />
						<p class="searchOption">특정회원</p>
						<select id="memberType" disabled="disabled">
							<option value="선택">-선택-</option>
							<option value="G">일반</option>
							<option value="N">네이버</option>
						</select>
						<p style="margin-left: 30px;" class="searchOption">검색조건</p>
						<select id="searchType">
							<option value="all">전체</option>
							<option value="no">번호</option>
							<option value="name">이름</option>
							<option value="id">아이디</option>
						</select> <input type="text" id="searchText" />
					</div>
					<div>
						<p class="searchOption">가입일자</p>
						<input id="searchStart" class="searchDate" type="date"
							max="2200-12-31" min="1900-01-01" /> ~<input id="searchFinish"
							class="searchDate" type="date" max="2200-12-31" min="1900-01-01" />
						<p style="margin-left: 20px;" class="searchOption">성별</p>
						<input type="radio" name="searchGender" value="남" /> 남 <input
							type="radio" name="searchGender" value="여" /> 여
						<p style="margin-left: 20px;" class="searchOption">삭제여부</p>
						<input type="checkbox" id="searchIsshow" /> 탈퇴
					</div>
					<div style="text-align: center;">
						<input id="searchBtn" type="button" value="상세검색">
					</div>
				</div>
			</div>
			<div class="memberManageBox">
				<div class="memberInfoBox">
					<p class="heaPtag" style="margin: 0;">검색결과♠</p>
					<div class="fixed-table-container">
						<div class="fixed-table-header-bg"></div>
						<div class="fixed-table-wrapper">
							<table id="tbl_employee" class="fixed-table w3-hoverable">
								<thead>
									<tr>
										<th style="width: 5%">
											<div class="th-text">번호</div>
										</th>
										<th style="width: 10%">
											<div class="th-text">이름</div>
										</th>
										<th style="width: 20%">
											<div class="th-text">아이디</div>
										</th>
										<th style="width: 10%">
											<div class="th-text">생년월일</div>
										</th>
										<th style="width: 15%">
											<div class="th-text">전화번호</div>
										</th>
										<th style="width: 10%">
											<div class="th-text">가입일</div>
										</th>
										<th style="width: 5%">
											<div class="th-text">성별</div>
										</th>
										<th style="width: 20%">
											<div class="th-text">닉네임</div>
										</th>
										<th style="width: 5%">
											<div class="th-text">소셜</div>
										</th>
									</tr>
								</thead>
								<tbody id="tbody">
									<c:forEach var="mvo" items="${memberVO}">
										<tr id="tr_${mvo.userNo}" class="w3-hover-light-blue trClick">
											<td class="tdNo">${mvo.userNo}</td>
											<td class="tdName">${mvo.userName}</td>
											<td class="tdId">${mvo.userId}</td>
											<td class="tdBirth" year="${mvo.userBirth}">${fn:substring(mvo.userBirth,2,10)}</td>
											<td class="tdPhone">${mvo.userPhone }</td>
											<td class="tdJoinDate">${mvo.joinDate}</td>
											<td class="tdGender">${mvo.userGender }</td>
											<td class="tdNick">${mvo.userNick }</td>
											<td class="tdSocial">${mvo.socialcheck }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="memberUpdateBox">
					<p class="heaPtag" style="margin: 0;">회원정보수정♠</p>
					<div class="updateForm">
						<div class="updateMenu">
							<p class="updatePtag">회원번호:</p>
							<input id="upNo" style="width: 70px;" type="text" disabled />
							<p class="updatePtag" style="font-size: 10pt">(sequence)</p>
						</div>
						<div class="updateMenu">
							<p class="updatePtag">회원이름:</p>
							<input id="upName" type="text" />
						</div>
						<div class="updateMenu">
							<p class="updatePtag">아이디:</p>
							<input id="upId" type="text" />
						</div>
						<div class="updateMenu">
							<p class="updatePtag">생년월일:</p>
							<input id="upYear" style="width: 60px;" type="text" />- <select
								id="upMonth" style="width: 60px; height: 28px;">
								<option value="월">월</option>
								<c:forEach var="cnt" begin="1" end="12">
									<c:if test="${cnt < 10}">
										<option value="0${cnt}">0${cnt}</option>
									</c:if>
									<c:if test="${cnt >= 10}">
										<option value="${cnt}">${cnt}</option>
									</c:if>
								</c:forEach>
							</select>- <select id="upDay" style="width: 60px; height: 28px;">
								<option value="일">일</option>
								<c:forEach var="cnt" begin="1" end="31">
									<c:if test="${cnt < 10}">
										<option value="0${cnt}">${cnt}</option>
									</c:if>
									<c:if test="${cnt >= 10}">
										<option value="${cnt}">${cnt}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
						<div class="updateMenu">
							<p class="updatePtag">전화번호:</p>
							<input id="upPhone1" style="width: 60px;" type="text"
								maxlength="3" />- <input id="upPhone2" style="width: 60px;"
								type="text" maxlength="4" />- <input id="upPhone3"
								style="width: 60px;" type="text" maxlength="4" />
						</div>
						<div class="updateMenu">
							<p class="updatePtag">가입일자:</p>
							<input id="upJoinDate" type="text" disabled />
						</div>
						<div class="updateMenu">
							<p class="updatePtag">성별:</p>
							<input type="radio" name="upGender" value="남" /> 남 <input
								type="radio" name="upGender" value="여" /> 여
						</div>
						<div class="updateMenu">
							<p class="updatePtag">닉네임:</p>
							<input id="upNick" type="text" />
						</div>
						<div class="updateMenu">
							<p class="updatePtag">소셜:</p>
							<select id="upSocial">
								<option value="선택">-선택-</option>
								<option value="G">일반</option>
								<option value="N">네이버</option>
							</select>
							<p class="updatePtag">탈퇴유무:</p>
							<select id="upIsshow" style="width: 50px;">
								<option value="선택">-선택-</option>
								<option value="Y">Y</option>
								<option value="N">N</option>
							</select>
						</div>
						<div style="text-align: right; margin-top: 20px;">
							<input class="addBtn btns" type="button" value="추가"> <input
								class="updateBtn btns" type="button" value="수정"> <input
								class="removeBtn btns" type="button" value="삭제">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		crossorigin="anonymous"></script>
	<script src="/civ/resources/js/dateLine.js"></script>
	<script src="/civ/resources/js/membermanagepage.js?after"></script>
	<script type='text/javascript'>
       $('.linkList li').each(function(){
         if($(this).html() == '회원관리'){
            $(this).attr('class','btn-active');
         }
      });
    </script>
</body>

</html>