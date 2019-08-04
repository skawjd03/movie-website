/**
 * 
 */
var chart = null;
var container = null;
var dataTable = null;
function drawChart(data) {
	container = document.getElementById('schedule');
	chart = new google.visualization.Timeline(container);
	dataTable = new google.visualization.DataTable();
	dataTable.addColumn({
		type : 'string',
		id : 'Position'
	});
	dataTable.addColumn({
		type : 'string',
		id : 'Name'
	});
	dataTable.addColumn({
		type : 'date',
		id : 'Start'
	});
	dataTable.addColumn({
		type : 'date',
		id : 'End'
	});
	dataTable.addRows(data);
	chart.draw(dataTable);
	google.visualization.events
			.addListener(chart, 'select', selectEventHandler);
}

var rangeStartDate = null;
var rangeFinishDate = null;
var screen = null;
var movieCode = null;
function selectEventHandler() {
	var selected = chart.getSelection();
	screen = dataTable.getValue(selected[0].row, 0);
	var movieCheck = dataTable.getValue(selected[0].row, 1);
	rangeStartDate = dataTable.getValue(selected[0].row, 2);
	rangeFinishDate = dataTable.getValue(selected[0].row, 3);
	$('.timeHead').html('(선택) ' + rangeStartDate.format('dd일/hh:mm(a/p)'));
	$('.timeHead2').html('~' + rangeFinishDate.format('dd일/hh:mm(a/p)'));
	setUploadData();
	if (movieCheck == '') {
		if ($('#detailName').html() != "") {
			$('.movieUpdateFormHide').css('visibility', 'hidden');
		}
	} else {
		$.ajax({
			type : "get",
			url : '/civ/admin/removeschedule.json',
			data : {
				'scheduleDate' : selectedDate,
				'scheduleStart' : rangeStartDate.format('yyyy/MM/dd-HH:mm'),
				'scheduleScreen' : screen
			},
			success : function(data) {
				newDrawChart(data);
			}
		});
	}
}

$('#uploadBtn').on(
		'click',
		function(e) {
			if (uploadStartDate == null || uploadFinishDate == null) {
				alert('시간을 입력하세요.');
				return;
			} else if (uploadStartDate < rangeStartDate) {
				alert(uploadStartDate);
				alert(rangeStartDate);
				alert('시작시간을 확인하세요.');
				return;
			} else if (uploadFinishDate > rangeFinishDate) {
				alert('종료시간을 확인하세요.');
				return;
			} else {
				uploadFinishDate = new Date(uploadFinishDate.getTime()
						+ (15 * 1000 * 60));
				$.ajax({
					type : "post",
					url : '/civ/admin/uploadschedule.json',
					data : {
						'sd' : selectedDate,
						'scheduleScreen' : screen,
						'scheduleStart' : uploadStartDate
								.format('yyyy/MM/dd HH:mm'),
						'scheduleFinish' : uploadFinishDate
								.format('yyyy/MM/dd HH:mm'),
						'movieCode' : movieCode
					},
					success : function(data) {
						newDrawChart(data);
						$('.movieUpdateFormHide').css('visibility', 'visible');
						$('.timeHead').html('(선택)');
						$('.timeHead2').html('');
						setUploadData();
					}
				});
			}
		});
scheduleAjax();
function scheduleAjax() {
	$.ajax({
		type : "get",
		url : "/civ/admin/getScheduleList.json",
		data : {
			"date" : selectedDate
		},
		success : function(data) {
			newDrawChart(data);
		}
	});
}
function newDrawChart(data) {
	var drawData = [];
	for (var i = 0; i < data.length; i++) {
		var startDate = data[i].schedule.scheduleStart;
		var finishDate = data[i].schedule.scheduleFinish;
		var year = startDate.split('-')[0].split('/')[0];
		var month = startDate.split('-')[0].split('/')[1];
		var date = startDate.split('-')[0].split('/')[2];
		var hour = startDate.split('-')[1].split(':')[0];
		var min = startDate.split('-')[1].split(':')[1];
		var tmpStartDate = new Date(year, month - 1, date, hour, min, 0);
		year = finishDate.split('-')[0].split('/')[0];
		month = finishDate.split('-')[0].split('/')[1];
		date = finishDate.split('-')[0].split('/')[2];
		hour = finishDate.split('-')[1].split(':')[0];
		min = finishDate.split('-')[1].split(':')[1];
		var tmpFinishDate = new Date(year, month - 1, date, hour, min, 0);
		drawData.push([ data[i].schedule.scheduleScreen,
				data[i].movie.movieName == null ? '' : data[i].movie.movieName,
				tmpStartDate, tmpFinishDate ]);
	}

	google.charts.load("current", {
		packages : [ "timeline" ]
	});
	google.charts.setOnLoadCallback(function() {
		drawChart(drawData)
	});
	$('#scheduleInfoText').html(selectedDate + "날짜 스케줄");
}

