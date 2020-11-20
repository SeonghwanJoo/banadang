<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="row" id="top_wrap">
	<div class="fixed_top">
		<a onclick="location.href=document.referrer">
		<span class="material-icons" id="cancel">close</span>
		</a>
		<div class="topnav-centered">
			<a href="javascript:location.reload()" class="active cursor">${title }</a>
		</div>
	</div>
</div>
<div class="blank_div"></div>
<div class="invite-wrapper" id="invite-wrapper">
 	<ul class="ul-list">
		<li class="li-list">
			<div class="row small-font gray">
				<div class="col club_main">
					<c:if test="${!empty club.club_img }">
					<img src="imageView.do?club_num=${club.club_num}" alt="Avatar" class="avatar emblem">
					</c:if>
					<c:if test="${empty club.club_img }">
					<img src="${pageContext.request.contextPath }/resources/images/blank_emblem.png" alt="Avatar" class="avatar emblem">
					</c:if>
					<span class="club_name">${club.club_name }</span><br>
					<span>${club.club_address }</span>
				</div>
				<div class="col">
					<span class="age">
						연령대 ${club.club_age }
					</span><br>
					<span class="uniform">
						유니폼
						<c:if test="${!empty club.club_color }">
						<span class="color" style="background-color:${club.club_color}"></span>
						</c:if>
						<c:if test="${empty club.club_color }">
						미정
						</c:if>
					</span>
				</div>
			</div>
			<span class="rating_count">총 ${club.rating_count }명의 평가</span>
			<div class="row small-font gray">
				<div class="col flex-start">
					<span>매너</span> 
					<span class="star-rating">
						<span style="width:${club.manner*20}%"></span>
					</span><fmt:formatNumber value="${club.manner*2}" pattern="0.0"/>
				</div>
				<div class="col flex-start">
					<span>실력</span>  
					<span class="star-rating">
						<span style="width:${club.perform*20}%"></span>
					</span><fmt:formatNumber value="${club.perform*2}" pattern="0.0"/>
				</div>			
			</div>
		</li>
	</ul>
	<h6 class="middle-title">상대팀의 평가 내역</h6>
	<ul class="ul-list non-border-btm">
		<c:if test="${not empty ratings }">
		<c:forEach items="${ratings }" var="rating">
		<li class="li-list">
			<div class="main-row">
				<span class="match-item"><i class="far fa-calendar-alt margin-right"></i>${rating.match_date}</span>
				<span class="match-item">${rating.address}</span>
				<span>매치의 평가</span>
			</div>
			<div class="row small-font gray">
				<div class="col flex-start">
					<span class='rating'>매너</span>
						<span class='star-rating'><span style='width:${rating.manner*20 }%'></span>
					</span>
					<fmt:formatNumber value="${rating.manner*2}" pattern="0.0" />
				</div>
				<div class="col flex-start">
					<span class='rating'>실력</span>
						<span class='star-rating'><span style='width:${rating.perform*20 }%'></span>
					</span>
					<fmt:formatNumber value="${rating.perform*2}" pattern="0.0" /><br>
				</div>
			</div>
			<div class="row">
				<div class="col margin">
					${rating.rating_detail }
				</div>
			</div>
		</li>
		</c:forEach>
		</c:if>
	</ul>
</div>
