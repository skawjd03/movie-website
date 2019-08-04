/**
 * 
 */
var check_seat = [];
	var adult = 0;
	var children = 0;
	var disorder = 0;
	var soo = 0;
	var click = 0;

	function changeForm(){
		$('.payall').html((adult*12000)+(children*9000)+(disorder*7000));
    	$('#adult').val(adult);
    	$('#child').val(children);
    	$('#disorder').val(disorder);
	}
	$().ready(() => {
        // plus
    	$('#ap').on('click',function(){
        	var a = adult +1;
        	adult = a;
        	$('#aval').text(a);
        	$('#asoo').val(a);
        	soo = soo + 1;
        	changeForm();
        });
        $('#cp').on('click',function(){
        	var c = children +1;
        	children = c;
        	$('#cval').text(c);
        	$('#csoo').val(c);
        	soo = soo + 1;
        	changeForm();
        });
        $('#dp').on('click',function(){
        	var d = disorder +1;
        	disorder = d;
        	$('#dval').text(d);
        	$('#dsoo').val(d);
        	soo = soo + 1;
        	changeForm();
        });
        
        //minus
        $('#am').on('click',function(){
        	if(check_seat.length > soo-1){
        		alert('선택한 좌석이 해당 인원수보다 많습니다.');
        		return;
        	}
        	if($('#aval').text()==0){
        		return;
        	}
        	var a = adult -1;
        	adult = a;
        	$('#aval').text(a);
        	$('#asoo').val(a);
        	soo = soo - 1;
        	changeForm();
        });
        
        $('#cm').on('click',function(){
        	if(check_seat.length > soo-1){
        		alert('선택한 좌석이 해당 인원수보다 많습니다.');
        		return;
        	}
        	if($('#cval').text()==0){
        		return;
        	}
        	var c = children -1;
        	children = c;
        	$('#cval').text(c);
        	$('#csoo').val(c);
        	soo = soo - 1;
        	changeForm();
        });
        $('#dm').on('click',function(){
        	if(check_seat.length > soo-1){
        		alert('선택한 좌석이 해당 인원수보다 많습니다.');
        		return;
        	}
        	if($('#dval').text()==0){
        		return;
        	}
        	var d = disorder -1;
        	disorder = d;
        	$('#dval').text(d);
        	$('#dsoo').val(d);
        	soo = soo - 1;
        	changeForm();
        });
       
    });
	
var movieSeatDraw = (now_seat) => {
        	$('.seat_choice_box').html('');
            for (var j = 0; j < now_seat.length; j++) {
                var div = "<div class='seat-row' style='color:white;' font-size:14px;>";
                div += "<span style='display: inline-block; width: 20px; font-weight:bold; color:black; height: 20px; margin:2px; vertical-align: middle; text-align:center; border: 2px rgb(190,190,190) solid; background-color:rgb(190,190,190); margin-right:17px;'>" + String.fromCharCode(65 + j) + "</span>"
                for (var i = 0; i < 20; i++) {
                    if (i == 4 || i == 16) {
                        div += "&nbsp&nbsp&nbsp&nbsp&nbsp";
                    }
                    if (now_seat[j] & (0x80000 >> (i))) {
                    	div += "<span  style='display: inline-block; margin:2px; vertical-align: middle; text-align:center; width: 20px; height: 20px; border: 2px rgb(206, 206, 206) solid; color:white; background-color:rgb(206, 206, 206);'>" + 'X' + "</span>";
                    } else {
                    	div += "<span class='seat' checked-id='0' seat-id='" + String.fromCharCode(65 + j) + "-" + (i + "") + "' style='margin:2px; display: inline-block; vertical-align: middle; text-align:center; width: 20px; height: 20px; border: 2px grey solid; background-color:grey;'>" + (i + 1) + "</span>";
                        
                    }
                }
                div += "</div>";
                $('.seat_choice_box').prepend(div);
            }
            
            $('.seat').bind({
                click: function () {
                    let bool = $(this).attr('checked-id');
                    if (bool == 0) {
						if(soo == click){
							alert("선택초과");
							return;
						}
                        $(this).css('background-color', '#1b1fe9');
                        check_seat.push($(this).attr('seat-id'));
                        $('#user-selected').html(check_seat+',');
                        $('#checkSeat').val(check_seat+',');
                  
                        $(this).attr('checked-id', '1');
                        $(this).unbind('mouseenter');
                        $(this).unbind('mouseleave');
                        click = click + 1;
                    } else {
                        $(this).css('background-color', 'grey');
                        const idx = check_seat.indexOf($(this).attr('seat-id'));
                        check_seat.splice(idx, 1);
                        $(this).attr('checked-id', '0');
                        $('#user-selected').html(check_seat);
                        $('#checkSeat').val(check_seat);
                        $(this).bind('mouseenter', function () {
                            $(this).css('background-color', 'black');
                        });
                        $(this).bind('mouseleave', function () {
                            $(this).css('background-color', 'grey');
                        });
                        click = click - 1;
                    }
                }
            });

            $('.seat').bind('mouseenter', function () {
                $(this).css('background-color', 'black');
            });
            $('.seat').bind('mouseleave', function () {
                $(this).css('background-color', 'grey');
            });
        };