<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.3.0/css/swiper.min.css">
<title>Home</title>
<style>
.billboard {
	height: 750px;
	width:100%;
	text-align: center;
	background-image: url("/civ${initParam['imagePath']}back.png");
}

.main_slide {
	display: inline-block;
	width: 70%;
	height: 100%;
}

.main_container {
	height: 450px;
	text-align: center;
	margin-top: 50px;
}

.main_movieRank, .main_moviePost {
	height: 108%;
	display: inline-block;
	width: 280px;
	margin-right: 25px;
	margin-left: 25px;
	position: relative;
	padding:10px;
}

.main_movieRank {
	top: -24px;
	border: 2px solid #666666;
}

.newsBox {
	height: 900px;
	text-align: center;
}

#news {
	width: 40%;
	margin-left: 400px;
	display: inline-block;
	height: 100%;
}

#main_image {
	width: 20%;
	display: inline-block;
	height: 100%;
	margin-left: 50px;
}

.swiper-container {
	width: 100%;
	height: 100%;
}

newsBox
    .swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

.swiper-pagination-bullet {
	width: 20px;
	height: 20px;
	text-align: center;
	line-height: 20px;
	font-size: 12px;
	color: #000;
	opacity: 1;
	background: rgba(158, 158, 158, 0.2);
}

.swiper-pagination-bullet-active {
	color: #fff;
	background: #007aff;
}

.slideImg {
	width: 100%;
	vertical-align: middle;
	line-height: 150%;
	height: 100%;
}

.slideVideo {
	width: 100%;
	height: 100%;
}

.imgLink {
	width: 100%;
	height: 100%;
}

.rankNumBox {
	display: inline-block;
	width: 20px;
	height: 20px;
	background-color: #aaa;
	text-align: center;
	margin-left: 15px;
}

p {
	display: inline-block;
}

.sortLeft {
	text-align: left;
	margin-bottom: 5px;
}

h4 {
	font-size: 24px;
	font-weight: bold;
}

.ptags {
	display: inline-block;
	margin: 0px;
	border-radius: 50%;
	color: white;
	margin-left: 3px;
}

/********************* shopping Demo-1 **********************/
.product-grid {
	font-family: Raleway, sans-serif;
	text-align: center;
	padding: 0 0 72px;
	border: 1px solid rgba(0, 0, 0, .1);
	overflow: hidden;
	position: relative;
	z-index: 1
}

.product-grid .product-image {
	position: relative;
	transition: all .3s ease 0s
}

.product-grid .product-image a {
	display: block
}

.product-grid .product-image img {
	width: 100%;
	height: auto
}

.product-grid .pic-1 {
	opacity: 1;
	transition: all .3s ease-out 0s;
	padding-bottom: 10px;
}

.product-grid:hover .pic-1 {
	opacity: 1;
	filter: brightness(50%);
}

.product-grid .social {
	width: 270px;
	padding: 0;
	margin: 0;
	list-style: none;
	opacity: 0;
	transform: translateY(-50%) translateX(-50%);
	position: absolute;
	top: 60%;
	left: 50%;
	z-index: 1;
	transition: all .3s ease 0s
}

.product-grid:hover .social {
	opacity: 1;
	top: 50%
}

.product-grid .social li {
	display: inline-block;
}

.product-grid .social li a {
	color: #fff;
	font-size: 16px;
	line-height: 40px;
	text-align: center;
	height: 80px;
	width: 120px;
	margin: 0 2px;
	display: block;
	position: relative;
}

.product-grid .social li a:after, .product-grid .social li a:before {
	content: attr(data-tip);
	color: #fff;
	font-size: 14px;
	letter-spacing: 1px;
	line-height: 20px;
	padding: 1px 5px;
	white-space: nowrap;
	opacity: 0;
	transform: translateX(-50%);
	position: absolute;
	left: 50%;
	top: -30px
}

.product-grid .social li a:after {
	content: '';
	height: 15px;
	width: 15px;
	border-radius: 0;
	transform: translateX(-50%) rotate(45deg);
	top: -20px;
	z-index: -1
}

.product-grid .social li a:hover:after, .product-grid .social li a:hover:before
	{
	opacity: 1
}

.product-grid .rating {
	color: #FFD200;
	font-size: 12px;
	padding: 12px 0;
	margin: 0;
	list-style: none;
	position: relative;
	z-index: -1
}

.product-grid .rating li.disable {
	color: rgba(0, 0, 0, .2)
}

.product-grid .product-content {
	background-color: #fff;
	text-align: center;
	margin: 0 auto;
	position: absolute;
	left: 0;
	right: 0;
	z-index: 1;
}

.product-grid:hover .product-content {
	bottom: 0;
}

.product-grid .title {
	font-size: 13px;
	font-weight: 400;
	letter-spacing: .5px;
	text-transform: capitalize;
	margin: 0 0 10px;
}

.product-grid .title a {
	color: black;
}

