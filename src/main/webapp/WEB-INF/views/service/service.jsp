<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.0.js" integrity="sha256-slogkvB1K3VOkzAI8QITxV3VzpOnkeNVsKvtkYLMjfk="  crossorigin="anonymous"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="/civ/resources/css/noticepage.css" />
<script	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>


<script type="text/javascript">
	function getId(aaa){
		var tt = $(aaa).parent().attr('id');
		
		$('#idx').val(tt);
		alert(tt); 
		$('#notice_f').submit();
	}
	
	function changeColor(ts){
		$('.service_btn').css('background-color' ,'#d2d2d2');
		$('.service_btn').css('color' ,'black');
		$(ts).css('background-color', '#323232');
		$(ts).css('color', 'white');
	}

	function callList(nowPage){
		$('#Notice_ajax').empty();
		$('.notice_count').empty()
		$('#none_data').empty();
		$('#paging').empty();
		var isSearch = $('#isSearch').val();
		
	 	$.ajax({
			type:"POST",
			url:"/civ/Notice/noticeList.s5",
			dataType: "json",
			data: {
				"nowPage" : nowPage
			},
			success: function(data){
				var len = Object.keys(data.list).length;
				var vo = Object.keys(data);
				
				// 리스트 출력
				var html = "";
							$('#Notice_ajax').append(
									"<tr>" +
			                           "<th class= \"short_th\">번호</th><th>제목</th><th class=\"short_th\">등록일</th><th class=\"short_th\">조회수</th>" +
									"</tr>"
							);
				for(var i = 0; i < len; i++) {
							$('#Notice_ajax').append(
							"<tr id=\"" + data.list[i].n_no + "\" ><td class=\"center_td loc_detail\" >" + data.list[i].n_no + "</td>" +
								"<td class=\"center_td loc_detail\" style=\"text-align: left;\" onclick=\"getId(this);\" >" + data.list[i].n_title + "</td>" +
								"<td class=\"center_td loc_detail\" >" + data.list[i].n_date + "</td>" +
								"<td class=\"center_td loc_detail\" >" + data.list[i].n_hit + "</td>" +
							"</tr>"+"");
				}
				
				// 개수물 수 출력
				$('#nt_cnt').append("총 <span class=\"w3-badge w3-green\">"+ len + "</span>개의 게시물이 검색되었습니다");
				
				//페이징 처리 출력
				var str = "<div class=\"shadow pagination btn-group justify-content-center mt-3 mx-auto px-0\">" +
						  "<div class=\"d-inline-block page-item btn btn-light mx-0 btnW50\" id=\"pbtn\">prev</div>";
						  
				for(var i = data.pUtil.startPage; i< data.pUtil.endPage + 1; i++){
					if (i != data.pUtil.nowPage){
						str += "<div class=\"d-inline-block page-item btn btn-light mx-0 pagebtn\">" + i + "</div>";
					}
					else if( i == data.pUtil.nowPage){
						str += "<div class=\"d-inline-block page-item btn btn-info mx-0 pagebtn\">" + i + "</div>";
					} 
				}
				
				str += "<div class=\"d-inline-block page-item btn btn-light mx-0 btnW50\" id=\"nbtn\">next</div>";
				str += "</div>";
				
				$('#paging').append(str); 
				
				var startP = data.pUtil.startPage;
				var endP = data.pUtil.endPage;
				var grpP = data.pUtil.pageGroup;
				var totP = data.pUtil.totalPage;
				
				
				// 페이지 버튼 이벤트
				if(data.pUtil.endPage == data.pUtil.pageGroup){
					$('#pbtn').text("=");
					$('#pbtn').css('background-color', 'lightgray');
				} else {
					$('#pbtn').click(function(){
						var strPage = data.pUtil.startPage - 1;
						if(!isSearch){
							callList(strPage);
						} else{
							callSearchList(strPage);
						}
					});					
				}
				
				if(data.pUtil.endPage == data.pUtil.totalPage){
					$('#nbtn').text("=");
					$('#nbtn').css('background-color', 'lightgray');
					$('#nbtn').removeClass('');
				} else{
					$('#nbtn').click(function(){
						var strPage = data.pUtil.endPage + 1;
						if(!isSearch){
							callList(strPage);							
						} else{
							callSearchList(strPage);
						}
					});
				}

				$('.pagebtn').click(function(){
					var strPage = $(this).text();
					var tmp = data.pUtil.nowPage;
					if(strPage != tmp){
						//if(!isSearch){
						callList(strPage);
					}
				});
				
				var trtag = $(".Notice_ajax").children().first();
				trtag.css('background-color','lightgray');
				
	 	},	error: function(){
				alert('에러');	
			}
		}); 
	}





	function callSearchList(nowPage){
		var word = document.getElementById('word').value;
		$('#Notice_ajax').empty();
		$('.notice_count').empty();
		$('#none_data').empty();
		$('#paging').empty();
		
		
		$.ajax({
			url:"noticeSearch.s5",
			type:"POST",
			dataType: "json",
			data:{
				"word" : word,
				"nowPage": nowPage
			},
			success: function(data){
				$('#isSearch').val(data.isSearch);
				var isSearch = $('#isSearch')
				var len = Object.keys(data.list).length;
				//alert(len);
				var vo = Object.keys(data);
				//alert(nnn[0]);
				var html = "";
							$('#Notice_ajax').append(
									"<tr>" +
			                           "<th class= \"short_th\">번호</th><th>제목</th><th class=\"short_th\">등록일</th><th class=\"short_th\">조회수</th>" +
									"</tr>"	
							);
				for(var i = 0; i < len; i++) {
							$('#Notice_ajax').append(
							"<tr id=\"" + data.list[i].n_no + "\" ><td class=\"center_td loc_detail\" >" + data.list[i].n_no + "</td>" +
							"<td class=\"center_td loc_detail\" style=\"text-align: left;\" onclick=\"getId(this);\" >" + data.list[i].n_title + "</td>" +
							"<td class=\"center_td loc_detail\" >" + data.list[i].n_date + "</td>" +
							"<td class=\"center_td loc_detail\" >" + data.list[i].n_hit + "</td>" +
							"</tr>");
	}

				$('#nt_cnt').append("총 <span class=\"w3-badge w3-green\">"+ len + "</span>개의 게시물이 검색되었습니다");
					if(len == 0){
						$('#none_data').append("<p class=\"none_data\"><b>검색결과가 없습니다</b></p>");
					}
					
					var startP = data.pUtil.startPage;
					var endP = data.pUtil.endPage;
					var grpP = data.pUtil.pageGroup;
					var totP = data.pUtil.totalPage;
					
					
					//페이징 처리 출력
					var str = "<div class=\"shadow pagination btn-group justify-content-center mt-3 mx-auto px-0\">" +
							  "<div class=\"d-inline-block page-item btn btn-light mx-0 btnW50\" id=\"pbtn\">prev</div>";
							  
					for(var i = startP; i< endP+1; i++){
						if (i != data.pUtil.nowPage){
							str += "<div class=\"d-inline-block page-item btn btn-light mx-0 spagebtn \">" + i + "</div>";
						}
						else if( i == data.pUtil.nowPage){
							str += "<div class=\"d-inline-block page-item btn btn-info mx-0 spagebtn \">" + i + "</div>";
						} 
					}
					
					str += "<div class=\"d-inline-block page-item btn btn-light mx-0 btnW50\" id=\"nbtn\">next</div>";
					str += "</div>";
					
					$('#paging').append(str); 
					
					
					// 페이지 버튼 이벤트
					if(data.pUtil.endPage == data.pUtil.pageGroup){
						$('#pbtn').text("=");
						$('#pbtn').css('background-color', 'lightgray');
					} else if(data.pUtil.endPage < data.pUtil.pageGroup){
						$('#pbtn').text("=");
						$('#pbtn').css('background-color', 'lightgray');
					}
					else {
						$('#pbtn').click(function(){
							var strPage = data.pUtil.startPage - 1;
								callSearchList(strPage);
						});					
					}
					
					if(data.pUtil.endPage == data.pUtil.totalPage){
						$('#nbtn').text("=");
						$('#nbtn').css('background-color', 'lightgray');
						$('#nbtn').removeClass('');
					} else{
						$('#nbtn').click(function(){
							var strPage = data.pUtil.endPage + 1;						
								callSearchList(strPage);
						});
					}
					
					$('.spagebtn').click(function(){
						var strPage = $(this).text();
						var tmp = data.pUtil.nowPage;
						if(strPage != tmp){
							callSearchList(strPage);
						}
					});
					
					var trtag = $(".Notice_ajax").children().first();
					trtag.css('background-color','lightgray');
					
			},
			error: function(){
				alert("ajax2 error");
			}
		});
	}
	 	
	 	
	 	
	$(document).ready(function(){
		
		// 공지사항 리스트 불러오기
		$('#noticebtn').click(function(){
			//location.replace('/service/service.do');
			$('#foot1').css('display','none');			
			$('#foot2').css('display','block');
			$('#foot3').css('display','none');
			var nowPage = $('#nowPage').val();
		 	callList(nowPage);
		});
		
		// 검색어 처리 ajax
		
		$('#search').click(function(){			
			var nowPage = $('#nowPageSearch').val();
			callSearchList(nowPage);
		});
		
		
		$('.faq_ans').hide();
		$('.open_faq').click(function(){
			var sid = $(this).attr('id');
			var btn = $('#'+sid+'').html();
			if(btn == '▼'){
				$(this).html('▲');
			} else {
				$(this).html('▼');
			}
			sid = sid.substring(1);
			sid = '#a' + sid;
			$(sid).slideToggle();
		});
	
		$('#fbtn').click(function(){
			$('#foot1').css('display','block');
			$('#foot2').css('display','none');
			$('#foot3').css('display','none');			
		});
	
	

		
		 
		
		
		$('#qbtn').click(function(){
			$('#foot1').css('display','none');			
			$('#foot2').css('display','none');						
			$('#foot3').css('display','block');
		});
		
		$('#req_frm').hide();
		$('#t_agree').click(function(){
			$('#req_frm').show();
		});
		
		$('#t_disagree').click(function(){
			$('#req_frm').hide();
		});
		
		$('#rbtn').click(function(){
			alert('전송완료');
			$('#req_frm').submit();

		});
		
		

		
		
		

		
		$('#t_disagree').click(function(){
			alert('개인정보 수집에 동의 해 주세요.');
		});
		
 	
		$("#inputimg").change(function() {
			fileBuffer = [];
			const target = document.getElementsByName('s_img');
			Array.prototype.push.apply(fileBuffer, target[0].files);
			var html = '';
			$.each(target[0].files, function(index, file){
				const fileName = file.name;
				html += '<div id="imgdiv" style="display: inline-block; width: 150px;">';
				html += '<a>'+fileName+'</a>';
				html += '<a id="removeImg" onclick="removeImg()">╳</a>';
				html += '<img class="upimg" src="'+ URL.createObjectURL(file) +'">'
				html += '</div>';
				
				  const fileEx = fileName.slice(fileName.indexOf(".") + 1).toLowerCase();
				   if (fileBuffer.length > 3){
					  $('#inputimg').val("");
					  resetFile();
					  alert("파일은 최대 3개까지 가능 ");
					  return false;
				  } 
		            if(fileEx != "jpg" && fileEx != "png" &&  fileEx != "gif" &&  fileEx != "pdf"){
		                alert("파일은 (jpg, png, gif, pdf) 형식만 등록 가능합니다.");
		                resetFile();
		                $('#inputimg').val("");
		                return false;
		            }
				$('.showimg').html(html);
			});
			
		});
		
		$(document).on('click', '#removeImg', function(){
			  const fileIndex = $(this).parent().index();
			   fileBuffer.splice(fileIndex,1);
			   $('.showimg>div:eq('+fileIndex+')').remove();
			   const target = document.getElementsByName('files[]');
			   console.log(fileBuffer);
			   console.log(target[0].files);
		});
		

		
		/*
		$('#pbtn').click(function(){
			var strPage = '${PAGE.startPage - 1}';
			callList(strPage);
		});
		$('#nbtn').click(function(){
			var strPage = '${PAGE.endPage + 1}';
			callList(strPage);
		});	
		
			
		$('#pbtn').click(function(){
			var strPage = '${PAGE.startPage - 1}';
			//if(!isSearch){
				callList(strPage);
			}  else {
				$('#cPage').val(strPage);
				$('#srch').submit();
			} 

		});
		
		$('#nbtn').click(function(){
			var strPage = '${PAGE.endPage + 1}';
			//if(!isSearch){
				callList(strPage);
		 	} else {
				$('#cPage').val(strPage);
				$('#srch').submit();
			} 
		});
		
		$('.cbtn').click(function(){
			var strPage = $(this).text();
			var tmp = '${PAGE.nowPage}';
			if(strPage != tmp){
				if(!isSearch){
				$('#nowPage').val(strPage);
				$('#frm').submit();
			} else{
				$('#cPage').val(strPage);
				$('#srch').submit();
			}
			} else {
				return;
			}
		});
		
		*/
		
		
	});
		

	
		
	
	 
