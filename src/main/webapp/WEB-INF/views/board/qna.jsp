<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="fixed_top">
	<a href="javascript:location.href='${pageContext.request.contextPath }/member/myPage.do'">
	<span class="material-icons" id="cancel">close</span>
	</a>
	<div class="topnav-centered inner">
		<span class="active">
			<c:if test="${empty fromUser }">	
				${title }
			</c:if>
			<c:if test="${not empty fromUser }">	
				나의 문의사항
			</c:if>
		</span>
	</div>
	<c:if test="${mem_auth==2 && empty fromUser}">
	<div class="topnav-right">
		<a id="write" href="${pageContext.request.contextPath }/board/writeQna.do">
			<i class="fas fa-pen down"></i>
		</a>
	</div>
	</c:if>
</div>
<div class="blank_div"></div>
<ul class="ul-list">
	<c:if test="${not empty boards}">
	<c:forEach items="${boards }" var="board">
	<li class="li-list cursor" onclick="location.href='qnaDetail.do?qna_num=${board.qna_num}'">
		<div class="row">
			<span class="small-font gray bold">${board.register_date }</span>
		</div>
		<div class="row">
			<span class="">${board.title}</span>
		</div>
	</li>
	</c:forEach>
	</c:if>
</ul>
<c:if test="${empty fromUser}">
<ul class="ul-list">
	<li class="li-list">
		<div class="row">
			<h6 class="mod-h6 margin-top align-center">원하시는 답변을 찾지 못하셨나요?</h6><br>
		</div>
		<br>
		<div class="row">
			<span class="span-link margin-btm align-center cursor" onclick="location.href='personalQnaWrite.do'">1:1 문의사항 남기기</span>
		</div>
		<br>
		<div class="row">
			<span class="span-link-reverse margin-btm align-center cursor" onclick="location.href='personalQna.do'">1:1 문의사항 답변 보러가기</span>
		</div>
		<c:if test="${mem_auth == 2 }">
			<button class="round-btn white-bg centered margin-top" onclick="location.href='personQnaListAsAdmin.do'">개인 질문 보러가기</button>
		</c:if>
	</li>
</ul>
</c:if>
	
