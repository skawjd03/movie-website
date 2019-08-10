<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Swiper demo</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.3.0/css/swiper.min.css">

<script src="https://kit.fontawesome.com/244e92cc7b.js"></script>


<!-- Demo styles -->
<style>
body {
	background-image: url('/civ/resources/img/space.jpg');
	font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
	font-size: 14px;
	color: #000;
	margin: 0;
	padding: 0;
	text-align: center;
}

.swiper-container {
	width: 100%;
	padding-top: 200px;
	padding-bottom: 50px;
	height: 700px;
}

.swiper-slide {
	background-position: center;
	background-size: cover;
	width: 230px;
	height: 400px;
	display: flex;
	/* 내용을 중앙정렬 하기위해 flex 사용 */
	align-items: center;
	/* 위아래 기준 중앙정렬 */
	justify-content: center;
	/* 좌우 기준 중앙정렬 */
	box-sizing: border-box;
}

.swiper-slide-active {
	width: 260px !important;
}

.slider {
	display: inline-block;
}

/********************* shopping Demo-1 **********************/
.product-grid {
	font-family: Raleway, sans-serif;
	text-align: center;
	padding: 0 0 72px;
	border: 1px solid rgba(0, 0, 0, .1);
	overflow: hidden;
	position: relative;
	z-index: 1;
	width: 100%;
	height: auto;
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
	height: auto;
}

.product-grid .pic-1 {
	opacity: 1;
	transition: all .3s ease-out 0s;
}

.product-grid:hover .pic-1 {
	opacity: 1;
	filter: brightness(50%);
}

.product-grid .social {
	width: 100%;
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

.product-grid .social li a:hover {
	color: #fff;
}

.product-grid .social li a:after, .product-grid .social li a:before {
	content: attr(data-tip);
	color: rgb(255, 255, 255);
	font-size: 14px;
	letter-spacing: 1px;
	line-height: 20px;
	padding: 1px 5px;
	white-space: nowrap;
	opacity: 0;
	transform: translateX(-50%);
	position: absolute;
	left: 50%;
	top: -20px
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
	padding-top: 20px;
}

.product-grid .title a {
	color: rgb(255, 255, 255);
}

.product-grid .price {
	color: rgb(230, 230, 230);
	font-size: 17px;
	font-family: Montserrat, sans-serif;
	font-weight: 700;
	letter-spacing: .6px;
	margin-bottom: 18px;
	text-align: center;
}

.product-grid .price span {
	color: rgb(221, 221, 221);
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
	border-radius: 50%;
	color: white;
}

a {
	text-decoration: none !important;
}
</style>
</head>

<body>
	<div>
		<a href="/civ/main"><i class="fas fa-home fa-4x"
			style="color: #e34040; margin-top: 30px; float: left; margin-left: 30px; margin-bottom: 100px;"></i></a>
	</div>
	<div class="slider" style="width: 100%; overflow: hidden;">
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<c:forEach var="f" items="${list}">
					<div class="swiper-slide">
						<div class="product-grid">
							<div class="product-image">
								<a href=""> <img class="pic-1" src="${f.moviePoster}"
									style="z-index: 0">
								</a>
								<ul class="social">
									<li><a href="/civ/movie/moviedetailpage2?movieCode=${f.movieCode}"
										data-tip="상세보기"><img src="/civ/resources/img/searcj.png"
											style="height: 100%; width: 100%"></a></li>
									<li><a href="/civ/payment/reserve?movieCode=${f.movieCode }"
										data-tip="예매하기"><img src="/civ/resources/img/ticket.png"
											style="height: 100%; width: 100%"></a></li>
								</ul>
							</div>
							<div class="">
								<h3 class="title">
									<a href="/civ/payment/reserve?movieCode=${f.movieCode }"> 
										<c:choose>
											<c:when test="${f.movieAge == '12세이상관람가'}">
												<p class="ptags"
													style="background-color: #3bade0; border: 3px solid #3bade0;">12</p>
											</c:when>
											<c:when test="${f.movieAge == '15세이상관람가'}">
												<p class="ptags"
													style="background-color: #f1ac3f; border: 3px solid #f1ac3f;">15</p>
											</c:when>
											<c:when test="${f.movieAge == '청소년관람불가'}">
												<p class="ptags"
													style="background-color: #d23e42; border: 3px solid #d23e42;">19</p>
											</c:when>
											<c:when test="${f.movieAge == '전체관람가'}">
												<p class="ptags"
													style="background-color: #51a95a; border: 3px solid #51a95a;">전</p>
											</c:when>
										</c:choose> <b style="font-size: 14pt;">${f.movieName}</b>
									</a>
								</h3>
								<div class="price">
									<span>${f.movieGenre}</span>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	
   
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.3.0/js/swiper.min.js"></script>

	<!-- Initialize Swiper -->
	<script>
	    var swiper = new Swiper('.swiper-container', {
	      initialSlide: 4,
	      effect: 'coverflow',
	      grabCursor: true,
	      centeredSlides: true,
	      slidesPerView: 'auto',
	      autoplayDisableOnInteraction: true,
	      loop: true,
	      speed:300,
	      spaceBetween:-20,
	      autoplay: {
	        delay: 1000,
	      },
	      coverflowEffect: {
	        rotate: 40,
	        stretch: 0,
	        depth: -200,
	        modifier: 1,
	        slideShadows: true,
	      },
	      navigation: {
	        nextEl: '.swiper-button-next',
	        prevEl: '.swiper-button-prev',
	      },
	      pagination: {
	        el: '.swiper-pagination',
	        clickable: true,
	      },
	    });

	    

  </script>
</body>

</html>