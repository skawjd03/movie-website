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
    <style>
        input{
            margin:20px;
            padding: 8px 15px;
            background-color: #9d3341;
            color: #d7d8db;
            border: none;
            margin-top: 100px;
        }
        input:hover{
            background-color: #bc5563;
        }
    </style>
</head>
<body>
    <div style="text-align: center;">
		<div style="display: inline-block; border: 2px solid #333333; background-color: #f9f9f9; width: 600px; height: 800px; margin-top: 60px;">
            <h1 style="font-size: 50pt; color: red;">ERROR</h1>
            <div style="height: 110px;">
                <h2 style="font-size: 30pt;">${errorCode}</h2>
                <p>${errorMsg}</p>
            </div>
            <div>
                <img src="/civ/resources/img/에러.png" style="width: 60%;"/>
            </div>
            <div style="text-align: center;">
                <input id="historyBack" type="button" value="이전페이지로 이동"><input id="mainGo" type="button" value="메인페이지로 이동">
            </div>
		</div>
    </div>
    <script>
        document.getElementById('historyBack').onclick= function(){
            history.back();
        };
        document.getElementById('mainGo').onclick = function(){
            location.href="/civ/main";
        };
    </script>
</body>
</html>