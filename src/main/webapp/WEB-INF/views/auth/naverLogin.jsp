<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.login_container{
		height: 600px;
		margin-top:50px;
		text-align: center;
	}
	.loginBox{
		margin-left:auto;
		margin-right:auto;
		width: 950px;
		height: 430px;
        display: flex;
        border-top: 2px solid #333333;
        border-bottom: 2px solid #333333;
	}
	.w6,.w4{
		text-align: left;
	}
	.w6{
		width: 60%;
		height: 100%;
		padding:60px;
	}
	.w4{
		padding:60px;
		padding-left:0;
		width:40%;
		height: 100%;
	}
	
	.loginSee{
		background-color: #3a3d3d !important;
		color: #d7d8db !important;
		padding : 10px 20px !important;
        border-top-left-radius: 8px;
        border-top-right-radius: 8px;
	}
    .bloginSee{
        background-color: #e5e2e1 !important;
		color: #3a3d3d !important;
		padding : 10px 20px !important;
        border-top-left-radius: 8px;
        border-top-right-radius: 8px;
    }

    .loginArea{
       
        margin-top: 10px;
        height: 350px;
        text-align: center;
        padding-top: 40px;
    }
    #userid,#userPassword{
        width: 280px;
        font-size: 15pt;
        margin-top: 20px;
        padding: 10px;
        border-radius: 5px;
        border: 2px solid #8f8f8f;
    }

    #loginNotice{
        font-size: 10pt;
        color: #333333;
    }
    #loginBtn{
        width: 300px;
        margin-top: 10px;
        padding-top: 8px;
        padding-bottom: 8px;
        font-size: 16.5pt;
        background-color: #9d3341;
        color: #d7d8db;
        border: 2px solid #333333;
        border-radius: 5px;
    }

    #naverLoginBtn{
        width: 300px;
        margin-top: 10px;
        height: 50px;
        border: 1px solid #333333;
        border-radius: 5px;
    }

    #naverLoginBtn:hover{
        opacity: 0.85;
    }

    #loginBtn:hover{
        background-color: #b94858;
    }

    .checkBox{
        margin-left: auto;
        margin-right: auto;
        width: 300px; text-align: left;
        margin-top: 5px;
    }
    .joinGo{
        margin-left: 110px;
        text-decoration: none;
        color: #333333;
    }
    .joinGo:hover{
        color: #aaaaaa;
    }
    #adImg{
        margin-bottom: 72.5px;
        border:1px solid #333333;
    }
</style>
</head>
<body>
	<%@include file="/resources/include/header.jsp" %>
	<div class="login_container">
        <div style="text-align: left; display: inline-block; width: 950px;">
            <span class="w3-btn loginSee">로그인</span><span class="w3-btn bloginSee">비회원</span>
        </div>
		<div class="loginBox">
                <div class="loginArea w6" >
                    <form action="/civ/auth/loginDo" method="post">
                        <label id="loginNotice">아이디와 비밀번호를 입력하시고, 로그인 버튼을 클릭해 주세요.</label>
                        <c:if test="${errorMap.errorId != null}">
	                        <input placeholder="아이디" id="userid" name="userId" type="text" value="${errorMap.errorId}">
                        </c:if>
                        <c:if test="${errorMap.errorId == null }">
	                        <input placeholder="아이디" id="userid" name="userId" type="text">
                        </c:if>
                        <input placeholder="비밀번호" id="userPassword" name="userPassword" type="password"><br>
                        <c:if test="${errorMap.loginErrorMsg != null}">
                        	<p style="color:red;">${errorMap.loginErrorMsg}</p>
                        </c:if>
                        <div class="checkBox">
                            <input type="checkbox" name="idSave"> 아이디 저장 <a class="joinGo" href="/civ/auth/join">회원가입</a>
                        </div>
                        <input type="submit" id="loginBtn" value="로그인">
                        <a href="${naver_login_url}"><img id="naverLoginBtn" src="${initParam['viewImagePath']}네이버로그인버튼.PNG"></a>
                    </form>
                </div><!--
                --><div class="w4" style="margin-top: 31.5px;">
                    <img id="adImg" src="${initParam['viewImagePath']}광고.jpg">
                </div>
		</div>
	</div>
	<%@include file="/resources/include/footer.jsp"%>
</body>
</html>