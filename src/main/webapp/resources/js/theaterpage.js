/**
 * 
 */
var selectedDate = new Date();
    $().ready(() => {
        for (var i = 0; i < 7; i++) {
            var day = new Date(new Date().getTime() + (60 * 1000 * 60 * 24 * i));
            var dateBox = $('<div class="undateBox w3-row" date="'+day.format('yyyy/MM/dd')+'"></div>');
            if (i == 0) {
                dateBox.attr('class', 'dateBox w3-row');
            }
            var month = day.getMonth().toString().length == 2 ? day.getMonth() : '0' + day.getMonth();
            dateBox.append($('<div class="w3-col s5"><p>' + month + '</p><p>일</p></div><div class="w3-col s7"><strong>' + day.getDate() + '</strong></div>'));
            $('.dateLine').append(dateBox);
        }

        $('.undateBox').on('click', function () {
        	getSchedule($(this).attr('date'));
            $('.dateBox').attr('class', 'undateBox w3-row');
            $(this).attr('class', 'dateBox w3-row');
        });
        $('.dateBox').click(function () {
        	getSchedule($(this).attr('date'));
            $('.dateBox').attr('class', 'undateBox w3-row');
            $(this).attr('class', 'dateBox w3-row');
        });
    });
    getSchedule(new Date().format('yyyy/MM/dd'));
    function getSchedule(date){
    	$.ajax({
    		type:"get",
    		url:"/civ/theater/schedule.json",
    		data:{"date":date},
    		success:function(data){
    			if(data.length == 0){
    				$('#scheduleList').html('');
    				$('#scheduleList').append('<h1>스케줄 없음</h1>');
    			}else{
    				$('#scheduleList').html('');
    				for(var i=0; i<data.length;i++){
    					var headerDiv = $('<div><strong class="scheduleMovieName">'+data[i].movieName+'</strong> <text class="scheduleMovieDetail">'+data[i].movieGenre+' / '+data[i].movieRuntime+' / '+data[i].movieOpendate+' 개봉</text></div>');
    					var sList = data[i].schedule;
    					var scBox = $('<div class="scheduleBoxRow"></div>');
    					var nowScreen = null;
    					var scRow = $('<div class="scheduleBoxRow"></div>');
    					for(var j=0;j<sList.length;j++){
    						if(nowScreen != sList[j].scheduleScreen){
		    					scBox.append(scRow);
    							scRow = $('<div class="scheduleBoxRow"></div>');
	    						scRow.append('<text class="scheduleRowHead"> '+sList[j].scheduleScreen+' | 총 180석</text>');
    						}
	    					nowScreen = sList[j].scheduleScreen;
	    					var tooltip = $('<a data-toggle="tooltip" class="tip-top timeBox" scCode="'+sList[j].scheduleCode+'" title="Default tooltip"><div class="time">'+sList[j].scheduleStart+'</div><div class="seat">'+sList[j].countseat+'석</div></a>');
	    					tooltip.tooltip({
	    						placement: 'top',
	    			            template:'<div class="popover" role="tooltip"><div class="arrow"></div><h3 class="popover-header">'+data[i].movieName+'('+sList[j].scheduleScreen+')</h3><div class="popover-body">' + movieSeatDraw(sList[j].seat.split(',')) + '</div><div class="hoverDate">'+sList[j].scheduleDate+' '+sList[j].scheduleStart+'</div></div>'
	    					});
	    					scRow.append(tooltip);
    					}
    					scBox.append(scRow);
    					$('#scheduleList').append(headerDiv);
    					$('#scheduleList').append(scBox);
    				}
    				
    			}
    		}
    	});
    }
	
    var movieSeatDraw = (now_seat) => {
        var returnDiv = "";
        for (var j = 0; j < now_seat.length; j++) {
            var div = "<div class='seat-row'>";
            for (var i = 0; i < 20; i++) {
                if (i == 4 || i == 16) {
                    div += "&nbsp";
                }
                if (now_seat[j] & (0x80000 >> (i))) {
                    div += "<div style='display: inline-block; margin:0.5px; width: 4px; height: 4px; background-color:rgb(206, 206, 206);'></div>";
                } else {
                    div += "<div style='margin:0.5px; display: inline-block; width: 4px; height: 4px; background-color:grey;'></div>";
                }
            }
            div += "</div>";
            returnDiv += div;
        }
        return returnDiv;
    };
    
    
    
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('서울특별시 관악구 시흥대로 552', function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">PACCH</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});     