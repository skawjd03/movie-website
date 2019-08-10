<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- <link rel="stylesheet" href="/css/styles.css"> -->
 	<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>Document</title>
     <script src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/civ/resources/css/noticeDetail.css" />
<style>
	
	
</style>
<script type="text/javascript">
	$(document).ready(function(){
	
		$('#back_btn').click(function(){
			$(location).href("noticeForm.s5");
		});


	});
	
	function getId(aaa){
		var tt = $(aaa).attr('id');
		
		$('#idx').val(tt);
		$('#notice_f').submit();
	}
</script>
</head>
<body>
		<%@include file="/resources/include/header.jsp"%>
	<div class="detail_container">
		<div class="head_nt">
			<hr>
			<div class="detail_title"><b>${DATA.n_title}</b></div> 
				<label>영화관 : <a> 영화관데이터     </a></label>
				<label>등록일 : <a> ${DATA.n_date} </a></label>
				<label>조회수 : <a> ${DATA.n_hit} </a></label>
			<hr>
		</div>
		
		<div class="body_nt">	
			<p class="contentArea">
				${DATA.n_content}
			</p>
		</div>
	</div>
	
		<form method="POST" action="noticeDetail.s5" name="notice_f" id="notice_f">
				<input type="hidden" id="idx" name="n_no">
		</form>
			<div class="foot">
				<div class="undervar">
					<div class="underView">
						<label>이전글 : </label>
						<div class="baView"  id="${DATA2.n_no}" onclick="getId(this);">${DATA2.n_title}</div>
					</div>
					<div class="underView">
						<label style="display: inline-block;">다음글 : </label>
						<div class="baView" id="${DATA1.n_no}" onclick="getId(this);">${DATA1.n_title}</div>
					</div>
				</div>
			</div>
	
	<input type="button" value="목록" class="back_btn" id="back_btn" onclick="javascript:location.href='noticeForm.s5';" />
	<br>
	<br>
		<%@include file="/resources/include/footer.jsp"%>
</body>

</html>