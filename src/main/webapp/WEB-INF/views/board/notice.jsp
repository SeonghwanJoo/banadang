<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="fixed_top">
	<a href="javascript:location.href='${pageContext.request.contextPath }/member/myPage.do'">
	<span class="material-icons" id="cancel">close</span>
	</a>
	<div class="topnav-centered inner">
		<span class="active">${title }</span>
	</div>
	<c:if test="${mem_auth==2 }">
	<div class="topnav-right">
		<a id="write" href="${pageContext.request.contextPath }/board/writeNotice.do">
			<i class="fas fa-pen down"></i>
		</a>
	</div>
	</c:if>
</div>
<div class="blank_div"></div>
<ul class="ul-list non-border-btm">
	<c:if test="${not empty boards}">
	<c:forEach items="${boards }" var="board">
	<li class="li-list cursor" onclick="location.href='noticeDetail.do?notice_num=${board.notice_num}'">
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