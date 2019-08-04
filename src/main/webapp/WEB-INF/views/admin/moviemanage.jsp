<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<link href="https://www.w3schools.com/w3css/4/w3.css" rel="stylesheet">
<link rel="stylesheet" href="/civ/resources/css/font.css"/>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="/civ/resources/css/moviemanagepage.css?after">
<script src="https://kit.fontawesome.com/244e92cc7b.js"></script>
</head>

<body>

	<div class="admin_container">
		<%@include file="/resources/include/adminnav.jsp" %>

		<div class="w3-main" style="width: 1800px;">
			<h1 class="dashTitle">영화 관리</h1>
			
		</div>
		<div style="text-align: center; width:1528px; margin-left:200px; margin-bottom: 20px;">
			<button class="w3-btn" onclick="getNextList();">더보기</button>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		crossorigin="anonymous"></script>
	<script src="/civ/resources/js/moviemanagepage.js"></script>
	<script>
    $('.linkList li').each(function(){
    	if($(this).html()=='영화상태 관리'){
    		$(this).attr('class','w3-button cus-btn btn-active');
    	}
    });
	</script>
</body>

</html>