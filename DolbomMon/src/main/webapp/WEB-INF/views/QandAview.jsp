<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

  <style>
	a.nav-link:hover{
		color:#ff7942;
	}

		.spread-underline:after {    
		  background: none repeat scroll 0 0 transparent;
		  bottom: 0;
		  content: "";
		  display: block;
		  height: 2px;
		  left: 50%;
		  position: absolute;
		  background: #ffb000;
		  transition: width 0.3s ease 0s, left 0.3s ease 0s;
		  width: 0;
		}
		.spread-underline:hover:after { 
		  width: 100%; 
		  left: 0; 
		}
  </style>
<h1 style="color:#ff7928;">Q&A</h1>
<h3 class="_3xkJ0 spread-underline">돌봄몬이 <span class="_34XF1">궁금</span>하신가요?</h3>
<!--   <div>
	관리자만 볼 수 있게 숨기기
	<a class="btn btn-warning" href="noticeBoardWrite" role="button" style="float:right; margin-bottom:30px;">공지사항 등록하기</a>
</div> -->
    <div class="container">
      <div class="row">
        <div class="col">
         
            <ul class="nav nav-tabs">
              <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#qwe">부모 회원</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#asd">돌봄몬 회원</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#zxc">돌봄활동과 활동비</a>
              </li>
            </ul>
            <div class="tab-content" style="font-weight:normal;">
            <!-- 부모회원 -->
              <div class="tab-pane fade show active" id="qwe">
                	<table class="table table-hover">
		<colgroup>
			<col style="width: 10%;">
			<col>
			<col style="width: 12%;">
			<col style="width: 15%;">
			
			
		</colgroup>
		<thead>
			<tr>
				<th scope="col">글번호</th>
				<th scope="col">글제목</th>
				<th scope="col">작성자</th>
				<th scope="col">등록일</th>
				
				
			</tr>
		</thead>
		<tbody role="form" method="post" action="/">
		<c:forEach var="qna_vo" items="${qna_list}">
			<tr>
				<th scope="row"><c:out value="${qna_vo.seq}"/></th>
				<td class="subject" style="float:left;">
				<%-- <a href="/dbmon/qnaBoardView?no=${qna_list.no}"> --%>
				<c:out value="${qna_vo.subject}"/></a></td>
				<td><c:out value="${qna_vo.userid}"/></td>
				<td><fmt:formatDate value="${qna_vo.writedate}" pattern="yyyy-MM-dd"/></td>
				
			</tr>
			</c:forEach>
		</tbody>
	</table>
            

              </div>
              <!-- ====================== 돌봄몬회원====================== -->
              <div class="tab-pane fade" id="asd">
               	<table class="table table-hover">
		<colgroup>
			<col style="width: 10%;">
			<col>
			<col style="width: 12%;">
			<col style="width: 15%;">
			<col style="width: 10%;">
			
		</colgroup>
		<thead>
			<tr>
				<th scope="col">글번호</th>
				<th scope="col">글제목</th>
				<th scope="col">작성자</th>
				<th scope="col">등록일</th>
				<th scope="col">조회수</th>
				
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">1</th>
				<td class="subject"><a href="noticeBoardView">공지사항11111111111111</a></td>
				<td>관리자</td>
				<td>13:11</td>
				<td>1</td>
			</tr>
			<tr>
				<th scope="row">2</th>
				<td>공지사항2222222</td>
				<td>관리자</td>
				<td>11-11 15:11</td>
				<td>2</td>
				
			</tr>
			<tr>
				<th scope="row">3</th>
				<td>글제목입니다3333333</td>
				<td>관리자</td>
				<td>11-10 13:51</td>
				<td>7</td>
				
			</tr>
			<tr>
				<th scope="row">4</th>
				<td>공지사항4444444</td>
				<td>관리자</td>
				<td>11-10 13:51</td>
				<td>7</td>
				
			</tr>
			<tr>
				<th scope="row">5</th>
				<td>공지사항5555555</td>
				<td>관리자</td>
				<td>11-10 13:51</td>
				<td>7</td>
				
			</tr>
		</tbody>
	</table>
              </div>
              <div class="tab-pane fade" id="zxc">
                  	<table class="table table-hover">
		<colgroup>
			<col style="width: 10%;">
			<col>
			<col style="width: 12%;">
			<col style="width: 15%;">
			<col style="width: 10%;">
			
		</colgroup>
		<thead>
			<tr>
				<th scope="col">글번호</th>
				<th scope="col">글제목</th>
				<th scope="col">작성자</th>
				<th scope="col">등록일</th>
				<th scope="col">조회수</th>
				
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">1</th>
				<td class="subject"><a href="noticeBoardView">공지사항11111111111111</a></td>
				<td>관리자</td>
				<td>13:11</td>
				<td>1</td>
			</tr>
			<tr>
				<th scope="row">2</th>
				<td>공지사항2222222</td>
				<td>관리자</td>
				<td>11-11 15:11</td>
				<td>2</td>
				
			</tr>
			<tr>
				<th scope="row">3</th>
				<td>글제목입니다3333333</td>
				<td>관리자</td>
				<td>11-10 13:51</td>
				<td>7</td>
				
			</tr>
			<tr>
				<th scope="row">4</th>
				<td>공지사항4444444</td>
				<td>관리자</td>
				<td>11-10 13:51</td>
				<td>7</td>
				
			</tr>
			<tr>
				<th scope="row">5</th>
				<td>공지사항5555555</td>
				<td>관리자</td>
				<td>11-10 13:51</td>
				<td>7</td>
				
			</tr>
		</tbody>
	</table>
              </div>
            </div>
        </div>
      </div>
    </div>
    <hr/>