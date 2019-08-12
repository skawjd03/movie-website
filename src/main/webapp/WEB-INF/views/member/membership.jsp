<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Document</title>
<style>

.membershipContainer {
	text-align: center;
	margin-top: 50px;
	margin-bottom: 50px;
}

.membershipBox {
	width: 970px;
	text-align: left;
	display: inline-block;
}

.membershiph1box {
	position: relative;
	display: inline-block;
	width: 970px;
	bottom: 180px;
	color: rgb(235, 235, 235);
}

.membershiph1 {
	text-align: left;
}

.membershipHeader {
	margin-top: 50px;
	margin-bottom: 90px;
	font-size: 14pt;
	text-align: center;
}

a {
	text-decoration: none !important;
}

.memshipHeaderItem {
	display: inline-block;
	width: 140px;
	font-weight: bold;
}

.memshipHeaderl {
	display: inline-block;
}

.membershipA:hover {
	color: #9b3341;
	cursor: pointer;
}

.sectionHeader {
	font-size: 20px;
	height: 34px;
	border-bottom: 1px solid #e1e1e1;
	margin-bottom: 30px;
	font-weight: 700;
}

.BenefitImgBox {
	margin: 15px 0px;
	height: 215px;
}

.sectionBox {
	margin-bottom: 150px;
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

.helph4 {
	margin-bottom: 15px;
	padding: 0 0 0 27px;
	background: url(http://image2.megabox.co.kr/mop/home/dot.png) 17px 9px
		no-repeat;
	font-weight: 700;
}

.cationPtag {
	padding: 10px 25px;
	border-bottom: 2px solid #9b3341;
	background-color: #db5e6f;
	color: rgb(238, 234, 234);
	margin-bottom: 0;
}

.pointTable {
	width: 100%;
	text-align: center;
	border-collapse: collapse;
	font-size: 13px;
	color: #666;
}

.tablehead {
	background-color: #f1f1f1;
}

th, td {
	border: 1px solid rgb(220, 220, 220);
	height: 40px;
}

td {
	padding: 15px;
}

.ummBox {
	margin: 0 0 25px;
	border: 6px solid #f2f2f2;
	box-shadow: 0 0 1px #CCC;
}

.cardImgBox {
	margin: 40px 0;
	text-align: center;
}

#regBtn {
	background-color: #9b3341 !important;
	width: 299px !important;
	height: 45px !important;
	border: 0;
	font-size: 18px;
	color: rgb(238, 234, 234);
}
</style>
</head>

<body>
	<%@include file="/resources/include/header.jsp" %>

	<div class="membershipContainer">
		<div style="height: 300px;">
			<img src="${initParam['viewImagePath']}bgtop.png" style="width: 100%; height: 100%;">
			<div class="membershiph1box">
				<h1 class="membershiph1">
					<strong>멤버십</strong><br>
					<pre style="font-size: 11pt; margin: 20; font-weight: bold">저희영화관을 이용해주시는 고객님께 보답하고,
고객님과 더 가까히 소통하고자 다음과 같이 멤버십 서비스를 운영하고 있습니다.</pre>
				</h1>
			</div>
		</div>
		<div class="membershipBox">
			<div class="membershipHeader">
				<a class="membershipA" href="#pointSave">
					<div class="memshipHeaderItem">포인트적립</div>
				</a>
				<div class="memshipHeaderl">|</div>
				<a class="membershipA" href="#pointUse">
					<div class="memshipHeaderItem">포인트사용</div>
				</a>
				<div class="memshipHeaderl">|</div>
				<a class="membershipA" href="#membershipBenefit">
					<div class="memshipHeaderItem">멤버십혜택</div>
				</a>
				<div class="memshipHeaderl">|</div>
				<a class="membershipA" href="#membershipCard">
					<div class="memshipHeaderItem">멤버십카드</div>
				</a>
				<div class="memshipHeaderl">|</div>
				<a class="membershipA">
					<div class="memshipHeaderItem">VIP ZONE</div>
				</a>
			</div>
			<div class="sectionBox">
				<h3 class="sectionHeader">회원혜택</h3>
				<div class="BenefitImgBox">
					<img src="${initParam['viewImagePath']}benefit.png" style="width: 100%; height: 100%;">
				</div>
			</div>
			<div id="membershipCard" class="sectionBox">
				<h3 class="sectionHeader">멤버십카드</h3>
				<div class="cardImgBox">
					<img src="${initParam['viewImagePath']}card.png" style="margin: 0 4px;"> <img
						src="${initParam['viewImagePath']}card_vip.png" style="margin: 0 4px;"> <img
						src="${initParam['viewImagePath']}card_vvip.png" style="margin: 0 4px;">
				</div>
				<h4 class="helph4">영화관 멤버십 카드</h4>
				<div class="ummBox">
					<p class="helpPtag">영화관 현장에서 회원임을 나타낼 수 있는 카드</p>
					<p class="helpPtag">영화 티켓 구매 시 제시하여 멤버십 포인트 적립, 시사회 등 회원 이벤트 참여
						시 제시</p>
					<p class="helpPtag">본 카드는 회원 식별을 용이하게 하기 위한 수단으로, 멤버십 포인트는 카드번호
						기준이 아닌 회원별 고유 계정을 기준으로 적립, 차감됩니다.</p>
				</div>
				<div style="text-align: center;">
					<a href="/civ/member/membershipagree"><input id="regBtn" type="button" value="멤버십 카드 발급하기"></a>
				</div>
			</div>
			<div class="sectionBox">
				<h3 id="pointSave" class="sectionHeader">포인트적립</h3>
				<p class="helpPtag">적립되는 멤버십 포인트는 ‘티켓 구매 포인트’와 ‘이벤트 포인트’의 두 종류로
					구분되며 유효기간이 적용됩니다.</p>
				<h4 class="helph4">티켓구매 포인트</h4>
				<div class="ummBox">
					<p class="helpPtag">사이트에서 영화 티켓 구매 시 티켓 금액의 10% 적립</p>
					<p class="helpPtag">포인트 적립은 영화 상영 시작 시간 이전까지만 가능하며, 영화 시작 시간 이후
						적립은 불가능 합니다.</p>
				</div>
				<h4 class="helph4">유효기간</h4>
				<div class="ummBox">
					<p class="helpPtag">
						티켓구매포인트'와 '이벤트 포인트' 모두 최초 적립일로부터 24개월이 지난 시점의 해당 월 말일까지 유효하며,<br>
						유효기간 내에 사용하지 않은 포인트는 매월 말일 영업 종료 후 소멸 처리 됩니다.
					</p>
					<p class="helpPtag">2019년 1월 1일~2019년 12월 31일까지 적립된 멤버십 포인트의
						유효기간은 2019년 12월 31일까지입니다.</p>
				</div>
			</div>
			<div class="sectionBox">
				<h3 id="pointUse" class="sectionHeader">포인트사용</h3>
				<p class="helpPtag">멤버십 포인트 사용시에는 보유 포인트 한도 내에서 상품 사용 및 지류 쿠폰으로
					교환 가능하며 수령한 상품에 대해서 반환 및 교환은 불가합니다.</p>
				<p class="helpPtag">포인트 차감은 조조/심야 무관하게 예매권 매수 기준으로 차감됩니다.</p>
				<p class="helpPtag">보유 포인트가 교환 포인트 보다 부족 시 부분 결제로 이용이 불가합니다.</p>
				<p class="helpPtag">아래 목록에 없는 상품은 포인트로 사용이 불가합니다. (특별콘텐트, 영화제,
					패키지 상품 등)</p>
				<p class="helpPtag">쿠폰에 따라 제약 조건이 있을 수 있습니다.</p>
				<h4 class="helph4" style="margin-top: 40px;">멤버십 포인트 상품별 이용안내</h4>
				<p class="cationPtag">평일 영화예매권</p>
				<table class="pointTable">
					<colgroup>
						<col width="20%">
						<col width="20%">
						<col width="20%">
						<col width="20%">
						<col width="20%">
					</colgroup>
					<thead class="tablehead">
						<tr>
							<th scope="col" colspan="2" rowspan="2">상품명</th>
							<th scope="col" colspan="2">교환포인트(1매 기준)</th>
							<th scope="col" rowspan="2">비고</th>
						</tr>
						<tr>
							<th scope="col" colspan="2">19/01/01일 부터<br>적립된 포인트<br>(상영일
								기준:01/01일부터)
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row" rowspan="2"><strong>COMFORT</strong></th>
							<td>일반 영화</td>
							<td colspan="2">10,000 P</td>
							<td rowspan="20">월~금요일만 사용 가능<br>(주말 및 공휴일 사용 불가)
							</td>
						</tr>
						<tr>
							<td headers="special_title1 comfort">3D 영화</td>
							<td colspan="2">12,000 P</td>
						</tr>

						<tr>
							<th scope="row" id="comfort_t" rowspan="2"><strong>COMFORT관<br>테이블존
							</strong></th>
							<td headers="special_title1 comfort_t">일반 영화</td>
							<td colspan="2">11,000 P</td>
						</tr>
						<tr>
							<td headers="special_title1 comfort_t">3D 영화</td>
							<td colspan="2">13,000 P</td>
						</tr>


						<tr>
							<th scope="row" id="m2" rowspan="2"><strong>MX</strong></th>
							<td headers="special_title1 m2">일반 영화</td>
							<td colspan="2">11,000 P</td>
						</tr>
						<tr>
							<td headers="special_title1 m2">3D 영화</td>
							<td colspan="2">13,000 P</td>
						</tr>

						<tr>
							<th scope="row" id="boutique" rowspan="5"><strong>THE
									BOUTIQUE</strong></th>
							<td headers="special_title1 boutique">일반 영화</td>
							<td colspan="2">11,000 P</td>
						</tr>
						<tr>
							<td headers="special_title1 boutique">3D 영화</td>
							<td colspan="2">14,000 P</td>
						</tr>
						<tr>
							<td headers="special_title1 boutique">스위트룸</td>
							<td colspan="2">25,000 P</td>
						</tr>
						<tr>
							<td headers="special_title1 boutique">2인 소파</td>
							<td colspan="2">50,000 P</td>
						</tr>
						<tr>
							<td headers="special_title1 boutique">4인 소파</td>
							<td colspan="2">70,000 P</td>
						</tr>

						<tr>
							<th scope="row"><strong>BALCONY</strong></th>
							<td></td>
							<td colspan="2">14,000 P</td>
						</tr>

						<tr>
							<th scope="row"><strong>BALCONY2</strong></th>
							<td></td>
							<td colspan="2">14,000 P</td>
						</tr>

						<tr>
							<th scope="row"><strong>The 1st Club관</strong></th>
							<td></td>
							<td colspan="2">32,000 P</td>
						</tr>
						<tr>
							<th scope="row" id="royale" rowspan="2"><strong>로얄석</strong></th>
							<td headers="special_title1 royale">일반 영화</td>
							<td colspan="2">32,000 P</td>
						</tr>
						<tr>
							<td headers="special_title1 royale">3D 영화</td>
							<td colspan="2">36,000 P</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="sectionBox">
				<h3 id="membershipBenefit" class="sectionHeader">멤버십혜택</h3>
				<p class="helpPtag">멤버십 회원이 되시면 포인트 적립 외에 다양한 멤버십 혜택을 받으실 수
					있습니다.</p>
				<p class="helpPtag" style="font-size: 18px;">생일 콤보 2천원 할인권 증정</p>
				<div class="ummBox">
					<p class="helpPtag">생일이 포함된 해당 월 1회에 한해 생일 콤보 2천원 할인권을 받으실 수
						있습니다.</p>
					<p class="helpPtag">현장 매표소에서 직원을 통해 멤버십 및 생일 확인 후 발급 받으실 수
						있습니다.</p>
					<p class="helpPtag">회원가입 시 등록된 생일로 적용되며 유효기간은 발급일로부터 1개월 입니다.</p>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/resources/include/footer.jsp"%>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		crossorigin="anonymous"></script>

</body>

</html>