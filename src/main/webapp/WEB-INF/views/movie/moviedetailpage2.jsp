<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" type="text/css"
	href="/civ/resources/css/font.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.min.css">
<script src="https://kit.fontawesome.com/244e92cc7b.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/civ/resources/css/moviedetailpage.css">
<style>
	.footDiv{
		width:100% !important;
	}
</style>
<title>Document</title>
<title>Home</title>
</head>
<body>
	<%@include file="/resources/include/header.jsp"%>
	<div class="movieDetailContainer">
		<h1 class="movieDetailh1">영화 상세</h1>
		<div class="movieDetailInfoBox">
			<div class="movieDetailImgBox">
				<img id="movieDetailImg" src="${initParam['viewUploadPath']}${ mddto.movievo.moviePoster}">
			</div>
			<div class="movieDetailContentsBox">
				<div class="movieDetailTitle">
					<strong>${mddto.movievo.movieName}</strong>
					<c:if test="${mddto.movievo.isshow == 'Y'}">
						<span id='showStatus'>현재 상영중</span>
					</c:if>
					<c:if test="${mddto.movievo.isshow == 'N'}">
						<span id='showStatus'>상영 예정중</span>
					</c:if>
				</div>
				<div class="movieDetailScore">
					예매율 <span style="font-size: 22px">64.5%</span> 관람평점 <span
						style="font-size: 22px"> <span class="star-rating">
							<span style="width: ${mddto.movievo.grade*2*100/10}%;"></span>
					</span> ${mddto.movievo.grade}점
					</span>
				</div>
				<div class="movieDetailInfo">
					<b>개봉일 : </b>
					<p>${mddto.movievo.movieOpendate }</p>
					<br> <b>감독 : </b>
					<p>${mddto.movievo.movieDirector }</p>
					<br> <b>배우 : </b>
					<p>${mddto.movievo.movieActor }</p>
					<br> <b>장르 : </b>
					<p>${mddto.movievo.movieGenre }</p>
					/
					<p>${mddto.movievo.movieRuntime }분</p>
					<br> <b>누적관객 : </b>
					<p>
						<fmt:formatNumber value="${mddto.movievo.movieTotalview }"
							type="number" />
						명
					</p>
					<br> <br>
					<c:if test="${dibsCheck > 0}">
						<input type="button" id="dibBtn" class="w3-btn movieDibsBtn2"
							value="♥ 찜해제">
					</c:if>
					<c:if test="${dibsCheck == 0}">
						<input type="button" id="dibBtn" class="w3-btn movieDibsBtn"
							value="♥ 찜하기">
					</c:if>
					<a href="/civ/payment/reserve?movieCode=${mddto.movievo.movieCode}">
					<input type="button" class="w3-btn movieReserveBtn" value="예매하기"></a>
				</div>
			</div>
		</div>
		<div class="movieDetailPlot">
			<h2>줄거리</h2>
			${mddto.movievo.movieStory }
		</div>
		<div style="margin-top: 80px;">

			<div style="margin-top: 80px; margin-bottom: 15px;">
				<p class="stilcut">스틸컷 & 트레일러</p>
			</div>
			<div class="swiper-container gallery-thumbs">
				<div class="swiper-wrapper">
					<div class="swiper-slide video">
						<video
							poster="${initParam['viewUploadPath']}${mddto.movievo.moviePoster}"
							class="videos">
							<source src="${initParam['viewUploadPath']}${mddto.movieVideo[0].trailerVideo}" />
						</video>
					</div>
					<c:forEach var="img" items="${mddto.movieImg}">
						<div class="swiper-slide"
							style="background-image: url('${initParam['viewUploadPath']}${img.imgStilcut}')"></div>
					</c:forEach>
				</div>
			</div>
			<div class="swiper-container gallery-top">
				<div class="swiper-wrapper">
					<div class="swiper-slide video">
						<video
							poster="${initParam['viewUploadPath']}${mddto.movievo.moviePoster }"
							class="videos" controls>
							<source src="${initParam['viewUploadPath']}${mddto.movieVideo[0].trailerVideo}" />
						</video>
					</div>
					<c:forEach var="img" items="${mddto.movieImg}" varStatus="len">
						<div class="swiper-slide"
							style="background-image: url('${initParam['viewUploadPath']}${img.imgStilcut}')"></div>
					</c:forEach>
				</div>
				<div class="swiper-button-next"
					style="background: url(http://image2.megabox.co.kr/mop/home/btns/bg_stillcut_btn.png) 3px -428px no-repeat; background-position: -57px -428px;">
				</div>
				<div class="swiper-button-prev"
					style="background: url(http://image2.megabox.co.kr/mop/home/btns/bg_stillcut_btn.png) 3px -428px no-repeat;">
				</div>
			</div>
		</div>
		<div class="commentArea">
			<h2 style="margin: 70px 0px 30px 0px">평점 및 영화 리뷰</h2>
			<div class="commentInputBox">
				<div class="profileImgBox">
					<c:if test="${loginInfo.userProfile != null}">
						<img class="profileImg"
							src="${initParam['viewProfilePath']}${loginInfo.userProfile}">					
					</c:if>
					<c:if test="${loginInfo.userProfile == null}">
						<img class="profileImg"
							src="${initParam['viewImagePath']}null.png">					
					</c:if>
				</div>
				<div class="starChoiceBox">
					<span class="starspan sstar5" star="5">★</span><span
						class="starspan sstar4" star="4">★</span><span
						class="starspan sstar3" star="3">★</span><span
						class="starspan sstar2" star="2">★</span><span
						class="starspan sstar1" star="1">★</span>
					<div class="starComment"></div>
				</div>
				<c:if test="${loginInfo != null}">
					<input type="text" id="userComment"
						style="width: 650px; padding-left: 20px; border: 1px solid #e1e1e1;"
						maxlength="200" />
				</c:if>
				<c:if test="${loginInfo == null}">
					<input type="text" id="userComment"
						style="width: 650px; padding-left: 20px; border: 1px solid #e1e1e1;"
						maxlength="200" value="로그인이 필요합니다." disabled />
				</c:if>
				<input type="button" class="w3-button commentBtn" value="등록">
			</div>
			<div
				style="text-align: right; border-bottom: 1px solid #e1e1e1; font-size: 12px; margin-top: 20px;">
				<input type="button"
					style="font-family: 'GoyangDeogyang'; font-size: 15px;"
					class="thumbsOrder w3-button 추천순" value="추천순" />│<input
					type="button" class="newOrder w3-button 최신순"
					style="font-family: 'GoyangDeogyang'; font-size: 15px;" value="최신순" />
			</div>
			<div class="commentListBox">
				<c:forEach var="comment" items="${mddto.commentvo}" varStatus="st">
					<div class="commentBox">
						<div class="profileImgBox">
							<img class="profileImg"
								src="${initParam['viewProfilePath']}${comment.member.userProfile}">
						</div>
						<div class="commentIdStar">
							<span class="commentId">${comment.member.userNick}</span>
							<div>
								<span class="star-rating"> <span
									style="width: ${comment.comment.commentStar*2*100/10}%;"></span>
								</span>
							</div>
							<p style="font-size: 12px; color: #666;">${comment.comment.commentDate}</p>
						</div>
						<div style="width: 600px; margin-left: 50px;">
							<p style="margin-top: 20px;">${comment.comment.commentContent }</p>
						</div>
						<c:if test="${comment.comment.commentcheck == null}">
							<div style="margin-top: 40px; width: 90px;">
						</c:if>
						<c:if test="${comment.comment.commentcheck != null}">
							<div style="margin-top: 40px; color:red; width: 90px;">
						</c:if>
							<a class="thumbsBtn thumb_${comment.comment.commentNo}"
								onclick="thumbsup(${comment.comment.commentNo})"><i
								class="far fa-thumbs-up fa-1x"></i> 추천
								<p>${comment.comment.commentLikes}</p></a>
							</div>
					</div>
				</c:forEach>
		</div>
		<ul class="pagination justify-content-center">
			<c:if test="${pageMaker.prev }">
				<li class="page-item"><a class="page-link"
					onclick="prevPage(${(pageMaker.startPage-1)})">이전</a></li>
			</c:if>
			<c:forEach var="pagenum" begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }">
				<li class="page-item"><a class="page-link nowpage_${pagenum}"
					onclick="javascript:pageNum(${pagenum})">${pagenum}</a></li>
			</c:forEach>
			<c:if test="${pageMaker.next }">
				<li class="page-item"><a class="page-link"
					onclick="nextPage(${(pageMaker.endPage+1)})">다음</a></li>
			</c:if>

			<c:if test="${pageMaker.next }">
				<li class="page-item"><a class="page-link"
					onclick="lastPage(${(pageMaker.lastPage)})">맨끝</a></li>
			</c:if>
		</ul>
	</div>

	</div>
	<%@include file="/resources/include/footer.jsp"%>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		crossorigin="anonymous"></script>
	<script type="text/javascript"
		src="/civ/resources/js/moviedetailpage.js?after"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		
	<script>
		movieCode=${mddto.movievo.movieCode};
		tests(movieCode);
		function thumbsup(nowThumbs){
		   	$.ajax({
		   		type:'get',
		   		url:'/civ/movie/thumbsup.json',
		   		data:{'commentNo':nowThumbs},
		   		success:function(data){
		   			if(data != 0){
		   				$('.thumb_'+nowThumbs).css('color','black');
		   				$('.thumb_'+nowThumbs).children('p').html(parseInt($('.thumb_'+nowThumbs).children('p').html())-1);
		   			}else{
		   				$('.thumb_'+nowThumbs).css('color','red');		   				
		   				$('.thumb_'+nowThumbs).children('p').html(parseInt($('.thumb_'+nowThumbs).children('p').html())+1);
		   			}
		   		}
		   	});
		}
	</script>
</body>
</html>