.product-grid .title a:hover, .product-grid:hover .title a {
	color: #ef5777
}

.product-grid .price {
	color: #333;
	font-size: 17px;
	font-family: Montserrat, sans-serif;
	font-weight: 700;
	letter-spacing: .6px;
	margin-bottom: 18px;
	text-align: center;
}

.product-grid .price span {
	color: #999;
	font-size: 13px;
	font-weight: 400;
	margin-left: 3px;
	display: inline-block
}

@media only screen and (max-width:990px) {
	.product-grid {
		margin-bottom: 30px
	}
}

.ptags {
	display: inline-block;
	margin: 0px;
	background-color: red;
	border-radius: 50%;
	color: white;
	border: 3px solid red;
}

a {
	text-decoration: none !important;
}

.rankBtn {
	text-decoration: none;
	color: black;
}

.rankBtn:hover {
	color: rgb(d, 2, d);
}
</style>
</head>
<body>
	<%@include file="/resources/include/header.jsp"%>

	<div class="billboard">
		<div class="main_slide">
			<!-- Swiper -->
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<c:forEach var="slide" items="${slideList}">
						<div class="swiper-slide">
							<a class="imgLink" href="${slide.billboardLink }"> <img
								class="slideImg" src="${slide.billboardImg}" controls="controls"></a>
						</div>
					</c:forEach>
				</div>
				<!-- Add Pagination -->
				<div class="swiper-pagination"></div>
			</div>

		</div>
	</div>

	<div class="main_container">
		<div class="main_movieRank">
			<div style="margin-bottom: 30px;">
				<div style="float:right;">
					<a class="movieListType">개봉순</a> | <a class="movieListType">예매순</a>
				</div>
			</div>
			<div id="mainMovieListBox">
				
			</div>
		</div>
		<c:forEach var="poster" items="${posterList}">
			<div class="main_moviePost">
				<div>
					<div class="product-grid">
						<div class="product-image">
							<a href="#"> <img class="pic-1" src="${initParam['uploadPath']}${poster.moviePoster }"
								style="z-index: 0">
							</a>
							<ul class="social">
								<li><a
									href="/civ/movie/moviedetailpage2?movieCode=${poster.movieCode}"
									data-tip="상세보기"><img src="/civ${initParam['imagePath']}searcj.png"
										style="height: 100%; width: 100%"></a></li>
								<li><a
									href="/civ/payment/reserve?movieCode=${poster.movieCode}"
									data-tip="예매하기"><img src="/civ${initParam['imagePath']}ticket.png"
										style="height: 100%; width: 100%"></a></li>
							</ul>
						</div>
						<div class="product-content">
							<h3 class="title">
								<a href="/civ/payment/reserve?movieCode=${poster.movieCode}"> <c:choose>
										<c:when test="${poster.movieAge == '12세이상관람가'}">
											<p class="ptags"
												style="background-color: #3bade0; border: 3px solid #3bade0;">12</p>
										</c:when>
										<c:when test="${poster.movieAge == '15세이상관람가'}">
											<p class="ptags"
												style="background-color: #f1ac3f; border: 3px solid #f1ac3f;">15</p>
										</c:when>
										<c:when test="${poster.movieAge == '청소년관람불가'}">
											<p class="ptags"
												style="background-color: #d23e42; border: 3px solid #d23e42;">19</p>
										</c:when>
										<c:when test="${poster.movieAge == '전체관람가'}">
											<p class="ptags"
												style="background-color: #51a95a; border: 3px solid #51a95a;">All</p>
										</c:when>
									</c:choose> <b style="font-size: 14pt"> ${poster.movieName}</b>
								</a>
							</h3>
							<div class="price">${poster.movieGenre }</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>

	<%@include file="/resources/include/footer.jsp"%>
	
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.3.0/js/swiper.min.js"></script>
	<script>
      var swiper = new Swiper('.swiper-container', {
         loop : true,
         navigation : {
            nextEl : '.swiper-button-next',
            prevEl : '.swiper-button-prev',
         },
         pagination : {
            el : '.swiper-pagination',
            clickable : true,
         },
      });
      getMainMovielist('new');
      
      function myFunction() {
           var x = document.getElementById("Demo");
           if (x.className.indexOf("w3-show") == -1) {
             x.className += " w3-show";
           } else { 
             x.className = x.className.replace(" w3-show", "");
           }
         }

     $('.movieListType').on('click',function(){
		var type = 'new';
		if ($(this).html() == '개봉순'){
			type="new";
		}else if($(this).html() == '예매순'){
			type="view";
		}
		getMainMovielist(type);
     });

     function getMainMovielist(type){
    	 $.ajax({
 			type:"get",
 			url:"/civ/mainmovielist",
 			data:{'type':type},
 			success:function(data){
 				$('#mainMovieListBox').html('');
 				$('#mainMovieListBox').html(data);
 			}
 		});
     }
   </script>
</body>
</html>
