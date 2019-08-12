<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<link href="https://www.w3schools.com/w3css/4/w3.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/244e92cc7b.js"></script>
<link rel="stylesheet" href="/civ/resources/css/servicepage.css">
</head>

<body>
	<div class="admin_container">
		<%@include file="/resources/include/adminnav.jsp" %>
		<div class="w3-main" style="width: 1800px;">
			<h1 class="dashTitle">문의 답변</h1>
			<div class="answerContainer">
				<div class="searchBox">
					<span><label>조회기간</label> <input class="searchInfo"
						id="searchStart" type="date" /> ~ <input class="searchInfo"
						id="searchFinish" type="date" /></span> <span><label>유저조회</label>
						<input class="searchInfo" id="userIdNo" type="text"></span> <span><label>미답변
							문의만 보기</label> <input class="w3-check searchInfo" id="replyCheck"
						type="checkbox" /></span>
				</div>
				<div>
					<div class="fixed-table-container"
						style="width: 1000px; height: 280px; border: 2px solid gray; margin-top: 10px; margin-left: 30px;">
						<div class="fixed-table-header-bg"></div>
						<div class="fixed-table-wrapper">
							<table id="tbl_employee" class="fixed-table">
								<thead>
									<tr>
										<th style="width: 10%">
											<div class="th-text">문의번호</div>
										</th>
										<th style="width: 10%">
											<div class="th-text">유저번호</div>
										</th>
										<th style="width: 10%">
											<div class="th-text">카테고리</div>
										</th>
										<th style="width: 40%">
											<div class="th-text">문의제목</div>
										</th>
										<th style="width: 20%">
											<div class="th-text">문의일</div>
										</th>
										<th style="width: 10%">
											<div class="th-text">답변여부</div>
										</th>
									</tr>
								</thead>
								<tbody class="w3-hoverable">
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div style="display: flex;">
					<div class="serviceView">
						<div>
							<h3 id="serviceWriter">
								작성자 :
								</h4>
						</div>
						<div>
							<h5 id="serviceTitle">제목 :</h5>
						</div>
						<div>
							<textarea id="serviceContent" disabled >
                            </textarea>
						</div>
						<div style="display:flex;">
							<div class="imgBox">
								<img
									onclick="document.getElementById('id01').style.display='block'"
									src="" id="imgBox1" style="height: 100%" />

							</div>
							<div class="imgBox">
								<img
									onclick="document.getElementById('id01').style.display='block'"
									src="" id="imgBox2" style="height: 100%" />

							</div>
							<div class="imgBox">
								<img
									onclick="document.getElementById('id01').style.display='block'"
									src="" id="imgBox3" style="height: 100%" />
							</div>
						</div>
					</div>
					<div class="answerWrite">
						<h3>답변달기</h3>
						<div>
							<textarea id="answerContent"></textarea>
						</div>
						<div style="float: right; padding-top: 20px;">
							<button onclick="uploadAnswer();">답변달기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="id01" class="w3-modal">
		<div class="w3-modal-content">
			<div class="w3-container" style=" height:800px;">
				<span onclick="document.getElementById('id01').style.display='none'"
					class="w3-button w3-display-topright">&times;</span>
				<img id="wideImg" src="" style="height:100%;">
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		crossorigin="anonymous"></script>
	<script src="/civ/resources/js/servicepage.js?after"></script>
	<script>
		$('.linkList li').each(function(){
	    	if($(this).html()=='문의답변'){
	    		$(this).attr('class','w3-button cus-btn btn-active');
	    	}
	    });

		var webSocket = new WebSocket("ws://192.168.219.102/civ/servicesocket/");
		webSocket.onopen = function(message) {
		};
		
		webSocket.onclose = function(message) {
			webSocket.close();
		};
		
		webSocket.onerror = function(message) {
		};
		
		webSocket.onmessage = function(message) {
			var jsonData = JSON.parse(message.data);
			$('tbody').prepend(
					'<tr class="w3-hover-light-blue" scCode="'
					+ jsonData.s_no + '"><td>' + jsonData.s_no
					+ '</td><td>' + jsonData.u_no + '</td><td>'
					+ jsonData.s_kindof + '</td><td>'
					+ jsonData.s_title + '</td><td>'
					+ jsonData.s_dateStr + '</td><td class="replyCheck">N</td></tr>');
			$('tr').click(
					function(e) {
						var scCode = $(this).attr('scCode');
						selectedScCode = scCode;
						$.ajax({
							type : "get",
							url : "/civ/admin/serviceinfo.json",
							data : {
								"serviceNo" : scCode
							},
							success : function(data) {
								$('#serviceWriter').html('작성자 : ' + data.userNo);
								$('#serviceTitle')
										.html('제목 : ' + data.serviceTitle);
								$('#serviceContent').val(data.serviceContent);
									$('#imgBox1').attr('src','');
									$('#imgBox2').attr('src','');
									$('#imgBox3').attr('src','');
									for (var i = 0; i < 3; i++) {
										if(data.imgPath[i] == null){
											$('#imgBox' + (i + 1)).hide();
										}else{
											$('#imgBox' + (i + 1)).show();
											$('#imgBox' + (i + 1)).attr('src','/civ/resources/upload/'+data.imgPath[i].serviceimgPath);
											$('#imgBox' + (i + 1)).click(
													function(e) {
														$('#wideImg').attr('src',
																$(this).attr('src'));
													});
										}
									}
							}
						});
					});
		};
	</script>
</body>

</html>