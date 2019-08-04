/**
 * 
 */
$().ready(
		function() {
			$('.searchInfo').change(
					function(e) {
						var startDate = $('#searchStart').val();
						var finishDate = $('#searchFinish').val();
						var userIdNo = $('#userIdNo').val();
						var replyCheck = $('#replyCheck').prop("checked");
						var regexp = /^[0-9]*$/
						var userNo = null;
						var userID = null;
						// 날짜 유효성 체크
						if (startDate != '' && finishDate != '') {
							var startDateSet = startDate.split('-');
							var finishDateSet = finishDate.split('-');
							if (new Date(startDateSet[0], startDateSet[1],
									startDateSet[2]).getTime() > new Date(
									finishDateSet[0], finishDateSet[1],
									finishDateSet[2]).getTime()) {
								alert('날짜 범위 오류');
								$('#searchStart').val('');
								$('#searchFinish').val('');
								return;
							}
						}

						// 아이디 유저번호 구분
						if (userIdNo != null && regexp.test(userIdNo)) {
							if (userIdNo == '') {
								userNo = 0;
							} else {
								userNo = userIdNo;
							}
						} else {
							userID = userIdNo;
						}

						$.ajax({
							type : "get",
							url : "/civ/admin/servicelist.json",
							data : {
								"startDate" : startDate,
								"finishDate" : finishDate,
								"userNo" : userNo,
								"userID" : userID,
								"replyCheck" : replyCheck
							},
							success : function(data) {
								setList(data);
							}
						});

					});
		});

$.ajax({
	type : "get",
	url : "/civ/admin/servicelist.json",
	success : function(data) {
		setList(data);
	}
});
function setList(data) {
	if (data.length == 0) {
		alert('데이터 없음');
	} else {
		$('tbody').html('');
		for (var i = 0; i < data.length; i++) {
			$('tbody').append(
					'<tr class="w3-hover-light-blue" scCode="'
							+ data[i].serviceNo + '"><td>' + data[i].serviceNo
							+ '</td><td>' + data[i].userNo + '</td><td>'
							+ data[i].serviceKindof + '</td><td>'
							+ data[i].serviceTitle + '</td><td>'
							+ data[i].serviceDate
							+ '</td><td class="replyCheck">'
							+ data[i].replyCheck + '</td></tr>');
		}
		$('tr').click(
				function(e) {
					var scCode = $(this).attr('scCode');
					selectedScCode = scCode;
					$.ajax({
						type : "get",
						url : "/civ/admin/serviceinfo.json",
						data : {
							"serviceNo" : scCode
						},
						success : function(data) {
							$('#serviceWriter').html('작성자 : ' + data.userNo);
							$('#serviceTitle')
									.html('제목 : ' + data.serviceTitle);
							$('#serviceContent').val(data.serviceContent);
							if (data.imgPath.length != 0) {
								for (var i = 0; i < data.imgPath.length; i++) {
									$('#imgBox' + (i + 1)).attr('src',
											data.imgPath[i].serviceimgPath);
									$('#imgBox' + (i + 1)).click(
											function(e) {
												$('#wideImg').attr('src',
														$(this).attr('src'));
											});
								}
							}
						}
					});
				});
	}
}
var selectedScCode = null;
function uploadAnswer() {
	if (selectedScCode == null) {
		alert('문의번호를 선택하세요.');
		return;
	}
	if ($('#answerContent').val() == null) {
		alert('답변 장석하세요.');
		return;
	}

	$.ajax({
		type : "get",
		url : "/civ/admin/upservicecomment.json",
		data : {
			'serviceNo' : selectedScCode,
			'serviceComment' : $('#answerContent').val()
		},
		success : function(data) {
			if (data == 1) {
				alert('답변 등록 성공');
				$('tr[scCode="' + selectedScCode + '"]')
						.children('.replyCheck').html('Y');
			} else if (data == -1) {
				alert('답변 등록 오류');
			} else if (data == 2) {
				alert('이미 답변이 있는 글입니다.');
			}
		}
	});
}