<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="row" id="top_wrap">
	<div class="fixed_top">
		<a href="javascript:location.href=document.referrer" >
		<span class="material-icons" id="cancel">close</span>
		</a>
		<div class="topnav-centered">
			<a href="javascript:location.reload()" class="active cursor">${title }</a>
		</div>
	</div>
</div>
<div class="blank_div"></div>
<ul class="ul-list">
	<c:if test="${not empty matches }">
	<c:forEach items="${matches }" var="match">
	<li class="li-list">
		<div class="row">
			<span class="match-item">${match.match_date }</span>
			<span class="match-item">${match.start_time } ~ ${match.end_time }</span>
			<span class="match-item">${match.address }</span>
			<c:if test="${match.type==1 }">
			<span class="match-item">축구</span>
			</c:if>
			<c:if test="${match.type==2 }">
			<span class="match-item">풋살</span>
			</c:if>
			<c:if test="${match.recruit_accept==1 }">
			<span id="status-${recruit_req_num}"class="status neutral">대기 중</span>
			</c:if>
			<c:if test="${match.recruit_accept==2 }">
			<span id="status-${recruit_req_num}"class="status positive">수락 완료</span>
			</c:if>
			<c:if test="${match.recruit_accept==3 }">
			<span id="status-${recruit_req_num}"class="status negative">거절 완료</span>
			</c:if>
		</div>
		<div class="row">
			<div class="col club_main">
				<c:if test="${empty match.club_img }">
				<img src="${pageContext.request.contextPath }/resources//resources/images/blank_emblem.png" class="avatar emblem">
				</c:if>
				<c:if test="${not empty match.club_img}">
				<img src="${pageContext.request.contextPath }/club/imageView.do?club_num=${match.club_num}" class="avatar emblem">
				</c:if>
				<span class="club_name">${match.club_name } | ${fn:toUpperCase(match.recruit_position)}</span>
				<br>
				<span class="uniform">
					유니폼
					<c:if test="${not empty match.club_color }">
						<span class="color" style="background-color:${match.club_color}"></span>
					</c:if>
					<c:if test="${empty match.club_color }">
						&nbsp;미정
					</c:if>
				</span>
			</div>
			<div class="col">
				<span class='rating'>매너</span>
					<span class='star-wrap'>
						<span class='star-rating'>
							<span style='width:${match.manner*20 }%'></span>
						</span><fmt:formatNumber value="${match.manner*2}" pattern="0.0"/><br>
				<span class='rating'>실력</span>
					<span class='star-rating'>
						<span style='width:${match.perform*20 }%'></span>
					</span><fmt:formatNumber value="${match.perform*2}" pattern="0.0"/><br>
				</span>
				<span class="age">연령대 ${match.club_age }</span>
			</div>
		</div>
	</li>
	</c:forEach>
	</c:if>
</ul>