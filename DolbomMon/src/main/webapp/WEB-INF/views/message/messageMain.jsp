<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/css/bootstrap.js"></script>
<script>
	$(function(){
		
		$(document).ready(function() {
			// 팝업 창 크기를 HTML 크기에 맞추어 자동으로 크기를 조정하는 함수.
			var strWidth;
			var strHeight;
			
			//innerWidth / innerHeight / outerWidth / outerHeight 지원 브라우저 
			if ( window.innerWidth && window.innerHeight && window.outerWidth && window.outerHeight ) {
			    strWidth = $('#messageMain').outerWidth() + (window.outerWidth - window.innerWidth);
			    strHeight = $('#messageMain').outerHeight() + (window.outerHeight - window.innerHeight);
			}
			else {
			    var strDocumentWidth = $(document).outerWidth();
			    var strDocumentHeight = $(document).outerHeight();
			
			    window.resizeTo ( strDocumentWidth, strDocumentHeight );
			
			    var strMenuWidth = strDocumentWidth - $(window).width();
			    var strMenuHeight = strDocumentHeight - $(window).height();
			
			    strWidth = $('#messageMain').outerWidth() + strMenuWidth;
			    strHeight = $('#messageMain').outerHeight() + strMenuHeight;
			}
			
			//resize 
			window.resizeTo( strWidth, strHeight );
		});

		$(".nav-tabs a").click(function(){
			var result = $(this).parent().attr("id");
		});
		
		$("#allCheck").on('change',function(){
			$("#message_list input").prop("checked", $("#allCheck").prop("checked"));
		});
		
	});
	
	//회원검색 탭 눌렀을때
	function imgchange(data){ 
		$(".note_title img").attr("src",data); //상단이미지 변환	
		$("#changeTotal").html("0"); //전체레코드 0으로표시
		$("#paging").css("display","none"); //페이징 제거
		$(".note_msg").css("display","none"); //보관버튼 제거
	}
	
	//탭매뉴 클릭시 전환
	function tabChange(){
		$("#test2").children().eq(${tabType}-1).children('a').attr("class", "nav-link active");
	}
</script>
<style>
	body{
		font-size:14px;
		overflow-x:hidden; 
		overflow-y:hidden;
		margin:0;
		padding:0;
		width:482px;
		height:600px;
	}

	#messageMain{
		padding:15px 15px;
		width:482px;
		height:600px;
		margin:0 auto;
		border:1px solid lightblue;
		background-color:#F3F3F3;
	}
	#message>table{
		background-color:#fff;
		border:1px solid #EBD9D9;
		width:100%;
	}
	#message tr{
		border-bottom:1px solid #EBD9D9;
	}
	#page_list{
		float:right;
	}
	#note_tile{
		width:450px;
	}
	.clearfix:after { clear:both; }
	.list_line>td, #message_list>td{
		line-height:25px;
	}
	tbody p{
		height:10px;
	}
	a:hover, a:link, a:visited{
	    text-decoration:none;
	    color:#000;
	}
	
	.search_box ul, .search_box li{
		margin:0;
		padding:0;
		list-style-type:none;
		text-align:center;
	}
	
	.wordCut{
		white-space:nowrap;
		overflow:hidden;
		text-overflow:ellipsis;
	}
	#paging ul{
		float:right;
	}
