/**
 * 
 */
var idcheck = false;
      var pass1 = false;
      var pass2 = false;
      
      $('.joinBtn').on('click',function(){
         var check = $('.agreeBtn').prop("checked");
         if(check == false){
            alert('이용약관에 동의해주세요.');
            return;
         }
         if(idcheck == false){
            alert('아이디 중복체크를 해주세요.');
            return;
         }
         if(pass1 == false & pass2 == false){
            alert('비밀번호를 확인해주세요.');
            return;
         }
         if($('#username').val() == ''){
            alert('이름을 입력해주세요.');
            $('#username').focus();
            return;
         }
         if($('#userbirthyear').val() < 1900 || $('#userbirthyear').val() > 2019 || $("#userbirthmonth option:selected").val() == "월"){
            alert('생년월일을 제대로 입력해주세요.');
            $('#userbirthyear').focus();
            return;
         }else{
            var lastDay = ( new Date($('#userbirthyear').val(),$("#userbirthmonth option:selected").val(), 0) ).getDate();
            var regexp = /^[0-9]*$/;
            if($('#userbirthday').val() > lastDay || !regexp.test($('#userbirthday').val())){
               alert('생년월일을 제대로 입력해주세요.');
               $('#userbirthday').focus();
               return;
            }
         }
         var userdate = new Date($('#userbirthyear').val(),$("#userbirthmonth option:selected").val(),$('#userbirthday').val(),0);
         if($("#usergender option:selected").val() == '성별'){
            alert("성별을 선택해주세요.");
            $('#usergender').focus();
            return;
         }
         var phonereg = /^\d{3}-\d{3,4}-\d{4}$/; 
         if(!phonereg.test($('#userphone').val())){
            alert('전화번호를 제대로 입력해주세요.');
            $('#userphone').focus();
            return;
         }
         var userGenre = '';
         $('input[name="userGenre"]:checked').each(function(index,item){
            if(index!=0){
               userGenre += ',';
            }
            userGenre += $(this).val();
         });
         var routePath = '';
         if($('#inflowroute').val() == '기타'){
            if($('#routeText').val() == ''){
               alert('유입경로(기타) 내용을 적어주세요.');
               $('#routeText').focus();
               return;
            }else{
               routePath = $('#routeText').val();
            }
         }else{
            routePath = $('#inflowroute').val();            
         }
         var nickreg = /([^가-힣\x20^a-z^A-Z^0-9])/i;
         if($('#usernick').val() == ''){
            alert('닉네임을 입력해주세요.');
            $('#usernick').focus();
            return;
         }
         if(nickreg.test($('#usernick').val())){
            alert('닉네임은 3~15글자 (한글,영대소문자,숫자)만 가능합니다.');
            $('#usernick').focus();
            return;
         }
         
         $.ajax({
            type:'get',
            url:'/civ/auth/phonecheck.json',
            data:{'phone':$('#userphone').val()},
            success:function(data){
               if(data == true){
                  $('#form').submit();
               }else{
                  alert("이미 가입된 전화번호입니다.");
                  $("#userphone").focus();
               }
            }
         });
      });
      
      $('#inflowroute').on('change',function(){
         if(this.value == '기타'){
            $('#routeText').removeAttr('disabled');         
         }else{
            $('#routeText').attr('disabled','disabled');
         }
      });
      
      $('#pswd1').on('change',function(){
         var reg = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
         if(!reg.test($('#pswd1').val())){
            $('.pswd1label').html(" 비밀번호는 8자 이상이어야 하며, 숫자/대소문자/특수문자를 모두 포함해야 합니다.");
            return;
         }else{
            $('.pswd1label').html('');
            pass1 = true;
            return;
         }
      });
      $('#pswd2').on('change',function(){
         if($('#pswd2').val() != $('#pswd1').val()){
            $('.pswd2label').html(" 비밀번호가 일치하지않습니다.");
            return;
         }else{
            $('.pswd2label').html('');
            pass2 = true;
            return;
         }
      });
      
      $('.idcheckBtn').on('click',function(){
         var getCheck = RegExp(/^[a-zA-Z0-9]{4,15}$/);
         if($('#userid').val() == null){
            alert('아이디를 입력해주세요.');
            $("#userid").focus();
            return;
         }
         if(!getCheck.test($('#userid').val())){
            alert('아이디를 형식에 맞게 입력해주세요.');
            $("#userid").val("");
              $("#userid").focus();
            return;
         }
         $.ajax({
            type:'get',
            url:'/civ/auth/idcheck',
            data:{'userId':$('#userid').val()},
            success:function(data){
               if(data == 'unique'){
                  alert('사용가능한 아이디입니다.');
                  idcheck = true;
               }else{
                  alert("이미있는 아이디입니다.");
                  idcheck = false;
               }
            }
         });
      });