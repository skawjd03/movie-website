<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="/civ/resources/css/font.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/civ/resources/css/dateLine.css">
<link rel="stylesheet" href="/civ/resources/css/reservepage.css?after">
<script src="https://kit.fontawesome.com/244e92cc7b.js"></script>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" ,initial-scale="1">
<title>예매페이지</title>
</head>

<body>
	<%@include file="/resources/include/header.jsp" %>
	<div style="margin-top: 10px; margin-bottom: 100px; text-align: center;">
		<div style="display: inline-block;">
			<div class="reserve_header">
				<h3>예매하기</h3>
			</div>
			<div id="dateContainer"></div>
			<br>
			<div class="reserve_container">
				<div class="reserve_moviemenu">
					<h3>영화</h3>
				</div>
				<div class="reserve_timemenu">
					<h3>상영시간표</h3>
				</div>
				<div class="test_form" style="">
					<div class="reserve_movieform">
						<div class="reserve_movieListform">
							<div class="reserve_moviekind">
								<a class="reserve_moviebtn btn reloadBtn">개봉순</a> <a
									class="reserve_moviebtn btn reloadBtn">예매순</a> <a
									class="reserve_moviebtn btn reloadBtn">평점순</a>
							</div>
							<div class="reserve_moviescrollList1" id="sc1" style="width:350px;">
								<c:forEach var="list" items="${mList}">
									<a onclick="movieChoice(${list.movieCode});" style="width:100%;">
										<div class="all reserve_movie" name="movie_${list.movieCode}" style="padding: 5px; width:">
											<c:choose>
												<c:when test="${list.movieAge == '12세이상관람가'}">
													<p class="ptags"
														style="background-color: #3bade0; border: 3px solid #3bade0;">12</p>
												</c:when>
												<c:when test="${list.movieAge == '15세이상관람가'}">
													<p class="ptags"
														style="background-color: #f1ac3f; border: 3px solid #f1ac3f;">15</p>
												</c:when>
												<c:when test="${list.movieAge == '청소년관람불가'}">
													<p class="ptags"
														style="background-color: #d23e42; border: 3px solid #d23e42;">19</p>
												</c:when>
												<c:when test="${list.movieAge == '전체관람가'}">
													<p class="ptags"
														style="background-color: #51a95a; border: 3px solid #51a95a;">전</p>
												</c:when>
											</c:choose>
											<em name="movieName_${list.movieCode}">${list.movieName}</em>
										</div>
									</a>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="reserve_timeform">
						<div class="reserve_timetable">
						</div>
					</div>
				</div>
				<div class="reserve_selectform">
					<div id="select_movie"></div>
					<div class="small_menu">상영</div>
					<div id="select_screen"></div>
					<div class="small_menu">일시</div>
					<div id="select_day"></div>
					<div id="select_time"></div>
					<div class="seatGo">
						<a onclick="seatPage()" class="btn seatGO">좌석 선택</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<form id="seatPageform" action="/civ/payment/movieseat" method="get">
		<input id="selectedScheduleCode" type="hidden" name="selected">
	</form>
	<%@include file="/resources/include/footer.jsp"%>
	<script src="https://code.jquery.com/jquery-3.4.1.js"
		integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="/civ/resources/js/dateLine.js"></script>
	<script src="/civ/resources/js/movieChoice.js?after"></script>
	<script src="/civ/resources/js/movieListShow.js"></script>
	<script>
	
		var mCode = '${mCode}';
		if(mCode !=''){
			movieChoice(mCode);
		}
		
		function seatPage(){
			if($('#selectedScheduleCode').val()==''){
				alert('영화를 선택하세요 ');
				return;
			}
			$('#seatPageform').submit();
		}
		$().ready(function(){
			scheduleAjax();
		});
		
		$().ready(function(){	
			scheduleAjax();
			$('.reloadBtn').on('click',function(e){
				$.ajax({
					type:'post',
					url:'/civ/payment/reserve/type.json',
					data:{'type':$(this).html()},
					
					success:function(data){
						$('.reserve_moviescrollList1').html('');
						for(var i = 0; i< data.length;i++){
							var a = $('<a onclick="movieChoice('+data[i].movieCode+');" style="width:100%;"></a>');
							var div = $('<div class="all reserve_movie" name="movie_'+data[i].movieCode+'" style="padding: 5px; width:"></div>');
							
							if(data[i].movieAge=='12세이상관람가'){
								div.append($('<p class="ptags" style="background-color: #3bade0; border: 3px solid #3bade0;">12</p>'));
							}else if(data[i].movieAge=='15세이상관람가'){
								div.append($('<p class="ptags" style="background-color: #f1ac3f; border: 3px solid #f1ac3f;">15</p>'));
							}else if(data[i].movieAge=='전체관람가'){
								div.append($('<p class="ptags" style="background-color: #51a95a; border: 3px solid #51a95a;">전</p>'));
							}else if(data[i].movieAge=='청소년관람불가'){
								div.append($('<p class="ptags" style="background-color: #d23e42; border: 3px solid #d23e42;">19</p>'));
							}
							div.append($('<em></em>').html(data[i].movieName));
							a.append(div);
							$('.reserve_moviescrollList1').append(a);
						}
					}
				});
			});
		});

	</script>
</body>

</html>