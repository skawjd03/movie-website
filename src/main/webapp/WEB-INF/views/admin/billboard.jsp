<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link href="https://www.w3schools.com/w3css/4/w3.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/244e92cc7b.js"></script>
<title>Document</title>
<style>
.fa-home {
	margin: 10px;
}

.linkList {
	margin-top: 35px;
}

.cus-btn {
	width: 100%;
	text-align: left;
}

.w3-main {
	margin-left: 200px;
}

#schedule {
	margin-left: 30px;
	margin-right: 30px;
}

.dashTitle {
	margin: 0;
	padding: 30px;
	font-weight: bold;
}

.billboardContainer {
	margin-left: 30px;
}

#billboardPreview {
	width: 1400px;
	text-align: center;
	background-color: rgb(211, 255, 255);
}

#billboard {
	display: inline-block;
	height: 550px;
	width: 75%;
	border: 1px solid gray;
}

#imageorvideo, #html {
	background-color: green;
	display: inline-block;
	width: 600px;
	height: 450px;
	margin-top: 20px;
	margin-left: 65px;
}
</style>
</head>

<body>

	<div class="admin_container">
		<%@include file="/resources/include/adminnav.jsp"%>
		<div class="w3-main">
			<h1 class="dashTitle">Schedule Manage</h1>
			<div class="billboardContainer">
				<div id="billboardPreview">
					<div id="billboard"></div>
				</div>
				<div style="margin-top: 20px;">
					<form action="/civ/admin/uploadbillboard" id="billboardform"
						method="POST" enctype="multipart/form-data">
						전광판 이미지 : <input onchange="billboardDraw(this);"
							name="billboardimg" type="file" id="billboardImgSelector"><br>
						<br> 전광판 링크 주소 : <input id="link" name="link" type="text"><br>
						<br>
						종료날짜 : <input id="finishDate" name="finishDate" type="date"><br><br>
						<button id="upload">업로드</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
        function billboardDraw(input){
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    $('#billboard').html('<img src="'+e.target.result+'" style="width:100%; height:100%;" />');
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
        
        $('#upload').on('click',function(e){
            e.preventDefault();
            if($('#billboardImgSelector').val() == ''){
                alert('이미지를 선택하세요.');
                return;
            }
            if($('#link').val() == ''){
                alert('링크를 입력하세요.');
                return;
            }
            var dateArr = $('#finishDate').val().split('-');
            if(new Date(dateArr[0],parseInt(dateArr[1])-1,dateArr[2],0,0,0) < new Date()){
            	alert('날짜는 오늘 이후부터 가능합니다.');
            	return;
            }
            
            $('#billboardform').submit();
        });
        
        $('.linkList li').each(function(){
	    	if($(this).html()=='전광판 등록'){
	    		$(this).attr('class','w3-button cus-btn btn-active');
	    	}
	    });
    </script>
</body>

</html>