/**
 * 
 */
		function scheduleAjax() {
            $('#seatContainer').html('');
            $.ajax({
                type: "get",
                url: "/civ/admin/nowSeatStatus.json",
                data: {
                    "scheduleDate": selectedDate
                },
                success: function (data) {
                    if (data.length == 0) {
                        $('#seatContainer').append("<h1 style='color:red; text-align:center;'>상영 중인 상영관 정보가 없습니다.</h1>");
                        return;
                    }
                    var nowscreen = null;
                    var scBox = $(' <div class="screenBox"></div>');
                    var screenCnt = 0;
                    scBox.append('<h1>' + data[0].schedule.scheduleScreen
                        + '</h1>');
                    for (var i = 0; i < data.length; i++) {
                        var sc = data[i].schedule;
                        var movie = data[i].movie;
                        if (i != 0 && nowscreen != sc.scheduleScreen) {
                            screenCnt = 0;
                            $('#seatContainer').append(scBox);
                            scBox = $(' <div class="screenBox"></div>');
                            scBox.append('<h1>' + sc.scheduleScreen + '</h1>');
                        }
                        var tBox = $('<div class="timeBox"></div>');
                        var rd = movieSeatDraw(sc.seat.split(','));
                        tBox.append(rd.div);
                        tBox.append('<h4>' + movie.movieName + ' ('
                            + (++screenCnt) + '타임)</h4>');
                        tBox.append('<h4> 남은좌석 : ' + (180 - rd.cnt)
                            + '/180</h4>');
                        scBox.append(tBox);
                        nowscreen = sc.scheduleScreen;
                    }
                    $('#seatContainer').append(scBox);
                }
            });
        }

        function movieSeatDraw(now_seat) {
            var div = '';
            var cnt = 0;
            for (var j = now_seat.length; j >= 0; j--) {
                div += "<div class='seat-row' style='color:white; font-size:10px; line-height:9px;'>";
                div += "<span style='display: inline-block; width: 13px; font-weight:bold; color:black; height: 13px; margin:2px; vertical-align: middle; text-align:center; border: 2px rgb(190,190,190) solid; background-color:rgb(190,190,190); margin-right:17px;'>"
                    + String.fromCharCode(65 + j) + "</span>"
                for (var i = 0; i < 20; i++) {
                    if (i == 4 || i == 16) {
                        div += "&nbsp&nbsp&nbsp&nbsp&nbsp";
                    }
                    if (now_seat[j] & (0x80000 >> (i))) {
                        div += "<span  style='display: inline-block; margin:2px; vertical-align: middle; text-align:center; width: 13px; height: 13px; border: 2px rgb(206, 206, 206) solid; color:white; background-color:rgb(206, 206, 206);'>"
                            + 'X' + "</span>";
                        cnt = cnt + 1;
                    } else {
                        div += "<span class='seat' style='margin:2px; display: inline-block; vertical-align: middle; text-align:center; width: 13px; height: 13px; border: 2px grey solid; background-color:grey;'></span>";
                    }
                }
                div += "</div>";
            }
            return {
                'div': div,
                'cnt': cnt
            };
        }

        scheduleAjax();