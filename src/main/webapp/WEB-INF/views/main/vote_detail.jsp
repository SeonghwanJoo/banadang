<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="row" id="top_wrap">
	<div class="fixed_top">
		<a onclick="location.href=document.referrer">
		<span class="material-icons" id="cancel" >close</span>
		</a>
		<div class="topnav-centered-form">
			<a href="#home" class="active">${match.home_name } VS ${match.away_name}</a>
		</div>
	</div>
</div>
<div class="tab-row vote_wrapper">
	<div class="tab-col">
		<button class="tab-btn tab-active" onclick="openTap(event,'voted-detail')">투표자 현황</button>
	</div>
	<div class="tab-col">
		<button class="tab-btn" onclick="openTap(event,'not-voted')">미투표자</button>
	</div>
</div>
<div id="voted-detail" class="tab_detail" style="display:block">
	<div class="detail_wrapper">
		<c:if test="${!empty atdance }">
		<div class="list">
			<div class="col"><span>참석 : ${fn:length(atdance)}</span></div>
			<hr class="hr">
			<div class="row">
				<c:forEach items="${atdance }" var="atdance">
					<div class="detail-item col-sm-6 col-lg-3">
						<img src="${atdance.thumbnail_image }" alt="Avatar" class="avatar">
						<span>${atdance.nickname}</span>
					</div>
				</c:forEach>
			</div>
		</div>
		</c:if>
		<c:if test="${empty atdance }">
		<div class="list">
			<div class="col"><span>참석 : 0</span></div>
			<hr class="hr">
			<div class="detail-item">
			아직 투표한 사람이 없습니다</div>
		</div>
		</c:if>
	</div>
	<div class="detail_wrapper">
		<c:if test="${!empty no_atdance }">
		<div class="list">
			<div class="col"><span>불참 : ${fn:length(no_atdance)}</span></div>
			<hr class="hr">
			<div class="row">
				<c:forEach items="${no_atdance }" var="no_atdance">
					<div class="detail-item col-sm-6 col-lg-3">
						<img src="${no_atdance.thumbnail_image }" alt="Avatar" class="avatar">
						<span>${no_atdance.nickname}</span>
					</div>
				</c:forEach>
			</div>
		</div>
		</c:if>
		<c:if test="${empty no_atdance }">
		<div class="list">
			<div class="col"><span>불참 : 0</span></div>
			<hr class="hr">
			<div class="detail-item">
			아직 투표한 사람이 없습니다</div>
		</div>
		</c:if>
	</div>
	<div class="detail_wrapper">
		<c:if test="${!empty undefined_atdance }">
		<div class="list">
			<div class="col"><span>미정 : ${fn:length(undefined_atdance)}</span></div>
			<hr class="hr">
			<div class="row">
				<c:forEach items="${undefined_atdance }" var="undefined_atdance">
					<div class="detail-item col-sm-6 col-lg-3">
						<img src="${undefined_atdance.thumbnail_image }" alt="Avatar" class="avatar">
						<span>${undefined_atdance.nickname}</span>
					</div>
				</c:forEach>
			</div>
		</div>
		</c:if>
		<c:if test="${empty undefined_atdance }">
		<div class="list">
			<div class="col"><span>미정 : 0</span></div>
			<hr class="hr">
			<div class="detail-item">
			아직 투표한 사람이 없습니다</div>
		</div>
		</c:if>
	</div>
</div>
<div id="not-voted" class="tab_detail" style="display:none">
	<div class="detail_wrapper">
		<c:if test="${!empty not_voted }">
		<div class="list">
			<div class="col"><span>미투표자 : ${fn:length(not_voted)}</span></div>
			<hr class="hr">
			<div class="row">
				<c:forEach items="${not_voted }" var="not_voted">
					<div class="detail-item col-sm-6 col-lg-3">
						<img src="${not_voted.thumbnail_image }" alt="Avatar" class="avatar">
						<span>${not_voted.nickname}</span>
					</div>
				</c:forEach>
			</div>
		</div>
		</c:if>
		<c:if test="${empty not_voted }">
		<div class="list">
			<div class="detail-item">
			모두 투표를 완료했습니다</div>
		</div>
		</c:if>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function openTap(evt,tap){
	$('.tab_detail').css('display','none');
	$('.tab-btn').removeClass(' tab-active');
	var tap=document.getElementById(tap);
	tap.style.display="block";
	evt.currentTarget.className += " tab-active";
}
</script>





