<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${checkSearch == 'new'}">	
		<h4>최신개봉순</h4>
	</c:when>
	<c:when test="${checkSearch == 'view'}">	
		<h4>예매율순</h4>
	</c:when>
</c:choose>
<c:forEach var="movie" items="${movieList}" varStatus="status">
	<div class="sortLeft">
		<div class="rankNumBox">${status.count}</div>
		<p>
			<a class="rankBtn"
				href="/civ/movie/moviedetailpage2?movieCode=${movie.movieCode}">
				${movie.movieName } 
				<c:choose>
					<c:when test="${movie.movieAge == '12세이상관람가'}">
						<p class="ptags"
							style="background-color: #3bade0; border: 3px solid #3bade0; margin-left:5px;">12</p>
					</c:when>
					<c:when test="${movie.movieAge == '15세이상관람가'}">
						<p class="ptags"
							style="background-color: #f1ac3f; border: 3px solid #f1ac3f; margin-left:5px;">15</p>
					</c:when>
					<c:when test="${movie.movieAge == '청소년관람불가'}">
						<p class="ptags"
							style="background-color: #d23e42; border: 3px solid #d23e42; margin-left:5px;">19</p>
					</c:when>
					<c:when test="${movie.movieAge == '전체관람가'}">
						<p class="ptags"
							style="background-color: #51a95a; border: 3px solid #51a95a; margin-left:5px;">All</p>
					</c:when>
				</c:choose>
			</a>
		</p>
	</div>
</c:forEach>