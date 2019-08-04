/**
 * 
 */

Date.prototype.format = function(f) {

	if (!this.valueOf())
		return " ";

	var weekKorName = [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ];

	var weekKorShortName = [ "일", "월", "화", "수", "목", "금", "토" ];

	var weekEngName = [ "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday",
			"Friday", "Saturday" ];

	var weekEngShortName = [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ];

	var d = this;

	return f.replace(/(yyyy|yy|MM|dd|KS|KL|ES|EL|HH|hh|mm|ss|a\/p)/gi,
			function($1) {

				switch ($1) {

				case "yyyy":
					return d.getFullYear(); // 년 (4자리)

				case "yy":
					return (d.getFullYear() % 1000).zf(2); // 년 (2자리)

				case "MM":
					return (d.getMonth() + 1).zf(2); // 월 (2자리)

				case "dd":
					return d.getDate().zf(2); // 일 (2자리)

				case "KS":
					return weekKorShortName[d.getDay()]; // 요일 (짧은 한글)

				case "KL":
					return weekKorName[d.getDay()]; // 요일 (긴 한글)

				case "ES":
					return weekEngShortName[d.getDay()]; // 요일 (짧은 영어)

				case "EL":
					return weekEngName[d.getDay()]; // 요일 (긴 영어)

				case "HH":
					return d.getHours().zf(2); // 시간 (24시간 기준, 2자리)

				case "hh":
					return ((h = d.getHours() % 12) ? h : 12).zf(2); // 시간 (12시간 기준, 2자리)

				case "mm":
					return d.getMinutes().zf(2); // 분 (2자리)

				case "ss":
					return d.getSeconds().zf(2); // 초 (2자리)

				case "a/p":
					return d.getHours() < 12 ? "오전" : "오후"; // 오전/오후 구분

				default:
					return $1;

				}

			});

};
String.prototype.string = function(len) {
	var s = '', i = 0;
	while (i++ < len) {
		s += this;
	}
	return s;
};
String.prototype.zf = function(len) {
	return "0".string(len - this.length) + this;
};
Number.prototype.zf = function(len) {
	return this.toString().zf(len);
};

var month = null;
var selectedDate = null;
for (var i = 0; i < 14; i++) {
	var tmp = new Date();
	var today = new Date(tmp.setDate(tmp.getDate() + i));
	var dateLinkDiv = $("<div class='dateLink' ></div>");
	if (month != today.getMonth()) {
		var span = $("<span></span>").append(
				$("<h2 class='monthInfo'></h2>").html(today.getMonth() + 1));
		dateLinkDiv.append(span);
	}
	if (today.format('KS') == '토') {
		var p = $("<p class='setMonth'></p>").html(today.format('KS')).css(
				'color', 'blue');
	} else if (today.format('KS') == '일') {
		var p = $("<p class='setMonth'></p>").html(today.format('KS')).css(
				'color', 'red');
	} else {
		var p = $("<p class='setMonth'></p>").html(today.format('KS'));
	}
	var p2 = $('<p class="setDay" mDate="'+today.format('yyyy/MM/dd')+'" style="display: inline-block; margin: 0; margin-top: 10px; padding: 6px; border-radius: 25px; width:35px;"></p>').html(today.getDate()).on('click',function(e){
		$('.setDay').css('backgroundColor','white');
		$(this).css({
			'backgroundColor':'#d2d2d2',
		});
		selectedDate = $(this).attr('mDate');
		scheduleAjax();
	});
	if(i==0){
		p2.css('backgroundColor','#d2d2d2');
		selectedDate = today.format('yyyy/MM/dd');
	}
	dateLinkDiv.append(p).append($('<br>')).append(p2);
	$('#dateContainer').append(dateLinkDiv);
	month = today.getMonth();
}