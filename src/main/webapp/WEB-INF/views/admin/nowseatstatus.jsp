<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://www.w3schools.com/w3css/4/w3.css" rel="stylesheet">
    <link rel="stylesheet" href="/civ/resources/css/dateLine.css">
    <script src="https://kit.fontawesome.com/244e92cc7b.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|East+Sea+Dokdo|Jua&display=swap"
        rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Black+And+White+Picture&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/civ/resources/css/timepicker.css" />
    <link rel="stylesheet" href="/civ/resources/css/font.css">
    <link rel="stylesheet" href="/civ/resources/css/nowseatpage.css?after">
    <title>Document</title>
</head>
<body>
	
    <div class="admin_container">
        <%@include file="/resources/include/adminnav.jsp" %>
        
        <div class="w3-main">
            <h1 class="dashTitle">Movie Seat Status</h1>
				
            <div id="dateContainer"></div>
            
            <div id="seatContainer"></div>
            
        </div>
    </div>
	
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="/civ/resources/js/dateLine.js"></script>
    <script src="/civ/resources/js/nowseatpage.js?after"></script>
    <script>
	    $('.linkList li').each(function(){
	    	if($(this).html()=='좌석현황판'){
	    		$(this).attr('class','w3-button cus-btn btn-active');
	    	}
	    });
    </script>
</body>

</html>