</style>
</head>
<body onload="tabChange()">
<div id="messageMain">
	<div id="note_tile" class="clearfix">
		<p class="note_title" style="float:left">
       		<a href="#"><img src="icon/message/message1.gif" width="98px" height="23px" /></a>
    	</p>
		<p class="text_title" style='text-align:right; float:right;'>
			<!-- 게시판 검색주소 넣기 .. ex:https://www.ppomppu.co.kr/zboard/member_memo.php?exec=view&no=&page=1&memo_type=inbox&sort=unread -->
			<!--  ex : https://www.ppomppu.co.kr/zboard/member_memo.php?exec=view&no=&page=1&memo_type=inbox -->
			<a href="#" class="btn_show"> 안 읽은 쪽지 <font
				style="font-weight: bold; color: #F00;">0</font></a> / <a href="#" class="btn_show"> 전체 <span style='font-weight: bold;' id="changeTotal">
				${pVo.totalRecord}
				</span></a>

		</p>
	</div>

	<ul class="nav nav-tabs" id="test2">
		<li class="nav-item" id="receive"><a class="nav-link" href="/dbmon/message?tabType=1">받은쪽지</a></li>
		<li class="nav-item" id="send"><a class="nav-link" href="/dbmon/message?tabType=2">보낸쪽지</a></li>
		<li class="nav-item" id="storage"><a class="nav-link" href="/dbmon/message?tabType=3">쪽지보관</a></li>
		<li class="nav-item" id="spam"><a class="nav-link" href="/dbmon/message?tabType=4">스팸쪽지</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#memberSearch" onclick="imgchange('icon/message/message5.gif')">회원검색</a></li>
	</ul>

	<div class="tab-content">
		<div class="tab-pane fade show active" id="message">
			<table>
				<colgroup>
					<col width="20px" />
					<col width="" />
					<col width="110px" />
					<col width="44px" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col" style="text-align:center;"><input type="checkbox" id="allCheck"/></th>
						<th scope="col" class="sub_title">제목</th>
						<th scope="col" class="sub_title">
						<c:choose>
							<c:when test="${tabType==2}">
							받은사람
							</c:when>
							<c:otherwise>
							보낸사람
							</c:otherwise>
						</c:choose>
						</th>
						<th scope="col" class="sub_title">날짜</th>
					</tr>
				</thead>
			
				<tbody>
					<tr class="list_line">
						<td class="note_info note_notice" colspan="4">
							<p class="note_new">
								<a href="/zboard/view.php?id=notice&no=940" target="_blank" class="btn_show">
									<img src="icon/message/icon_notice_new.png" border="0" alt="notice" class="icon-notice"> <span>돌봄몬 운영자 사칭 쪽지 주의</span> 
								</a>
							</p>
						</td>
					</tr>
					<tr>
						<td colspan="4" class="board-line"></td>
					</tr>
				<!-- 쪽지 리스트 -->	
					<c:forEach var="vo" items="${list}">
					<tr id="message_list">
						<td style="text-align:center;"><input type="checkbox" name=delMessage value="${vo.no}"/></td>
						<td class="note_info" title="테스트">
							<p class="note_new">
								<a href="/dbmon/messageContent?no=${vo.no}&nowPage=${nowPage}&tabType=${tabType}">
									<img src="icon/message/ico_talk.gif"/>
								</a>
								<a href="/dbmon/messageContent?no=${vo.no}&nowPage=${nowPage}&tabType=${tabType}" class="btn_show wordCut">
									${vo.subject}
								</a>
							</p>
						</td>
						<td class="user_new">
							<a href="https://www.ppomppu.co.kr/zboard/member_memo.php?search_type=name&memo_type=inbox&keyword=%B8%C1%B0%ED%21">
								<img src="icon/message/note_new1.gif" width="8px" height="8px" /> 
							</a>
							<a href="javascript:;" onclick="window.open('/zboard/view_info2.php?member_no=GmC49Ayrh6WLrGZT3k1Zjw%3D%3D','view_info','width=478,height=510,toolbar=no,scrollbars=yes')" >
								<span id="sendWrite">
									<c:if test="${tabType==1 || tabType==3 || tabType==4}">
									${vo.userid_w}
									</c:if>
									<c:if test="${tabType==2 }">
									${vo.userid_r}
									</c:if>
								</span>
							</a>
						<td class="date">${vo.writedate}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	<div class="tab-pane fade" id="memberSearch">
			<p>회원검색</p>
		</div>
	</div>
	
<!-- 보관, 삭제 버튼 -->	
	<div class="note_msg  clearfix">
		<div class="btns">
			<a href="#" onClick="move_save(); return false;" class="btn_keep">
				<span><img src="icon/message/keep_icon.gif" alt="보관" /></span>
			</a> <a href="javascript:doDeleteMemo();" class="btn_keep"> <span><img
					src="icon/message/delete_icon.gif" alt="삭제" /></span></a>
		</div>

		<!--page-->
		<div id="paging">
			<ul  class="pagination" >
				<!-- 이전페이지 -->
			
				<li class="page-item">
					<c:if test="${pVo.nowPage>1}"> <!--														여기부터 검색어 있을때 검색어페이지 넘어가게 작성한것. 밑에도 다 있음	  -->
						<a class="page-link"  class="page-link" href="/dbmon/message?tabType=${tabType }&nowPage=${pVo.nowPage-1}<c:if test="${pVo.searchWord!=null}">&searchKey=${pVo.searchKey}&searchWord=${pVo.searchWord }</c:if>">Prev</a>
					</c:if>
				</li>
				<!-- 									1						1+10			 -->
				<!-- 									11						11+10			 -->
				<c:forEach var="p" begin="${pVo.startPageNum}" end="${pVo.startPageNum+pVo.onepageNumCount-1}">
					<c:if test="${p<=pVo.totalPage }">
						<li class="page-item">
							<a class="page-link" href="/dbmon/message?tabType=${tabType }&nowPage=${p}<c:if test="${pVo.searchWord!=null}">&searchKey=${pVo.searchKey}&searchWord=${pVo.searchWord }</c:if>"><span <c:if test="${p==pVo.nowPage}">style="color:red"</c:if>>${p}</span></a>
						</li>
					</c:if>
				</c:forEach>
				
				<!-- 다음페이지 -->
				<li class="page-item"> 
					<c:if test="${pVo.nowPage<pVo.totalPage}">
						<a class="page-link" href="/dbmon/message?tabType=${tabType }&nowPage=${pVo.nowPage+1}<c:if test="${pVo.searchWord!=null}">&searchKey=${pVo.searchKey}&searchWord=${pVo.searchWord }</c:if>">Next</a>
					</c:if>
					
				</li>
				
			</ul>
		</div>
		<!--//page-->
	</div>
	<!-- 검색창 -->

	<div class="search_box">
		<form method="get" action="/dbmon/message">
			<ul>
				<input type="hidden" name="tabType" value="${tabType}"/>
				<li>
				   	<select name="searchKey" id="searchKey" style="height:27px;">
					<option value="subject" > 제목</option>
					<option value="content" >본문</option>
					<option value="userid" >아이디</option>
	            	</select>
				<input type="text" name="searchWord" id="searchWord" value="${vo.getSearchWord() }"/>
				<input type="submit" value="검색"/>
				</li>
			</ul>
	</form>
	</div>
 <!-- 검색창 -->  
	
	
</div>

</body>
</html>