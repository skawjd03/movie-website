/**
 * 
 */
$().ready(function () {
        	var checkN = false;
            $('#userNick').on('change', function (e) {
                var nickName = $(this).val();
                var nickCheck = /^[a-zA-Z가-힣ㄱ-ㅎㅏ-ㅣ0-9_-]{3,15}$/;
                if (nickCheck.test(nickName)) {
                    $(this).parent().attr('class', 'highInput has-success has-feedback')
                    $('#idCheckSpan').attr('class', 'glyphicon glyphicon-ok form-control-feedback');
                    checkN = true;
                } else {
                    $(this).parent().attr('class', 'highInput has-error has-feedback')
                    $('#idCheckSpan').attr('class', 'glyphicon glyphicon-remove form-control-feedback');
                    checkN = false;
                }
            });
            
            var checkB = false;
            $('.checkBirth').on('change',function(e){
            	var y = $('#birthYear').val();
            	var m = $("#birthMonth option:selected").val();
            	var d = $('#birthDate').val();
            	var yearPattern = /^(19|20)\d{2}$/;
            	var monthPattern = /^([1-9]|1[012])$/;
            	var datePattern = /^([1-9]|[12][0-9]|3[0-1])$/;
            	if(yearPattern.test(y) && monthPattern.test(m) && datePattern.test(d)){
            		$('.birthDiv').attr('class',' col-sm-4 birthDiv has-success has-feedback')
            		$('.checkBirth').attr('class', 'form-control checkBirth glyphicon glyphicon-ok');
            		$('#birthCheckSpan').attr('class', 'glyphicon glyphicon-ok form-control-feedback');
            		checkB = true;
            	}else{
            		$('.birthDiv').attr('class','col-sm-4 birthDiv has-error has-feedback');
            		$('.checkBirth').attr('class', 'form-control checkBirth');
            		$('#birthCheckSpan').attr('class', 'glyphicon glyphicon-remove form-control-feedback');
            		checkB = false;
            	}
            });
            
            var checkP = false;
            $('.checkPhone').on('change',function(e){
            	var phone = $('#phone1 option:selected').val()+$('#phone2').val()+$('#phone3').val();
            	var phonePattern = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g;
            	if(phonePattern.test(phone) && phone.length==11){
            		$('#phoneCheckSpan').attr('class', 'glyphicon glyphicon-ok form-control-feedback');
            		$('.checkPhone').parent().attr('class','col-sm-4 birthDiv has-success has-feedback');
            		checkP = true;
            	}else{
            		$('#phoneCheckSpan').attr('class', 'glyphicon glyphicon-remove form-control-feedback');
            		$('.checkPhone').parent().attr('class','col-sm-4 birthDiv has-error has-feedback');
            		checkP = false;
            	}
            });
            
            $('#submitBtn').click(function(e){
            	$.ajax({
            		type:'get',
            		url:'/civ/auth/phonecheck',
            		data:{"phone":$('#phone1 option:selected').val()+$('#phone2').val()+$('#phone3').val()},
            		success:function(data){
            			if(data){
			            	if(checkN && checkB && checkP && check){
			            		$('#frm').submit();
			            	}else{
			            		alert('입력 똑바로');
			            	}
            			}else{
            				alert('이미 가입된 핸드폰 번호 입니다.');
            			}
            		}
            	});
            	
            });
            
            $('.routeClass').on('change',function(e){
            	$('.routeClass').prop('checked',false);
            	$(this).prop('checked',true);
            	if($(this).attr('id') == "otherPath"){
            		$('#pathTextarea').removeAttr('disabled');
            	}else{
            		$('#pathTextarea').attr('disabled','disabled');
            		$('#pathTextarea').val('');
            	}
            });
            
            var check;
            $('#agreeCheck').on('change',function(e){
            	check = $(this).prop('checked');
            });
        });