$('.movieListInfo')
		.on(
				'click',
				function(e) {
					if ($('.timeHead2').html() != '(선택)') {
						$('.movieUpdateFormHide').css('visibility', 'hidden');
					}
					movieCode = $(this).attr('mNo');
					$
							.ajax({
								type : "get",
								data : {
									"movieCode" : movieCode
								},
								url : "/civ/admin/getMovieDetail.json",
								success : function(data) {
									$('.moviePoster').html(
											'<img id="showImg" src="'
													+ data.moviePoster + '">');
									$('#detailName').html(data.movieName);
									var age = null;
									var mcss = {};
									if (data.movieAge == '12세이상관람가') {
										age = 12;
										mcss = {
											"backgroundColor" : "#3bade0",
											"border" : "3px solid #3bade0"
										};
									} else if (data.movieAge == '15세이상관람가') {
										age = 15;
										mcss = {
											"backgroundColor" : "#f1ac3f",
											"border" : "3px solid #f1ac3f"
										};
									} else if (data.movieAge == '전체관람가') {
										age = 'All';
										mcss = {
											"backgroundColor" : "#51a95a",
											"border" : "3px solid #51a95a"
										};
									} else if (data.movieAge == '청소년관람불가') {
										age = 19;
										mcss = {
											"backgroundColor" : "#d23e42",
											"border" : "3px solid #d23e42"
										};
									}
									$('#detailAge').html(age);
									$('#detailAge').css(mcss);
									$('#detailRank').html(data.rank + '위');
									$('#detailRankLabel').html('예매율 : ');
									$('#detailGrade').html(
											'<span class="star-rating"><span></span></span> '
													+ (data.grade * 2) + '점');
									$('#detailGradeLabel').html('평점 : ');
									$('.star-rating span').css('width',
											(data.grade * 2 * 100 / 10) + '%');
									$('#detailOpen')
											.html(
													'<p style="display: inline-block; padding:0; margin:0;">개봉일 : </p> <h3 style="font-weight: normal; display:inline-block; margin:0;">'
															+ new Date(
																	data.movieOpendate)
																	.format('yyyy.MM.dd')
															+ '</h3>');
									$('#detailGenre')
											.html(
													'<p style="display: inline-block; padding:0; margin:0;">장르 : </p> <h3 style="font-weight: normal; display:inline-block; margin:0; margin-top:15px;">'
															+ data.movieGenre
															+ '</h3>');
									$('#detailTotalView')
											.html(
													'<p style="display: inline-block; padding:0; margin:0;">누적관객수 : </p> <h3 style="font-weight: normal; display:inline-block; margin:0; margin-top:15px;">'
															+ (data.totalview == 0 ? '정보없음'
																	: AddComma(data.movieTotalview)
																			+ '명')
															+ '</h3>');
									$('#detailRuntime')
											.html(
													'<p style="display: inline-block; padding:0; margin:0;">런닝타임 : </p> <h3 id="timepickMin" style="font-weight: normal; display:inline-block; margin:0; margin-top:15px;">'
															+ data.movieRuntime
															+ '분</h3>');
									setUploadData();
								}
							});
				});

function AddComma(num) {
	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	return num.toString().replace(regexp, ',');
}
$(".time_element").timepicki();

$('.upModeBtn').on('click', function(e) {
	if ($(this).html() == '업로드') {
		$('#uploadHere').css('background-color', '#d3d3d3');
		$('#superUploadHere').css('background-color', 'white');
		$('#uploadBox').css('z-index', '2');
		$('#superUploadBox').css('z-index', '1');
	} else {
		$('#superUploadHere').css('background-color', '#d3d3d3');
		$('#uploadHere').css('background-color', 'white');
		$('#uploadBox').css('z-index', '1');
		$('#superUploadBox').css('z-index', '2');
		setUploadData();
	}
});
$('#superUploadBtn')
		.on(
				'click',
				function(e) {
					var index = $('#superUploadInput').val();
					for (var i = 0; i < index; i++) {
						var startd = new Date(
								rangeStartDate.getTime()
										+ (((parseInt($('#timepickMin').html()) + 15) * (1000 * 60)) * i));
						var finishD = new Date(
								rangeStartDate.getTime()
										+ (((parseInt($('#timepickMin').html()) + 15) * (1000 * 60)) * (i + 1)));

						$.ajax({
							async : false,
							type : "post",
							url : '/civ/admin/uploadschedule.json',
							data : {
								'sd' : selectedDate,
								'scheduleScreen' : screen,
								'scheduleStart' : startd
										.format('yyyy/MM/dd HH:mm'),
								'scheduleFinish' : finishD
										.format('yyyy/MM/dd HH:mm'),
								'movieCode' : movieCode
							},
							success : function(data) {
								newDrawChart(data);
								$('.movieUpdateFormHide').css('visibility',
										'visible');
								setUploadData();
								$('#uploadHere').trigger('click');
								$('#superUploadInput').val('');
								$('.timeHead').html('(선택)');
								$('.timeHead2').html('');
							},
							error:function(request,status,error){
								alert(request.responseText);
							}
						});
					}
				});

function setUploadData() {
	var range = (rangeFinishDate - rangeStartDate) / (1000 * 60);
	var rangevalue = Math.floor(range
			/ (parseInt($('#timepickMin').html()) + 15));
	$('#superUploadCnt').html(rangevalue + '회');
	$('#superUploadInput').attr('max', rangevalue);
	$('#finishTime').html('');
	$('.time_element').val('');
}