</script>
</head>
<body>
		<%@include file="/resources/include/header.jsp"%>
	
	
	<div class="service_container">

		<div class="service_box">
			<div class="service_header">
				<input type="button" class="btn service_btn" id="fbtn" value="FAQ"
					onclick="changeColor(this);"> <input type="button"
					class="btn service_btn" id="noticebtn" value="공지사항"
					onclick="changeColor(this);"> <input type="button"
					class="btn service_btn" id="qbtn" value="1:1문의"
					onclick="changeColor(this);">
				<hr style="margin: -5px;">
			</div>
	

			<!-- FAQ 화면 -->
			<div id="foot1">
				<div class="service_footer" id="id">
					<div class="service_faq">
						<h3>FAQ TOP5</h3>
						<div class="faq_data" style="height: 100%;">
							<table>
								<tr>
									<th class="faq_title">영화예매</th>
									<td>영화 관람권으로 예매하는 방법 <a class="open_faq" id="f1">▼</a></td>
								</tr>
								<tr class="faq_ans" id="a1">
									<td></td>
									<td>영화 관람권 이용 방법은<br> 홈페이지, 어플, 웹 로그인 후 결제 마지막 단계에서<br>
										[영화관람권/VIP쿠폰] - [쿠폰번호 및 인증번호 입력] - [관람권 등록] - [사용] - [적용] -
										[결제]<br> 차례로 선택하시면 예매가 완료 되며, 예매 번호 확인이 가능합니다.<br>
										완료된 예매 내역은 [예매확인 /취소] 에서도 확인 가능합니다.<br>
										<br>
										* 영화 관람권은 회원 로그인 후 [쿠폰/관람권]에서 등록 가능합니다.<br>
										* 영화 관람권 사용의 경우, 비회원 예매는 불가능 합니다. </td>
								</tr>

								<tr>
									<th class="faq_title">영화예매</th>
									<td>문화상품관이나, 해피머니 상품권으로 예매 가능한가요?<a class="open_faq"
										id="f2">▼</a></td>
								</tr>
								<tr class="faq_ans" id="a2">
									<td></td>
									<td>문의하신 문화상품권, 해피머니 상품권등 상품권의 경우<br> 온라인 예매는 불가하며,
										현장 매표소를 통해 현금과 동일하게 사용가능합니다.<br> <br> * 상품권내 스크래치
										오픈시 해당 상품권 홈페이지를 통해서만 이용가능합니다.<br>
									</td>
								</tr>

								<tr>
									<th class="faq_title">홈페이지</th>
									<td>아이디와 비밀번호를 잃어버렸습니다<a class="open_faq" id="f3">▼</a></td>
								</tr>
								<tr class="faq_ans" id="a3">
									<td></td>
									<td>홈페이지 우측 상단 로그인 선택시 ID/PW 찾기를 통해 확인가능합니다.<br> <br>
										단,<br> 비밀번호 찾기의 경우<br> 현재 설정된 비밀번호 확인은 불가하며,<br>
										새로운 비밀번호로의 재 설정만 가능합니다.<br> * ID/PW 찾기가 원활하지 않을 경우,<br>
										대표번호 1544-0070 (운영시간 09:00~21:00) > 상담원 연결 후 문의주시기 바랍니다.<br>
									</td>

								</tr>

								<tr>
									<th class="faq_title">영화예매</th>
									<td>인터넷 예매시 부분환불/교환이 가능한가요?<a class="open_faq" id="f4">▼</a></td>
								</tr>
								<tr class="faq_ans" id="a4">
									<td></td>
									<td>인터넷 예매시에는 예매매수의 전체환불 및 교환만 가능합니다. <br> 인터넷 예매분에
										대해 교환환불 및 취소하고자 하실 경우, 예매하신 내역 전체에 대해 취소 후<br> 새로 예매를
										하시거나 해당 영화관을 방문하셔서 처리하셔야 합니다. <br> 1) 인터넷상 취소 가능시간 (상영시간
										20분전까지만 가능) <br> - 전체 취소가능하며, 부분 취소 불가<br> EX) 인원수,
										관람자, 시간변경은 모두 취소 후 재예매 해주셔야합니다.<br> <br> 2) 현장 취소
										가능시간(상영시간 전까지만 가능)<br> - 전체환불 및 교환가능<br> - 부분환불 및
										교환가능<br> 단, 부분환불 및 교환은 사용하신 카드로 전체 취소 후 재결제하셔야 합니다.<br>
									</td>
								</tr>

								<tr>
									<th class="faq_title">기타</th>
									<td>관람권 등록하는 방법<a class="open_faq" id="f5">▼</a></td>
								</tr>
								<tr class="faq_ans" id="a5">
									<td></td>
									<td>홈페이지, 어플, 웹 회원로그인 후 <br> [나의 메가박스] > [관람권/쿠폰관리] >
										[관람권등록] > [쿠폰번호 입력] 등록<br> <br> * 스토어관람권, 기프티쇼,
										기프티콘, 아이넘버, 도넛북 등 일부 관람권 등록불가<br>
									</td>
								</tr>

							</table>
						</div>
					</div>
				</div>
			</div>


			<!-- 공지사항  -->
			<div id="foot2">
				<form method="POST" action="noticeDetail.s5" name="notice_f" id="notice_f">
					<input type="hidden" id="idx" name="n_no">
				</form>
				<div class="service_footer_notice">
					<div class="service_faq">
					<hr>
						<div class="search_notice">
							<div class="notice_search_label">
								<h5>
									<i class="material-icons">search</i>
								</h5>
							</div>
							<div class="notice_search_input">
								<input type="text" placeholder="검색어 입력" id="word">
								<button class="search" id="search">검색</button>
								<p class="notice_count" id="nt_cnt"></p>
							</div>
						</div>
						<div class="faq_data">
							<table class="Notice_ajax" id="Notice_ajax">
								<!-- ajax 내용 출력하는곳  -->
								
							</table>		
							<div id="none_data"></div>
					
