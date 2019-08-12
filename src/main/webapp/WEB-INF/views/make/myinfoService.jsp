<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.thPtagTitle {
	margin: 0;
	font-weight: normal;
	display: inline-block;
}

.serviceTable {
	background-color: #f3f3f3;
	height: 250px;
}

.modal-dialog {
	max-width: 700px;
	width: 700px;
}

.modal-content {
	width: 700px;
}

.imgBox {
	height: 170px;
	overflow: hidden;
}

.expansionImgBox {
	
}
</style>


<div class="modal-header">
	<h3>문의 답변</h3>
	<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>

<div class="modal-body">
	<h6 style="display: inline-block;">카테고리 :</h6>
	<h5 id="kindOf" style="display: inline-block; font-weight: bold;">${serviceInfo.service.serviceKindof }</h5>
	<table class="table serviceTable">
		<thead>
			<tr>
				<th width="11%">
					<p class="thPtagTitle">제목 :</p>
				</th>
				<th width="79%" colspan="2">
					<p id="serviceTitle" class="thPtagTitle" style="font-size: 18px;">${serviceInfo.service.serviceTitle }</p>
				</th>
				<th width="10%" style="padding: 5px; color: #5d5d5d;">
					<p class="thPtagTitle" style="font-size: 12pt;">문의일</p>
					<p id="serviceDate" class="thPtagTitle" style="font-size: 12pt;">${serviceInfo.service.serviceDate}</p>
				</th>
			</tr>
		</thead>
		<tbody style="border-bottom: 1px solid #dee2e6;">
			<tr>
				<td colspan="4">
					<p id="serviceContent">${serviceInfo.service.serviceContent }</p>
				</td>
			</tr>
		</tbody>
	</table>
	<div>
		<h4>첨부 이미지</h4>
		<div class="row">
			<c:forEach var="img" items="${serviceInfo.imgList }">				
				<div class="col-sm-4 imgBox">
					<a class="expansionImg"><img
						src="${initParam['viewUploadPath']}${img.serviceimgPath}" style="height: 100%;"></a>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="modal fade" id="imgModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content" style="border: 2px solid gray;">
				<div class="modal-header">
					<h2>이미지 확대</h2>
				</div>
				<div id="expansionImgBox"></div>
			</div>
		</div>
	</div>
</div>

<div class="modal-footer">
	<table class="table serviceTable">
		<thead>
			<tr>
				<th width="12%">
					<p class="thPtagTitle">운영진</p>
				</th>
				<th width="78%" colspan="2">
					<p id="replyServiceNick" class="thPtagTitle"
						style="font-size: 18px;">${serviceInfo.comment.commentWriter }</p>
				</th>
				<th width="10%" style="padding: 5px; color: #5d5d5d;">
					<p class="thPtagTitle" style="font-size: 12pt;">답변일</p>
					<p id="replyServiceDate" class="thPtagTitle"
						style="font-size: 12pt;">${serviceInfo.comment.commentDate }</p>
				</th>
			</tr>
		</thead>
		<tbody style="border-bottom: 1px solid #dee2e6;">
			<tr>
				<td colspan="4">
					<p id="replyServiceContent">${serviceInfo.comment.commentContent }</p>
				</td>
			</tr>
		</tbody>
	</table>
</div>

<script>
	$('.expansionImg').click(function() {
		var src = $(this).children('img').attr('src');
		$('#expansionImgBox').html('');
		$('#expansionImgBox').append('<img src="'+src+'">');
		$("#imgModal").modal("show");
	});
</script>