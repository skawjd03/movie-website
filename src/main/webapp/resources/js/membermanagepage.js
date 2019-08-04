/**
 * 
 */
$('#searchBtn').on('click',function(){
          var socialcheck = null;
          if($(':input[name=socialCheck]:checked').val() == '소셜'){
             if($('#memberType').val() == '선택'){
                alert('특정 회원옵션을 선택해주세요.');
                return;
             }
             socialcheck = $('#memberType').val();
         }else{
         }
          var searchType = $('#searchType').val();
          var searchKeyword = null;
          if($('#searchText').val() == ''){
             searchType = null;
          }else{
             searchKeyword = $('#searchText').val();
          }
          var searchGender = "all";
          if($(':input[name=searchGender]:checked').val()){
             searchGender = $(':input[name=searchGender]:checked').val();
          }else{
             searchGender = "all";
          }
          var searchIsshow = "N";
          if(!$('#searchIsshow:checked').val()){
             searchIsshow = "Y";
          }
          var start = "1900-01-01";
          var finish = "2030-12-31";
          if($('#searchStart').val() != ''){
             start = $('#searchStart').val();
          }
          if($('#searchFinish').val() != ''){
             finish = $('#searchFinish').val();             
          }
          $.ajax({
             type:'post',
             url:'/civ/admin/searchmember.json',
             data:{'memberType':socialcheck,'searchType':searchType,'searchKeyword':searchKeyword,
                'searchStart':start,'searchFinish':finish,'searchGender':searchGender,
                'searchIsshow':searchIsshow},
             success:function(data){
                tdAppend(data);
             }
          });
       });
       
       function tdAppend(data){
          $('#tbody').html('');
          for(var i=0; i < data.length; i++){
            var tr = $('<tr id="tr_'+data[i].userNo+'" class="w3-hover-light-blue trClick"></tr>');
            var birth = new Date(data[i].userBirth).format('yyyy/MM/dd').substr(2);
            var joinDate = new Date(data[i].joinDate).format('yyyy/MM/dd');
            tr.append('<td class="tdNo">'+data[i].userNo+'</td>');
            tr.append('<td class="tdName">'+data[i].userName+'</td>');
            tr.append('<td class="tdId">'+data[i].userId+'</td>');
            tr.append('<td class="tdBirth" year="'+data[i].userBirth+'">'+birth+'</td>');
            tr.append('<td class="tdPhone">'+data[i].userPhone+'</td>');
            tr.append('<td class="tdJoinDate">'+joinDate+'</td>');
            tr.append('<td class="tdGender">'+data[i].userGender+'</td>');
            tr.append('<td class="tdNick">'+data[i].userNick+'</td>');
            tr.append('<td class="tdSocial">'+data[i].socialcheck+'</td>');
            $('#tbody').append(tr);
         }
          $('.trClick').on('click',function(){
             var tdArr = new Array();
             var tr = $(this);
             var td = tr.children();
             td.each(function(i){
                 tdArr.push(td.eq(i).text());
             });
             $("#upNo").val(tdArr[0]);
             $("#upName").val(tdArr[1]);
             $("#upId").val(tdArr[2]);
             $("#upYear").val(tr.children('.tdBirth').attr('year').split('/')[0]);
             $("#upMonth").val(tdArr[3].split("/")[1]).prop("selected", true);
             $("#upDay").val(tdArr[3].split("/")[2]).prop("selected", true);
             $("#upPhone1").val(tdArr[4].substr(0,3));
             $("#upPhone2").val(tdArr[4].substr(3,4));
             $("#upPhone3").val(tdArr[4].substr(7,9));
             $("#upJoinDate").val(tdArr[5]);
             $("input[name=upGender]:radio[value='"+tdArr[6]+"']").prop("checked", true);
             $("#upNick").val(tdArr[7]);
             $("#upSocial").val(tdArr[8]).prop("selected", true);
          });
       }
       
       $('input[name=socialCheck]').on('change',function(){
         if(this.value == '소셜'){
            $('#memberType').removeAttr('disabled');         
         }else{
            $('#memberType').val('');
            $('#memberType').attr('disabled','disabled');
         }
      });
       
       $('.trClick').on('click',function(){
          var tdArr = new Array();
          var tr = $(this);
          var td = tr.children();
          td.each(function(i){
              tdArr.push(td.eq(i).text());
          });
          
          $("#upNo").val(tdArr[0]);
          $("#upName").val(tdArr[1]);
          $("#upId").val(tdArr[2]);
          $("#upYear").val(tr.children('.tdBirth').attr('year').split('/')[0]);
          $("#upMonth").val(tdArr[3].split("/")[1]).prop("selected", true);
          $("#upDay").val(tdArr[3].split("/")[2]).prop("selected", true);
          $("#upPhone1").val(tdArr[4].substr(0,3));
          $("#upPhone2").val(tdArr[4].substr(3,4));
          $("#upPhone3").val(tdArr[4].substr(7,9));
          $("#upJoinDate").val(tdArr[5]);
          $("input[name=upGender]:radio[value='"+tdArr[6]+"']").prop("checked", true);
          $("#upNick").val(tdArr[7]);
          $("#upSocial").val(tdArr[8]).prop("selected", true);
       });
       
       $('.updateBtn').on('click',function(){
          var socialcheck = null;
          var userNo = $("#upNo").val();
          var userName = null;
          var userId = null;
          var userBirth = null;
          var userPhone = null;
          var joinDate = $("#upJoinDate").val();
          var userGender = null;
          var userNick = null;
          var isshow = null;
          if($('#upSocial').val() == '선택'){
                alert('특정 회원옵션을 선택해주세요.');
                return;
         }else{
            socialcheck = $('#upSocial').val();
         }
          if($('#upName').val() == null){
             alert('이름을 입력하세요.');
             $('#upName').focus();
          }else{
             userName = $('#upName').val();
          }
          if($("#upId").val() == null){
             alert('아이디을 입력하세요.');
             $('#upId').focus();
          }else{
             userId = $("#upId").val();
          }
          if($('#upYear').val() < 1900 || $('#upYear').val() > 2019 || $("#upMonth option:selected").val() == "월" || $("#upDay option:selected").val() == "일"){
            alert('생년월일을 제대로 입력해주세요.');
            $('#upYear').focus();
            return;
         }else{
            userBirth = $('#upYear').val()+"/"+$("#upMonth").val()+"/"+$("#upDay").val();
         }
          if($('#upPhone1').val() == '' || $('#upPhone2').val() == '' || $('#upPhone3').val() == ''){
             alert('전화번호을 제대로 입력해주세요.');
            $('#upPhone1').focus();
            return;
          }else{
             userPhone = $('#upPhone1').val()+$('#upPhone2').val()+$('#upPhone3').val();
          }
          userGender = $(':input[name=upGender]:checked').val();
          if($('#upNick').val() == ''){
             alert('닉네임을 입력해주세요.');
            $('#upNick').focus();
            return;
          }else{
             userNick = $('#upNick').val();
          }
          if($('#upIsshow').val()=='선택'){
             alert('탈퇴여부를 선택해주세요.');
            return;
          }else{
             isshow = $('#upIsshow').val();             
          }
          
          $.ajax({
             type:'post',
             url:'/civ/admin/updatemember.json',
             data:{'userNo':userNo,'userName':userName,'userId':userId,'userBirth':userBirth,
                'userPhone':userPhone,'joinDate':joinDate,'userGender':userGender,'userNick':userNick,
                'socialcheck':socialcheck,'isshow':isshow},
             success:function(data){
                var birth = new Date(userBirth).format('yyyy/MM/dd').substr(2);
               var joinD = new Date(joinDate).format('yyyy/MM/dd');
                $('#tr_'+userNo).children('.tdName').html(userName);
                $('#tr_'+userNo).children('.tdId').html(userId);
                $('#tr_'+userNo).children('.tdBirth').html(birth);
                $('#tr_'+userNo).children('.tdPhone').html(userPhone);
                $('#tr_'+userNo).children('.tdJoinDate').html(joinD);
                $('#tr_'+userNo).children('.tdGender').html(userGender);
                $('#tr_'+userNo).children('.tdNick').html(userNick);
                $('#tr_'+userNo).children('.tdSocial').html(socialcheck);
             }
          });
       });
       
       $('.removeBtn').on('click',function(){
          $.ajax({
             type:'post',
             url:'/civ/admin/removemember',
             data:{'userNo':$("#upNo").val()},
             success:function(data){
                if(data == true){
                   alert('삭제 오류');
                }else{
                   $('#tr_'+$("#upNo").val()).remove();                   
                }
             }
          });
       });
       
       $('.addBtn').on('click',function(){
          var socialcheck = null;
          var userName = null;
          var userId = null;
          var userBirth = null;
          var userPhone = null;
          var userGender = null;
          var userNick = null;
          var isshow = null;
          if($('#upSocial').val() == '선택'){
                alert('특정 회원옵션을 선택해주세요.');
                return;
         }else{
            socialcheck = $('#upSocial').val();
         }
          if($('#upName').val() == null){
             alert('이름을 입력하세요.');
             $('#upName').focus();
          }else{
             userName = $('#upName').val();
          }
          if($("#upId").val() == null){
             alert('아이디을 입력하세요.');
             $('#upId').focus();
          }else{
             userId = $("#upId").val();
          }
          if($('#upYear').val() < 1900 || $('#upYear').val() > 2019 || $("#upMonth option:selected").val() == "월" || $("#upDay option:selected").val() == "일"){
            alert('생년월일을 제대로 입력해주세요.');
            $('#upYear').focus();
            return;
         }else{
            userBirth = $('#upYear').val()+"/"+$("#upMonth").val()+"/"+$("#upDay").val();
         }
          if($('#upPhone1').val() == '' || $('#upPhone2').val() == '' || $('#upPhone3').val() == ''){
             alert('전화번호을 제대로 입력해주세요.');
            $('#upPhone1').focus();
            return;
          }else{
             userPhone = $('#upPhone1').val()+$('#upPhone2').val()+$('#upPhone3').val();
          }
          userGender = $(':input[name=upGender]:checked').val();
          if($('#upNick').val() == ''){
             alert('닉네임을 입력해주세요.');
            $('#upNick').focus();
            return;
          }else{
             userNick = $('#upNick').val();
          }
          if($('#upIsshow').val()=='선택'){
             alert('탈퇴여부를 선택해주세요.');
            return;
          }else{
             isshow = $('#upIsshow').val();             
          }
          $.ajax({
             type:'post',
             url:'/civ/admin/addmember.json',
             data:{'userName':userName,'userId':userId,'userBirth':userBirth,
                'userPhone':userPhone,'userGender':userGender,'userNick':userNick,
                'socialcheck':socialcheck,'isshow':isshow},
             success:function(data){
                tdAppend(data);
                alert('추가완료');
             }
          });
       });
       