<%-- 페이징 --%>
		<input type="hidden" id="nowPage" value="1">
		<input type="hidden" id="nowPageSearch" value="1">
		<input type="hidden" id="isSearch" value="">
		<div style="width: 100%;">
			<div class="row" style="text-align: center" id="paging">

			</div>
		</div> 
			
			
			
						</div>
					</div>
				</div>
			</div>


			<!-- 1:1 문의 -->
			<p></p>
			<p></p>
			<div id="foot3">
				<div class="service_footer">
					<div class="service_faq">
						<h5>
							<b>문의사항이나 불편사항은 이곳에 남겨주세요. 최대한 빠른 시간 안에 답변 드리겠습니다.</b><br>
							<h6>
								금요일 오후 6시 이후 접수된 문의는 그 다음주에 처리될 수 있습니다.<br>FAQ를 이용하시면 궁금중을
								더 빠르게 해결하실 수 있습니다.
							</h6>
							<hr>
						</h5>
						<div class="inquiry_agree">
							<p>
								1:1 문의글 답변 운영시간 09:00 ~ 21:00 <a class="inquiry_text"> 문의를
									통해 아래의 개인정보를 수집합니다. 수집된 개인정보는 문의 처리 외 목적으로 사용하지 않습니다. </a>
							</p>
							<h6 class="agree_title">개인정보수집동의</h6>
							<!-- <div class="agree_scroll"> -->
							<textarea rows="5" cols="50" class="agree_scroll">
