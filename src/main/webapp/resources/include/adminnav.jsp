<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://kit.fontawesome.com/244e92cc7b.js"></script>
<style>
	html, body {
		margin: 0;
	}
	
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
	
	.btn-active {
		background-color: rgb(189, 189, 189);
	}
	
	.dashTitle {
		margin: 0;
		padding: 30px;
		font-weight: bold;
	}
</style>
<nav class="w3-sidebar w3-dark-gray">
	<a href="/civ/main"><i class="fas fa-home fa-2x"></i></a>
	<ul class="w3-ul w3-border linkList">
		<a href="/civ/admin/dashboard">
			<li class="w3-button cus-btn">대시보드</li>
		</a>
		<a href="/civ/admin/movieupdatepage">
			<li class="w3-button cus-btn">영화 등록</li>
		</a>
		<a href="/civ/admin/moviemanage">
			<li class="w3-button cus-btn">영화상태 관리</li>
		</a>
		<a href="/civ/admin/movieschedule">
			<li class="w3-button cus-btn">영화 스케줄</li>
		</a>
		<a href="/civ/admin/service">
			<li class="w3-button cus-btn">문의답변</li>
		</a>
		<a href="/civ/admin/seatnow">
			<li class="w3-button cus-btn">좌석현황판</li>
		</a>
		<a href="/civ/admin/billboard">
			<li class="w3-button cus-btn">전광판 등록</li>
		</a>
		<a href="/civ/admin/membermanage">
			<li class="w3-button cus-btn">회원관리</li>
		</a>
		
	</ul>
</nav>