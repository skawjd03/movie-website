/**
 * 
 */
function movieChoice(mCode){
			$('.all').css('border','0px');
			if($('.check').attr('mNo')==mCode){
				$('.check').remove();
					scheduleAjax();
					return;
			}
			$('.check').remove();
			$('div[name="movie_'+mCode+'"]').css('border','1px solid black').append($('<i style="float:right;" mNo='+mCode+' class="far fa-2x fa-check-circle check"></i>'));
			scheduleAjax();
		};
	
		function scheduleAjax(){
			var mcode = $('.check').attr('mNo');
			
			$.ajax({
				type:"get",
				url:"/civ/payment/schedule.json",
				data:{"mcode":mcode,'date':selectedDate},
				success:function(data){
					$('.reserve_timetable').html('');
		               for(var i = 0; i < data.length; i++){
		            	  var m = data[i].movie;
		            	  var s = data[i].schedule;
		                  var a = $('<a onclick="selectSchedule('+s.scheduleCode+',\''+s.scheduleScreen+'\',\''+data[i].showtime+'\',\''+m.movieName+'\')"></a>');
		                  var div = $('<div class="timeLine"></div>');
		                  div.append($('<div class="f17 f17L"><h3 class="rowH3">'+data[i].showtime.split("~")[0]+'</h3>~'+data[i].showtime.split("~")[1]+'</div>'));
		                  var f66 = $('<div class="f66"></div>');
		                  if(m.movieAge == '12세이상관람가'){
		                     f66.append($('<p class="ptags" style="background-color: #3bade0; border: 3px solid #3bade0;">12</p>'));
		                  }else if(m.movieAge == '15세이상관람가'){
		                     f66.append($('<p class="ptags" style="background-color: #f1ac3f; border: 3px solid #f1ac3f;">15</p>'));
		                  }else if(m.movieAge == '전체관람가'){
		                     f66.append($('<p class="ptags" style="background-color: #51a95a; border: 3px solid #51a95a;">전</p>'));
		                  }else if(m.movieAge == '청소년관람불가'){
		                     f66.append($('<p class="ptags" style="background-color: #d23e42; border: 3px solid #d23e42;">19</p>'));
		                  }
		                  f66.append(m.movieName);
		                  div.append(f66);
		                  div.append($('<div class="f17 f17R">'+s.scheduleScreen+'<br>'+s.countseat+'/180</div>'));
		                  a.append(div);
		                  $('.reserve_timetable').append(a);
		               }
				}
			});
		};
		
		function selectSchedule(sCode,sscreen,showtime,mname){
			$('#selectedScheduleCode').val(sCode);
			$('#select_movie').html(mname);
			$('#select_screen').html(sscreen);
			$('#select_day').html(selectedDate);
			$('#select_time').html(showtime);
		}