귀하께서 문의하신 다음의 내역은 법률에 의거 개인정보 수집.이용에 대한 본인동의가 필요한 항목입니다.
개인정보의 수집 및 이용목적
회사는 1:1 문의내역의 확인, 요청사항 처리 또는 완료 시 원활한 의사소통 경로 확보를 위해 수집하고 있습니다.
수집하는 개인정보의 항목
이름, 연락처, 이메일 주소
개인정보의 보유기간 및 이용기간
문의 접수 ~ 처리 완료 후 6개월
(단, 관계법령의 규정에 의하여 보존 할 필요성이 있는 경우에는 관계 법령에 따라 보존)
자세한 내용은 '개인정보 처리방침'을 확인하시기 바랍니다.
                            </textarea>
							<div>
								<input type="radio" name="agree" id="t_agree">동의함 <input
									type="radio" name="agree" id="t_disagree">동의하지 않음
							</div>
						</div>

						<!-- 개인정보수집 동의시 나올 페이지 -->
					<div class="inquiry_write">
						<form method="POST" action="qRegister.s5" id="req_frm" name="req_frm" enctype="multipart/form-data">
								<div class="faq_data">
									<table>
										<tr>
											<th>문의종류</th>
											<td><input type="radio" name="s_kindof" value="결제">결제
												<input type="radio" name="s_kindof" value="영화관">영화관
												<input type="radio" name="s_kindof" value="홈페이지">홈페이지
												<input type="radio" name="s_kindof" value="영화"
												checked="checked">영화</td>
										</tr>
										<tr>
											<th>제목</th>
											<td>
												<input type="text" style="width: 80%;" name="s_title">
											</td>
										</tr>
										<tr>
											<th>내용</th>
											<td>
												<textarea rows="5" cols="50" class="agree_qscroll" name="s_content"></textarea>
											</td>
										</tr>
										<tr>
											<th>첨부파일</th>
											<td>
												<input multiple="multiple" type="file" name="s_img"  id="inputimg" /> 
												<!-- <img id="blah" src="#" alt="your image" style="width: 100px; height:130px;" /> -->
												<div class="showimg" style="display: inline-block;">
													
												</div>
												<div>
													( jpg,png,gif,pdf 형식만 등록 가능합니다. )
												</div>
											</td>
										</tr>
									</table>
									<div class="req_btn btn" style="float: right;" id="rbtn">등록</div>
								</div>
						</form>
					</div>

					</div>
				</div>
			</div>
			
			
		</div>
	</div>
		<br><br><br>
		<%@include file="/resources/include/footer.jsp"%>
</body>
</html>