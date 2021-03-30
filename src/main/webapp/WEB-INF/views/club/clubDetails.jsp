<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="row" id="top_wrap">
	<div class="fixed_top">
		<a onclick="javascript:history.go(-1);">
		<span class="material-icons" id="chevron_left" >chevron_left</span>
		</a>
		<div class="topnav-centered">
			<span class="active cursor">${title }</span>
		</div>
	</div>
</div>
<div class="blank_div"></div>
<div class="invite-wrapper" id="invite-wrapper">
 	<ul class="ul-list">
		<li class="li-list">
			<div class="row small-font ">
				<div class="col club_main nowrap">
					<c:if test="${club.filename ne 'undefined' }">
					<img src="imageView.do?club_num=${club.club_num}" alt="Avatar" class="avatar emblem">
					</c:if>
					<c:if test="${club.filename eq 'undefined' }">
					<img src="${pageContext.request.contextPath }/resources/images/blank_emblem.png" alt="Avatar" class="avatar emblem">
					</c:if>
					<span class="club_name">${club.club_name }</span><br>
					<span>${club.club_address }</span>
				</div>
				<div class="col nowrap">
					<span class="">
						연령대 <span class="xs-font margin-left">${club.club_age }</span>
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
			<span class="rating_count">총 <span class="point">${club.rating_count }</span> 명의 평가</span>
			<div class="row small-font ">
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
		<c:if test="${not empty club.club_detail }">
		<li class="li-list">
			<p class="detail padding">${club.club_detail }</p>
		</li>
		</c:if>
	</ul>
	<div class="tab-row" id="tab-row">
		<div class="tab-col">
			<button class="tab-btn small-font bold " id="mangers-btn" onclick="openTap(event,'managers')">팀 운영진</button>
		</div>
		<div class="tab-col">
			<button class="tab-btn small-font bold " id="records-btn" onclick="openTap(event,'records')">상대팀 평가 내역</button>
		</div>
	</div>
	<div class="tab_detail" id="records">
		<ul class="ul-list non-border-btm">
			<c:if test="${not empty ratings }">
			<c:forEach items="${ratings }" var="rating">
			<li class="li-list">
				<span class="small-font gray">${fn:substring(rating.nickname, 0, 1) }****</span>
				<div class="main-row">
					<span class="match-item"><i class="far fa-calendar-alt margin-right"></i><fmt:formatDate value="${rating.match_date}" pattern="yy.MM.dd"/></span>
					<span class="match-item">${rating.address}</span>
				</div>
				<div class="row small-font ">
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
						<fmt:formatNumber value="${rating.perform*2}" pattern="0.0" />
					</div>
				</div>
				<c:if test="${not empty rating.rating_detail }">
				<div class="row">
					<div class="col margin-top">
						<p class="detail padding">${rating.rating_detail }</p>
					</div>
				</div>
				</c:if>
			</li>
			</c:forEach>
			</c:if>
		</ul>
	</div>
	<div class="tab_detail" id="managers">
		<div class="row margin-m-top">
		<c:forEach items="${members }" var="member">
			
				<div class="detail-item col-12 col-lg-6 centered">
					<div class="half_col m-bigger nowrap">
						<div class="relative disp-inbl float-left">
							<c:if test="${empty member.thumbnail_image }">
							<img src="${pageContext.request.contextPath }/resources/images/profile.png" alt="Avatar" class="avatar">
							</c:if>
							<c:if test="${not empty member.thumbnail_image }">
							<img src="${member.thumbnail_image }" alt="Avatar" class="avatar">
							</c:if>
							<i class="fas fa-crown admin visible" id="${member.id}"></i>
						</div>
						<span>
						${member.nickname} | <span class="gray small-font">가입일 <fmt:formatDate value="${member.join_date}" pattern="yy.MM.dd"/> </span>
						</span>
						<br>
						<c:if test="${not empty member.age_range }">
						<span class="gray small-font">${fn:substring(member.age_range,0,1)}0대</span>
						</c:if>
						<c:if test="${empty member.age_range }">
						<span class="gray small-font">비공개</span>
						</c:if>
					</div>
					<div class="half_col m-smaller">
						<div class="centered column cursor" onclick="location.href='${pageContext.request.contextPath}/member/writeMsg.do?&club_num=${club.club_num }&id=${member.id}'">
							<span class="blue material-icons disp-bl">
							forum
							</span>
							<span class="xs-font gray disp-bl">
								1:1 메시지
							</span>
						</div>
					</div>
				</div>
		</c:forEach>
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

function openTap(evt,tab){
	$('.tab_detail').css('display','none');
	$('.tab-btn').removeClass(' tab-active');
	var tap=document.getElementById(tab);
	tap.style.display="block";
	evt.currentTarget.className += " tab-active";
}
function blockTap(blockedTap) {
	$('.tab_detail').css('display','none');
	$('.tab-btn').removeClass(' tab-active');
	var tap=document.getElementById(blockedTap);
	tap.style.display="block";
	document.getElementById(blockedTap+'-btn').className +=' '+ 'tab-active';
}
window.onscroll=function(){myFunction()};
var tab=document.getElementById("tab-row");
var sticky=tab.offsetTop;
function myFunction(){
	if(window.pageYOffset+58 >=sticky){
		tab.classList.add("sticky");
	}else{
		tab.classList.remove("sticky");
	}
}

$(function(){
	if (${club.club_color eq 'rgb(0, 0, 0)'}){
		$(".color").css("border","1px solid #fff");
	}
	blockTap('records');
	
});

</script>

