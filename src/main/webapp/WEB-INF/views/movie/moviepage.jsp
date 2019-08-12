<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" type="text/css"
   href="/civ/resources/css/font.css">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.min.css">
<script src="https://kit.fontawesome.com/244e92cc7b.js"></script>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/civ/resources/css/moviedetailpage.css">
<script type="text/javascript" src="/civ/resources/js/moviedetailpage.js"></script>
<title>영화페이지 테스트</title>

<!-- 

	 @author HJS
	 @since 2019.07.18
	 @version 1.0
	 @see 영화 페이지
	 
-->

</head>

<style>

	html, body {
		margin: 0px;
		padding: 0px;
	}
	
	/* view line 속성 */
	.MoviesShowLine {
		margin-top:50px;
		margin-bottom:50px;
		text-align:center;
	}
	div#show {
		display: inline-block;
	}
	.MoivesChartShowLine {
		display:inline-block;
		width: 1300px;
	}

	#PacchMoivesChart {
		display: inline-block;
		text-align: left;
		font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
		font-size: xx-large;
	}
	.line {
		border: 1px solid black;
		margin-top: 10px;
		margin-bottom: 10px;
	}

	/* content 속성 */
	.MoivesChartImg_box {
		display: inline-block;
		height: auto;
		width: 300px;
		margin-left: 20px;
	/*	margin-left: 4%; */
	}
	.MoivesChartImg_endbox {
		display: inline-block;
		height: auto;
		width: 300px;
	}
	.MoivesChartImg_no {

		background-color: rgb(165, 86, 86);
		border: 5px solid black;
		text-align: center;
		height: 50px;
		margin-bottom: 5px;
		margin-top: 10px;
		font-weight:bold;
		font-size: xx-large;
		color: white;
		font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	}
	.MoivesChartImg_img {

		border: 5px solid black;
		height: 400px;
		margin-bottom: 5px;
	}

	.MoviesChartImg_name {

		background-color: white;
		border: 5px solid white;
		text-align: center;
		height: 30px;
		margin-top: 10px;
		font-weight:bold;
		font-size: large;
		color: black;
		font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	}

	/* 버튼 속성 */
	.btn_top{
      text-decoration: none;
      font-size:1rem;
      color:rgb(0, 0, 0);
      padding:10px 20px 10px 20px;
      margin:0px 10px;
      display:inline-block;
      border-radius: 10px;
      transition:all 0.1s;
      font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	  float: right;
    }
	.btn_bottom{
      text-decoration: none;
      font-size:1rem;
      color:rgb(0, 0, 0);
      padding:10px 20px 10px 20px;
      margin:0px 10px;
      display:inline-block;
      border-radius: 10px;
      transition:all 0.1s;
      font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

	.btn_imgbottom{
      text-decoration: none;
      font-size:1rem;
      color:rgb(0, 0, 0);
      padding:5px 10px 5px 10px;
      margin:0px 5px;
      display:inline-block;
      border-radius: 3px;
      transition:all 0.1s;
      font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	  float: center;
    }
    .btn_bottom:active{transform: translateY(3px);}
	.btn_top:active{transform: translateY(3px);}
	.btn_imgbottom:active{transform: translateY(3px);}

	/* 아래 버튼 */
    .btn_bottom.plus{background-color: #9fa1a5da;border-bottom:5px solid #9fa1a5da;}
    .btn_bottom.plus:active{border-bottom:2px solid#9fa1a5da;}
    .btn_bottom.home{background-color: #9fa1a5da;border-bottom:5px solid #9fa1a5da;}
    .btn_bottom.home:active{border-bottom:2px solid#9fa1a5da;}

	/* 위 버튼 */
	.btn_top.NowMovies{background-color: #9fa1a5da;border-bottom:5px solid #9fa1a5da;}
    .btn_top.NowMovies:active{border-bottom:2px solid#9fa1a5da;}
    .btn_top.SoonMovies{background-color: #9fa1a5da;border-bottom:5px solid #9fa1a5da;}
    .btn_top.SoonMovies:active{border-bottom:2px solid #9fa1a5da;}
	.btn_top.Reserve{background-color: #9fa1a5da;border-bottom:5px solid #9fa1a5da;}
    .btn_top.Reserve:active{border-bottom:2px solid #9fa1a5da;}

	/* 이미지 하단 버튼 */
	.btn_imgbottom.ImgDetail{background-color: rgb(212, 212, 212);border-bottom:5px solid rgb(212, 212, 212);}
    .btn_imgbottom.ImgDetail:active{border-bottom:2px solid rgb(212, 212, 212);}
	.btn_imgbottom.ImgReserve{background-color: rgb(212, 212, 212);border-bottom:5px solid rgb(212, 212, 212);}
    .btn_imgbottom.ImgReserve:active{border-bottom:2px solid rgb(212, 212, 212);}

	.btn_center{
		text-align: center;
	}

	.images {
		width: 100%;
		max-width: 300px;
		height: 100%;
		max-height: 400px;
		vertical-align: middle;
		-webkit-transform: scale(1);
		-moz-transform: scale(1);
		-ms-transform: scale(1);
		-o-transform: scale(1);
		transform: scale(1);
		-webkit-transition: all 0.3s ease-in-out;
		-moz-transition: all 0.3s ease-in-out;
		transition: all 0.3s ease-in-out;
	}

	.images:hover {
		-webkit-transform: scale(1.05);
		-moz-transform: scale(1.05);
		-ms-transform: scale(1.05);
		-o-transform: scale(1.05);
		transform: scale(1.05);
	}
	
	#show{
		text-align: left;
	}
	
</style>

<body>
	<%@include file="/resources/include/header.jsp"%>
	<div class="MoviesShowLine">
		<div class="MoivesChartShowLine">
			<div>
				<h1 id="PacchMoivesChart">Pacch Moives Chart</h1>
				<a class="btn_top Reserve" href="/civ/payment/reserve" onmouseover="this.style.color='#FFFFFF'" onmouseout="this.style.color='#000000'"><strong> 예매 바로가기 </strong></a>
				<a class="btn_top SoonMovies" id="soon_btn" onmouseover="this.style.color='#FFFFFF'" onmouseout="this.style.color='#000000'"><strong> 상영 예정작 </strong></a>
				<h2 class="line"></h2>
			</div>
			<div id="show">
				<c:forEach var="data" items="${LIST}" varStatus="status" begin="0" end="${VIMG}">
					<div class="MoivesChartImg_box">
						<div class="MoivesChartImg_no"><strong> NO.${status.count} </strong></div>
						<div class="MoivesChartImg_img">
							<a href="/civ/movie/moviedetailpage2?movieCode=${data.movieCode}"><img src="${initParam['viewUploadPath']}${data.moviePoster}" class="images" ></a>
						</div>
						<div class="MoviesChartImg_name">${data.movieName}</div>
						<div class="btn_center">
							<a class="btn_imgbottom ImgDetail" mCode="${data.movieCode}" onmouseover="this.style.color='#FFFFFF'" onmouseout="this.style.color='#000000'"><strong> 상세 보기 </strong></a>
							<a class="btn_imgbottom ImgReserve" href="/civ/payment/reserve?movieCode=${data.movieCode}" onmouseover="this.style.color='#FFFFFF'" onmouseout="this.style.color='#000000'"><strong> 빠른 예매 </strong></a>
						</div>
					</div>
				</c:forEach>
				<h2 class="line"></h2>
				<div id="plus_btn" >
					<div class="btn_center">
						<a class="btn_bottom plus" onmouseover="this.style.color='#FFFFFF'" onmouseout="this.style.color='#000000'"><strong> + </strong></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<%@include file="/resources/include/footer.jsp"%>
	
	<!-- 영화 모달 -->
	<div id="id01" class="w3-modal">
      <div class="w3-modal-content">
         <div class="w3-container modalDiv">
            <span style="font-size: 18pt;" onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-display-topright">&times;</span>
         </div>
      </div>
   </div>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
      integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
      crossorigin="anonymous"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script type="text/javascript">

	// 더 보기 버튼 ajax 처리
	$(document).ready(function(){
		
		$('#plus_btn').click(function(){
	
			$('#show').empty();
			
			$.ajax({
	
				type: "GET",
	
				url: "/civ/movie/showallimg.json",
	
				dataType: "json",
				
				success:function(data){
					
					$('#PacchMoivesChart').text('현재 상영중인 영화(전체)');
					
					var len = data.length;
					for(var i = 0; i<len; i++){
		            	$('#show').append(
		            			
		            			'<div class="MoivesChartImg_box">' +
			            			'<div class="MoivesChartImg_no"><strong> NO.'+ (i+1) + '</strong></div>' + 
			            			'<div class="MoivesChartImg_img">' +
			            				'<a href="#"><img src="/civ/resources/upload/' + data[i].moviePoster + '" class="images"/></a>' +
			            			'</div>' + 
			            			'<div class="MoviesChartImg_name">' + data[i].movieName + '</div>' +
			            			'<div class="btn_center">' +
			            				'<a class="btn_imgbottom ImgDetail" onclick="movieDetailModal('+data[i].movieCode+')" onmouseover="this.style.color=\'#FFFFFF\'" onmouseout="this.style.color=\'#000000\'"><strong> 상세 보기 </strong></a>' +
			            				'<a class="btn_imgbottom ImgReserve" href="#" onmouseover="this.style.color=\'#FFFFFF\'" onmouseout="this.style.color=\'#000000\'"><strong> 빠른 예매 </strong></a>' +
			            			'</div>' +
		            			'</div>'
		            		);
					}
					$('.ImgDetail').click(function(){
						var mCode = $(this).attr('mCode');
						getMovieDetailModal(mCode);
					});
				}, error:function(){
					alert('------------------------------- e r r o r ---------------------------------');
				}
			});
		});
	});


	//상영 예정작 버튼 ajax 처리
	$(document).ready(function(){
		$('#soon_btn').click(function(){
			
			$('#show').empty();
			
			$.ajax({
				
				type: "GET",
				
				url: "/civ/movie/moviesoon.json",
				
				dataType: "json",
	
				success:function(data){
					
					$('#PacchMoivesChart').text('상영 예정작');
					
					var len = data.length;
					for(var i = 0; i<len; i++){
		            	$('#show').append(
		            			'<div class="MoivesChartImg_box">' +
			            			'<div class="MoivesChartImg_no"><strong> NO.'+ (i+1) + '</strong></div>' + 
			            			'<div class="MoivesChartImg_img">' +
			            				'<a href="#"><img src="/civ/resources/upload/' + data[i].moviePoster + '"class="images"/></a>' +
			            			'</div>' + 
			            			'<div class="MoviesChartImg_name">' + data[i].movieName + '</div>' +
			            			'<div class="btn_center">' +
				            			'<a class="btn_imgbottom ImgDetail" href="/civ/movie/moviedetailpage2?movieCode=' + data[i].movieCode +'" onmouseover="this.style.color=\'#FFFFFF\'" onmouseout="this.style.color=\'#000000\'"><strong> 상세 보기 </strong></a>' +
			            				'<a class="btn_imgbottom ImgReserve" href="#" onmouseover="this.style.color=\'#FFFFFF\'" onmouseout="this.style.color=\'#000000\'"><strong> 빠른 예매 </strong></a>' +
			            			'</div>' +
		            			'</div>'
		            		)
					}
				}, error:function(){
					alert('------------------------------- e r r o r ---------------------------------');
				}
			});
		});

	});

	$('.ImgDetail').click(function(){
		var mCode = $(this).attr('mCode');
		getMovieDetailModal(mCode);
	});
	function getMovieDetailModal(mvCode){
		$.ajax({
	          type:"get",
	          data:{"movieCode":mvCode},
	          url:"/civ/movie/moviedetail",
	          success:function(dom){
	                $('.modalDiv').html("<span style='font-size: 18pt;' onclick='document.getElementById(\"id01\").style.display=\"none\"' class='w3-button w3-display-topright'>&times;</span>");
	                $('.modalDiv').append(dom.toString());
	                document.getElementById("id01").style.display='block';
	                movieCode = mvCode;
	                tests(mvCode);
	          }
	      });
	}

</script>
</body>

</html>