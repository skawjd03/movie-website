<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Document</title>
<style>

.membershipAgreeContainer {
	text-align: center;
	margin-top: 50px;
	margin-bottom: 50px;
}

.membershipAgreeBox {
	width: 970px;
	text-align: left;
	display: inline-block;
}

.agreeH3First {
	font-size: 20px;
	height: 34px;
	border-bottom: 1px solid #e1e1e1;
	margin-bottom: 30px;
	font-weight: 700;
}

.agreeH3 {
	height: 26px;
	padding: 3px 0;
	margin: 56px 0 8px 0;
	font-size: 14px;
	color: rgb(70, 70, 70);
	font-weight: bold;
}

.agreeBox {
	height: 157px;
	padding: 15px;
	border: 1px solid #9a9a9a;
	background-color:#f1f1f1;
	overflow: auto;
	font-size: 12px !important;
	color: #666;
}

th {
	border: 1px solid #848484;
	font-weight: normal;
}

td {
	border: 1px solid rgb(220, 220, 220);
	font-weight: normal;
	padding: 15px;
	color: rgb(102, 102, 102);
	font-weight: bold;
}

.checkBox {
	width: 18px;
	height: 18px;
}

.checkArea {
	text-align: left;
	padding: 15px 20px;
	font-size: 13px;
}

.agreePtag {
	font-weight: 700;
	font-size: 13px;
	color: #333;
}

#issueBtn {
	background-color: #9b3341 !important;
	width: 259px !important;
	height: 45px !important;
	border: 0;
	font-size: 18px;
	color: rgb(238, 234, 234);
}

