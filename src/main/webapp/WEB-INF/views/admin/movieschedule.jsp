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
    <link rel="stylesheet" href="/civ/resources/css/font.css"/>
    <link rel="stylesheet" href="/civ/resources/css/movieschedulepage.css?after"/>
    <title>Document</title>
    <style>
    	.btn-active {
	background-color: rgb(189, 189, 189);
}
    </style>
</head>

<body>

    <div class="admin_container">
        
        <%@include file="/resources/include/adminnav.jsp" %>
        
        <div class="w3-main">
            <h1 class="dashTitle">Schedule Manage</h1>

            <div id="dateContainer"></div>
            <div id="scheduleInfo">
                <h2 style="font-family: 'East Sea Dokdo', cursive; font-size: 40pt;" id="scheduleInfoText"></h2>
            </div>

            <div id="schedule" style="height: 370px; width: 1500px;"></div>

            <div class="movieList">
                <c:forEach var="mn" items="${movieNames}">
                    <div class="movieListInfo" mNo="${mn.movieCode}">
                        <h4 style="margin: 0; font-family: 'Black And White Picture', sans-serif;">${mn.movieName}</h4>
                    </div>
                </c:forEach>
            </div>

            <div id="movieSelectInfo">
                <div style="display: flex; border: 2px solid #333333;">
                    <div class="moviePoster"></div>
                    <div class="movieText">
                        <div style="padding: 10px; margin-top: 20px;">
                            <p class="ptags" id="detailAge"></p>
                            <h2 id="detailName" style="display: inline-block; margin: 0; font-family: 'BMJUA';"></h2>
                        </div>
                        <p id="detailRankLabel" style="display: inline-block; margin-left: 10px;"></p>
                        <h3 id="detailRank"></h3>

                        <div style="display: inline-block;">
                            <p id="detailGradeLabel" style="display: inline-block; margin-left: 10px;"></p>
                            <h3 id="detailGrade"></h3>
                        </div>
                        <div>
                            <p id="detailOpen"
                                style="padding: 0; display: inline-block; margin: 0; margin-left: 10px; height: 20px;">
                            </p>
                        </div>
                        <div>
                            <p id="detailGenre"
                                style="padding: 0; display: inline-block; margin: 0; margin-left: 10px; height: 20px;">
                            </p>
                        </div>
                        <div>
                            <p id="detailTotalView"
                                style="padding: 0; display: inline-block; margin: 0; margin-left: 10px; height: 20px;">
                            </p>
                        </div>
                        <div>
                            <p id="detailRuntime"
                                style="padding: 0; display: inline-block; margin: 0; margin-left: 10px; height: 20px;">
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="movieUpdateFormHide"></div>

            <div class="movieUpdateForm">
                <p class="timeHead">(선택)</p>
                <p class="timeHead timeHead2" style="padding-left: 110px; margin-top: 0; height: 30px;"></p>
                <div style="text-align: center; margin-top: 50px;">
                    <div id="uMuDIV">
                        <label class="w3-btn upModeBtn" id="uploadHere"
                            style="background-color: #d3d3d3;">업로드</label><label id="superUploadHere"
                            class="w3-btn upModeBtn">중복업로드</label>
                        <div id="superUploadBox" style="background-color: white; border: 1px solid grey;">

                            <div>
                                <div>
                                    <p style="color:red; border:1px solid grey; padding: 10px;">해당 업로드기능은 선택영화 상영시간에 맞춰
                                        연속해서 업로드 됩니다.<br>
                  (업로드는 쉬는시간 15분이 포함됩니다.)</p>
                                </div>
                                <div>
                                    <div style="text-align: right;">
                                        <p style="display: inline;">업로드 가능 횟수 : </p>
                                        <h4 id="superUploadCnt" style="display: inline; font-family: 'BMJUA';">회</h4>
                                        <br>
                                        <p style="display: inline;">업로드 횟수 지정 : </p><input id="superUploadInput"
                                            type="number" min="0" style="width:35px;">
                                        <h4 style="display: inline; font-family: 'BMJUA';">회</h4>
                                    </div>
                                </div>
                            </div>

                            <div style="text-align: right;">
                                <button id="superUploadBtn" class="w3-button"
                                    style="margin-top:15px; border: 1px solid grey; border-radius: 5%;">업로드</button>
                            </div>
                        </div>
                        <div id="uploadBox" style="background-color: white; border: 1px solid grey;">
                        	<div>
                                    <p style="color:red;font-weight: bold;">업로드는 쉬는시간 15분이 포함</p>
                           	</div>
                            <div style="margin-bottom: 10px;">
                                <label>시작시간</label><br> <input type="text" id="timeS" class="time_element">
                            </div>
                            <div>
                                <label>종료시간</label><br> <label id="finishTime"></label>
                            </div>
                            <div style="text-align: right;">
                                <button id="uploadBtn" class="w3-button"
                                    style="position: relative; top: 80px; border: 1px solid grey; border-radius: 5%;">업로드</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="/civ/resources/js/dateLine.js"></script>
    <script type="text/javascript" src="/civ/resources/js/timepicker.js"></script>
    <script type="text/javascript" src="/civ/resources/js/movieschedulepage.js?after"></script>
    <script>
	    $('.linkList li').each(function(){
	    	if($(this).html()=='영화 스케줄'){
	    		$(this).attr('class','w3-button cus-btn btn-active');
	    	}
	    });
    </script>
</body>

</html>