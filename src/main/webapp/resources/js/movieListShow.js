/**
 * 
 */
$().ready(function(){	
			scheduleAjax();
			$('.reloadBtn').on('click',function(e){
				$.ajax({
					type:'post',
					url:'/civ/payment/reserve/type.json',
					data:{'type':$(this).html()},
					
					success:function(data){
						$('.reserve_moviescrollList1').html('');
						for(var i = 0; i< data.length;i++){
							var a = $('<a onclick="movieChoice('+data[i].movieCode+');" style="width:100%;"></a>');
							var div = $('<div class="all reserve_movie" name="movie_'+data[i].movieCode+'" style="padding: 5px; width:"></div>');
							
							if(data[i].movieAge=='12세이상관람가'){
								div.append($('<p class="ptags" style="background-color: #3bade0; border: 3px solid #3bade0;">12</p>'));
							}else if(data[i].movieAge=='15세이상관람가'){
								div.append($('<p class="ptags" style="background-color: #f1ac3f; border: 3px solid #f1ac3f;">15</p>'));
							}else if(data[i].movieAge=='전체관람가'){
								div.append($('<p class="ptags" style="background-color: #51a95a; border: 3px solid #51a95a;">전</p>'));
							}else if(data[i].movieAge=='청소년관람불가'){
								div.append($('<p class="ptags" style="background-color: #d23e42; border: 3px solid #d23e42;">19</p>'));
							}
							div.append($('<em></em>').html(data[i].movieName));
							a.append(div);
							$('.reserve_moviescrollList1').append(a);
						}
					}
				});
			});
		});