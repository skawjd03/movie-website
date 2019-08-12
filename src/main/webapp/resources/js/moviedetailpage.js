
var movieCode;
var nowOrder = "추천순";

function nowPageCss(pagenum){
    	$('.nowpage_'+pagenum).css('background-color','#9d3341');
		$('.nowpage_'+pagenum).css('color','#d7d8db');
    }
    
    function prevPage(prevpage){
    	pageNum(prevpage);
    	nowPageCss(prevpage);
    }
    
    function nextPage(nextpage){
    	pageNum(nextpage);
    	nowPageCss(nextpage);
    }
    
    function lastPage(lastPage){
    	pageNum(lastPage);
    	nowPageCss(lastPage);
    }
    
    
    
    function pageNum(pagenum){
    	$.ajax({
    		type:'get',
    		url:'/civ/movie/pagechange.json',
    		data:{'movieCode':movieCode,'pageNum':pagenum,'order':nowOrder},
    		success:function(data){
				$('.commentListBox').html('');
				for(var i = 0; i < data.commentvo.length; i++){
					var comment = data.commentvo[i];
					var div = $('<div class="commentBox"></div>');
					if(comment.member == null){
						div.append('<div class="profileImgBox"><img class="profileImg" src="/civ/"></div>');
					}else{						
						div.append('<div class="profileImgBox"><img class="profileImg" src="/civ/resources/profile/'+comment.member.userProfile+'"></div>');
					}
					var idstar = $('<div class="commentIdStar"></div>');
					idstar.append('<span class="commentId">'+comment.member.userNick+'</span>');
					idstar.append('<div><span class="star-rating"><span style="width: '+comment.comment.commentStar*2*100/10+'%;"></span></span></div>');
					idstar.append('<p style="font-size: 12px;color: #666;">'+comment.comment.commentDate+'</p>');
					div.append(idstar);
					div.append('<div style="width: 600px; margin-left: 50px;"><p style="margin-top: 20px;">'+comment.comment.commentContent+'</p></div>');
					div.append((comment.comment.commentcheck == null ? '<div style="margin-top: 40px; width: 90px;">' :'<div style="margin-top: 40px; color:red; width: 90px;">') +'<a class="thumbsBtn thumb_'+comment.comment.commentNo+'" onclick="javascript:thumbsup('+comment.comment.commentNo+')"><i class="far fa-thumbs-up fa-1x"></i> 추천 <p>'+comment.comment.commentLikes+'</p></a></div>');
					$('.commentListBox').append(div);
				}
				$('.pagination').html('');
				if(data.pageinfo.prev){
					$('.pagination').append('<li class="page-item"><a class="page-link" onclick="prevPage('+(data.pageinfo.startPage-1)+')">이전</a></li>');
				}
				for(var i=data.pageinfo.startPage; i <= data.pageinfo.endPage; i++){
					$('.pagination').append('<li class="page-item"><a class="page-link nowpage_'+i+'" onclick="javascript:pageNum('+i+')">'+i+'</a></li>');
				}
				if(data.pageinfo.next){
					$('.pagination').append('<li class="page-item"><a class="page-link" onclick="nextPage('+(data.pageinfo.endPage+1)+')">다음</a></li>');
					$('.pagination').append('<li class="page-item"><a class="page-link" onclick="lastPage('+(data.pageinfo.lastPage)+')">맨끝</a></li>');
				}
				nowpageNum = pagenum;
				nowPageCss(pagenum);
    		}
    	});
    }
var tests= function(movieCode){
    var nowpageNum = 1;
    var choiceStar = null;
   
    
    $('.'+nowOrder).css('color','#9d3341');
    
    $('.starspan').on('click change',function(){
    	choiceStar = $(this).attr('star');
    	for(var i = 1; i <= $(this).attr('star'); i++){
    		$('.sstar'+i).css('color',"#993240");
    	}
    	if($(this).attr('star') == 5){
    		$('.starComment').html('너무 멋진 영화였어요');    		
    	}else if($(this).attr('star') == 4){
    		$('.starComment').html('기대해도 좋아요');    	
    	}else if($(this).attr('star') == 3){
    		$('.starComment').html('무난했어요');    
    	}else if($(this).attr('star') == 2){
    		$('.starComment').html('기대하진 말아요');   
    	}else if($(this).attr('star') == 1){
    		$('.starComment').html('괜히봤어요');   
    	}
    });
    $('.starspan').mouseenter(function(){
        $('.starspan').css('color',"#cdcdcd");
    });
    
    $('.commentBtn').on('click',function(){
    	if(choiceStar == null){
    		alert('별점을 선택하세요.');
    		return;
    	}
    	if($('#userComment').val() == ''){
    		alert('댓글 내용을 입력하세요.');
    		$('#userComment').focus();
    		return;
    	}
    	$.ajax({
    		type:'post',
    		url:'/civ/movie/commentwrite',
    		data:{'commentStar':choiceStar,'commentContent':$('#userComment').val(),'movieCode':movieCode},
    		success:function(data){
    			if(data == "success"){
    				$('.starspan').css('color',"#cdcdcd");
    				$('#userComment').val('');
    				pageNum(1);
    			}else if(data == "false"){
    				alert('댓글 입력오류');
    			}
    		}
    	});
    });
    
    $('#dibBtn').on('click',function(){
		$.ajax({
			type:'get',
			url:'/civ/movie/moviedibs',
			data:{'movieCode':movieCode},
			success:function(data){
				if(data == 'loginPlz'){
					alert('찜 기능은 로그인이 필요합니다.');
				}else if(data == "DibsError"){
					alert('찜 오류');
				}else if(data == 0){
					$('#dibBtn').attr('class','w3-btn movieDibsBtn2');
					$('#dibBtn').val('♥ 찜해제');
				}else if(data == 1){
					$('#dibBtn').attr('class','w3-btn movieDibsBtn');
					$('#dibBtn').val('♥ 찜하기');
				}
			}
		});
	});
    
    $('.thumbsOrder').on('click',function(){
    	nowOrder = "추천순";
    	$('.최신순').css('color','black');
    	$('.'+nowOrder).css('color','#9d3341');
    	pageNum(1);
    });
    $('.newOrder').on('click',function(){
    	nowOrder = "최신순";
    	$('.추천순').css('color','black');
    	$('.'+nowOrder).css('color','#9d3341');
    	pageNum(1);
    });
    
    var galleryThumbs = new Swiper('.gallery-thumbs', {
        spaceBetween: 0,
        slidesPerView: 4,
        freeMode: true,
        loopedSlides: 5, //looped slides should be the same
        watchSlidesVisibility: true,
        watchSlidesProgress: true,
    });
    var galleryTop = new Swiper('.gallery-top', {
        spaceBetween: 10,
        loopedSlides: 5, //looped slides should be the same
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        thumbs: {
            swiper: galleryThumbs,
        },
    });
 
    
}
