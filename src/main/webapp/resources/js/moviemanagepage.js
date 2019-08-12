/**
 * 
 */
var nowNum = 1;
function getNextList() {
	$
			.ajax({
				type : 'get',
				url : '/civ/admin/moviemanagelist.json',
				data : {
					'pageNum' : nowNum
				},
				success : function(data) {
					for (var i = 0; i < data.length; i++) {
						var appendDiv = $('<div class="movie_choice_box"></div>');
						if (data[i].isshow == 'Y') {
							appendDiv
									.append('<h4 class="isshow-'
											+ data[i].movieCode
											+ '"><i class="fas fa-film" style="color:green; margin-right:10px;"></i>(상영)</h4>');
						} else {
							appendDiv
									.append('<h4 class="isshow-'
											+ data[i].movieCode
											+ '"><i class="fas fa-film" style="color:red; margin-right:10px;"></i>(종료)</h4>');
						}
						appendDiv
								.append('<div class="movie_poster"><div class="movie_realImg"><img class="image" src="/civ/resources/upload/'
										+ data[i].moviePoster
										+ '"></div><div class="middle">'
										+ data[i].movieName + '</div></div>');
						if (data[i].isshow == 'Y') {
							appendDiv
									.append('<div><button class="w3-btn" onclick="isshowCloseClick(this);" name="btn-'
											+ data[i].movieCode
											+ '" mCode="'
											+ data[i].movieCode
											+ '">종료하기</button><button class="w3-btn" onclick="updateTotalViewClick(this);" mCode="'
											+ data[i].movieCode
											+ '">업데이트</button></div>');
						} else {
							appendDiv
									.append('<div><button class="w3-btn" onclick="isshowCloseClick(this);" name="btn-'
											+ data[i].movieCode
											+ '" mCode="'
											+ data[i].movieCode
											+ '">상영하기</button><button class="w3-btn" onclick="updateTotalViewClick(this);" mCode="'
											+ data[i].movieCode
											+ '">업데이트</button></div>');
						}
						$('.w3-main').append(appendDiv);
					}
				},
				error:function(request,status,error){
					alert('처리 오류');
				}
			});
	++nowNum;
};
getNextList();

function updateTotalViewClick(me) {
	var mCode = $(me).attr('mCode');
	var dt = prompt("날짜를 입력하세요.", "(yyyyMMdd형식)");
	if (!((parseInt(dt, 10) / 10000000) > 1)) {
		alert('입력 오류');
		return;
	}
	$
			.ajax({
				type : "get",
				url : "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.json?key=9aa25fe7c9573a3d0a125e63313d3f52&targetDt="
						+ dt,
				success : function(data) {
					for (var i = 0; i < data.boxOfficeResult.weeklyBoxOfficeList.length; i++) {
						if (data.boxOfficeResult.weeklyBoxOfficeList[i].movieCd == mCode) {
							var totalview = data.boxOfficeResult.weeklyBoxOfficeList[i].audiAcc;
							$.ajax({
								type : "get",
								url : "/civ/admin/changetotalview",
								data : {
									"movieTotalview" : totalview,
									'movieCode' : mCode
								},
								success : function(data) {
									if (data > 0) {
										alert('업데이트 성공');
									} else {
										alert('업데이트 실패');
									}
								}
							});
							return;
						}
					}
					alert('해당날짜에 정보 없음');
				}
			});
}

function isshowCloseClick(me) {
	var mCode = $(me).attr('mCode');
	$
			.ajax({
				type : "get",
				url : "/civ/admin/movieIsshowChange.json",
				data : {
					"movieCode" : mCode
				},
				success : function(data) {
					if (data.isshow == "Y") {
						$('.isshow-' + data.movieCode)
								.html(
										'<i class="fas fa-film" style="color:red; margin-right:10px;"></i>(종료)');
						$('button[name="btn-' + mCode + '"]').html('상영하기');
					} else {
						$('.isshow-' + data.movieCode).html('(상영)');
						$('button[name="btn-' + mCode + '"]').html('종료하기');
						$('.isshow-' + data.movieCode)
								.html(
										'<i class="fas fa-film" style="color:green; margin-right:10px;"></i>(상영)');
					}
				}
			});
}