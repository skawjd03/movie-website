<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<link href="https://www.w3schools.com/w3css/4/w3.css" rel="stylesheet">
<link rel="stylesheet" href="/civ/resources/css/font.css"/>
<script src="https://kit.fontawesome.com/244e92cc7b.js"></script>
<link rel="stylesheet" href="/civ/resources/css/movieupdatepage.css">
</head>

<body>

	<div class="admin_container">
	
		<%@include file="/resources/include/adminnav.jsp" %>
		
		<div class="w3-main">

			<h1 class="dashTitle">영화 등록</h1>
			<div>

				<div class="movie_choice_box">
					<h5>영화 선택</h5>
					<div class="table_scroll_maker">
						<table class="movie_list">
							<thead>
								<tr>
									<th class="movie-option">영화코드</th>
									<th class="movie-option">개봉일</th>
									<th class="movie-title">제목</th>
									<th class="movie-gre">장르</th>
									<th class="movie-option">국가</th>
									<th class="movie-option">감독</th>
								</tr>
							</thead>
							<tbody class="movie_container">
							</tbody>
						</table>
					</div>
					<div>
						국가 : <select class="searchData" id='country'>
							<option value="">--</option>
							<option value="국내">국내</option>
							<option value="국외">국외</option>
						</select> 제목 : <input class="searchData" id="title" type="text"
							placeholder="영화 제목"> 감독명 : <input class="searchData"
							id="director" type="text" placeholder="감독명">

					</div>
				</div>
				<div class="movie_choice_box">
					<h5>줄거리</h5>
					<div class="story_parent">
						<textarea id="storyboard" rows="10" cols="400" name="movieStory"></textarea>
					</div>
				</div>
			</div>
			<div>
				<div class="movie_choice_box">
					<h5>이미지 선택</h5>
					<div class="image_parent">
						<div class="image-choice"></div>
					</div>
					<label for="fileUpload">이미지</label> <input id="fileUpload"
						name="stilcut" type="file" onchange="imageTest(this)"
						accept=".jpg,.gif,.png">
				</div>
				<div class="movie_choice_box">
					<h5>포스터 선택</h5>
					<div class="post_parent">
						<div class="post_choice">
							
						</div>
					</div>
					<label for="postUpload">포스터</label> <input id="postUpload"
						name="post" type="file" onchange="postTest(this)"
						accept=".jpg,.gif,.png">
				</div>
			</div>

			<div>
				<div class="movie_choice_box">
					<h5>트레일러</h5>
					<div class="video_parent">
						<div class="video-choice"></div>
					</div>
					<label for="fileUpload2">파일</label> <input id="fileUpload2"
						name="trailer" type="file" onchange="videoTest(this)"
						accept=".mp4"/>
				</div>
				<div class="movie_choice_box">
					<h5>와이드 포스트 선택</h5>
					<div class="post_parent">
						<div class="widepost-choice">
						</div>
					</div>
					<label for="widePostUpload">포스터</label> <input id="widePostUpload"
						name="widePost" type="file" onchange="widePostTest(this)"
						accept=".jpg,.gif,.png"/>
				</div>
			</div>


			<form id="form" action="/civ/admin/movieupload" method="post"
				enctype="multipart/form-data" accept-charset="UTF-8">
				<div></div>
				<input type="button" onclick="uploadMovie();" value="업로드">
			</form>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		crossorigin="anonymous"></script>
	<script src="/civ/resources/js/movieupdatepage.js?after"></script>
	<script type="text/javascript">
        $('.linkList li').each(function(){
	    	if($(this).html()=='영화 등록'){
	    		$(this).attr('class','w3-button cus-btn btn-active');
	    	}
	    });
    </script>
</body>

</html>