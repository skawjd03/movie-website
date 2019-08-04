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
<script src="https://cdn.zingchart.com/zingchart.min.js"></script>
<title>Document</title>
<style>
.dashContainer {
	width: 1500px;
}

.zc-ref {
	display: none;
}

zing-grid[loading] {
	height: 800px;
}
.w3-main{
	padding: 30px;
}
#chartContainer{
	display: inline-block;
	width: 400px;
	height: 450px;
}
#chart_div{
	display: inline-block;
}
</style>
</head>

<body>

	<div class="admin_container">

		<%@include file="/resources/include/adminnav.jsp"%>

		<div class="w3-main">
			<h1 class="dashTitle">Dashboard</h1>
			<div class="dashContainer">
				<div id="zingChart"></div>
				<div id='chart_div' style='width: 900px; height: 500px;'></div>
				<div id="chartContainer"></div>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		crossorigin="anonymous"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	<script src="/civ/resources/js/dashboardpage.js"></script>
	<script type='text/javascript'>
	  $('.linkList li').each(function(){
	    	if($(this).html()=='대시보드'){
	    		$(this).attr('class','w3-button cus-btn btn-active');
	    	}
	  });
    </script>
</body>

</html>