.helpPtag {
	margin: 10px 17px;
	background: url(http://image2.megabox.co.kr/mop/home/dot.png) 17px 9px
		no-repeat;
	padding: 0 0 0 27px;
	font-weight: 700;
	font-size: 13px;
	color: #333;
}
</style>
</head>
<body>
	<%@include file="/resources/include/header.jsp" %>

	<div class="membershipAgreeContainer">
		<div class="membershipAgreeBox">
			<h3 class="agreeH3First">멤버십 가입동의</h3>
			<h3 class="agreeH3">제휴 멤버십 서비스 이용을 위한 제 3자 제공에 관한 안내</h3>
			<div class="agreeBox">
				1. 메가박스중앙㈜(이하 "회사")는 고객의 요청에 의하여 해당 고객의 개인정보를 제 3자에게 제공하는 경우, 그 제공하는
				목적, 제공하는 개인정보의 항목, 개인정보를 제공받는 자 및 그 보유 • 이용기간은 다음 표와 같습니다.
				<table
					style="width: 100%; text-align: center; border-collapse: collapse;">
					<tr>
						<th>제공받는 업체</th>
						<th>제공하는 항목</th>
						<th>제공받는 자의 이용목적</th>
						<th>보유 및 이용기간</th>
					</tr>
					<tr>
						<th>SK플래닛㈜, ㈜케이티, LG U+㈜, ㈜카카오페이</th>
						<th>영화관 멤버십 카드번호, 포인트 내역, 휴대폰번호, 성명, 영화관 WEB ID, 예매 정보</th>
						<th>포인트 적립 및 사용, 포인트 내역 제공 등 제휴 서비스 제공, 예매 정보 제공 등 제휴 서비스 제공
							활동</th>
						<th>해당 제휴사 고객 가입 시 동의한 보유 및 이용기간까지</th>
					</tr>
				</table>
				<br> 2. "회사"와 관련한 제휴 계약 등을 신규 체결 또는 상기 기재된 개인정보 제공업체와의 기존 계약을
				해지할 수 있으며, 그 경우 개인정보를 제공받는 업체에 변경이 생길 수 있습니다. 변경사항은 발생 시 홈페이지를 통해
				고지하거나 동의를 구한 후 업체에게 제공됩니다. 3. 회원은 제휴업체에 대한 정보 제공 철회(제휴업체 이용약관 동의
				철회)를 원하시는 경우 각 제휴업체에 방문하여 이용약관 철회 및 정보 제공 철회를 직접 진행해주셔야 합니다. 4. 제공받는
				업체 모두에게 개인정보가 제공되지 않으며 회원님의 추가 동의 및 요청에 따라 정보가 해당 업체에 제공됩니다. 제3자 정보
				제공 동의를 거부할 권리가 있으며, 동의를 거부하시면 멤버십 서비스 이용이 불가능합니다.
			</div>
			<div class="checkArea">
				<input id="check1" class="checkBox" type="checkbox"> 위의 '제휴
				멤버십 서비스 이용을 위한 제3자 제공에 대한 안내'를 읽고 동의 합니다. (필수 동의)
			</div>
			<h3 class="agreeH3">마케팅 활용을 위한 개인정보 수집 이용 안내</h3>
			<div class="agreeBox">
				<table
					style="width: 100%; text-align: center; border-collapse: collapse;">
					<tr>
						<th>수집 목적</th>
						<th>수집 항목</th>
						<th>보유 및 이용기간</th>
					</tr>
					<tr>
						<th>고객 맞춤형 상품 및 서비스 추천. 당사 신규 상품/서비스 안내 및 권유. 사은/할인 행사 등 각종
							이벤트 정보 등의 안내 및 권유</th>
						<th>이메일, 휴대폰번호, 주소, 생년월일, 선호영화관, 문자/이메일/앱푸쉬 정보 수신동의여부, 서비스
							이용기록, 포인트 적립 및 사용 정보, 접속로그</th>
						<th>회원 탈퇴 시 혹은 이용 목적 달성 시까지</th>
					</tr>
				</table>
				<br> 마케팅 활용을 위한 개인정보 수집 이용 안내에 대한 동의를 거부할 권리가 있으며, 동의를 거부하시면
				멤버십 서비스 이용이 불가능합니다.
			</div>
			<div class="checkArea">
				<input id="check2" class="checkBox" type="checkbox"> 위, 내용을
				읽고 '마케팅 활용을 위한 개인정보 수집 이용 안내'에 동의합니다. (필수 동의)
			</div>
			<h3 class="agreeH3First" style="margin-top: 50px;">멤버십카드 발급신청</h3>
			<table
				style="width: 100%; text-align: left; border-collapse: collapse;">
				<tr>
					<td width="20%" style="background-color: #fafafa;">고객명</td>
					<td width="80%"><p class="agreePtag">${memberName}</p></td>
				</tr>
				<tr>
					<td style="background-color: #fafafa;">이동전화번호</td>
					<td>
						<p class="agreePtag">${memberPhone}</p>
						<p class="agreePtag">본인명의가 아니시거나 다른 전화번호로 등록을 원하실때에는 마이페이지에서
							수정후 등록부탁드립니다.</p>
					</td>
				</tr>
			</table>
			<p class="helpPtag">오프라인 사용을 원하시는 경우에는 발급 후 영화관 매표소에 가셔서 직원에게
				카드정보를 보여주고 카드를 양도받으면 됩니다.</p>
			<p class="helpPtag">카드는 한 회원 당 하나이며 분실시 재발급은 영화관 현장에서 직원에게 안내받으시면
				됩니다.</p>
			<p class="helpPtag">귀하의 멤버십 정보는 마이페이지에서 확인 하실 수 있습니다.</p>
			<div style="text-align: center; margin-top: 50px;">
				<a onclick="makeMembership();"><input id="issueBtn" type="button" value="카드 발급"></a>
			</div>
		</div>
	</div>
<%@include file="/resources/include/footer.jsp"%>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		crossorigin="anonymous"></script>
	<script>
        function makeMembership(){
	            if(!$('#check1').is(":checked") || !$('#check2').is(":checked")){
	                alert('약관에 동의해주세요.');
	                return;
	            }
	            location.href="/civ/member/createmembership";
         }
    </script>
</body>
</html>