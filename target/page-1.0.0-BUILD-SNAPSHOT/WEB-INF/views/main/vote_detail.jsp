<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="row" id="top_wrap">
	<div class="fixed_top">
		<c:if test="${isMain }">
		<a href="${pageContext.request.contextPath}/main/main.do">
			<span class="material-icons" id="cancel" >close</span>
		</a>
		</c:if>
		<c:if test="${!isMain }">
		<a href="${pageContext.request.contextPath}/club/manageClub.do?club_num=${myClub.club_num}">
			<span class="material-icons" id="cancel" >close</span>
		</a>
		</c:if>
		<div class="topnav-centered">
			<span class="active small-font">
			<c:if test="${empty match.home_name }">
				삭제된 팀
			</c:if>
			<c:if test="${not empty match.home_name }">
			${match.home_name }
			</c:if>
			 VS 
			  ${match.away_name}
			</span>
		</div>
	</div>
</div>
<div class="blank_div"></div>
<div class="tab-row">
	<div class="tab-col">
		<button class="tab-btn tab-active" onclick="openTap(event,'voted-detail')">투표자 현황</button>
	</div>
	<div class="tab-col">
		<button class="tab-btn" onclick="openTap(event,'not-voted')">미투표자</button>
	</div>
</div>
<div id="voted-detail" class="tab_detail" style="display:block">
	<ul class="ul-list">
		<c:if test="${!empty atdance }">
		<li class="li-list">
			<div class="col">참석 : <span class="point">${fn:length(atdance)}</span></div>
			<hr class="hr">
			<div class="row">
				<c:forEach items="${atdance }" var="atdance">
					<div class="detail-item  col-6 col-lg-3 nowrap">
						<c:if test="${empty atdance.thumbnail_image }">
						<img src="${pageContext.request.contextPath }/resources/images/profile.png" alt="Avatar" class="avatar">
						</c:if>
						<c:if test="${not empty atdance.thumbnail_image }">
						<img src="${atdance.thumbnail_image }" alt="Avatar" class="avatar">
						</c:if>
						<span class="disp-inbl margin-top">${atdance.nickname}</span>
					</div>
				</c:forEach>
			</div>
		</li>
		</c:if>
		<c:if test="${empty atdance }">
		<li class="li-list">
			<div class="col">참석 : <span class="point">0</span></div>
			<hr class="hr">
			<div class="detail-item">
			아직 투표한 사람이 없습니다</div>
		</li>
		</c:if>
	</ul>
	<ul class="ul-list">
		<c:if test="${!empty no_atdance }">
		<li class="li-list">
			<div class="col">불참 : <span class="point">${fn:length(no_atdance)}</span></div>
			<hr class="hr">
			<div class="row">
				<c:forEach items="${no_atdance }" var="no_atdance">
					<div class="detail-item col-6 col-lg-3 nowrap">
						<c:if test="${empty no_atdance.thumbnail_image }">
						<img src="${pageContext.request.contextPath }/resources/images/profile.png" alt="Avatar" class="avatar">
						</c:if>
						<c:if test="${not empty no_atdance.thumbnail_image }">
						<img src="${no_atdance.thumbnail_image }" alt="Avatar" class="avatar">
						</c:if>
						<span class="disp-inbl margin-top">${no_atdance.nickname}</span>
					</div>
				</c:forEach>
			</div>
		</li>
		</c:if>
		<c:if test="${empty no_atdance }">
		<li class="li-list">
			<div class="col">불참 : <span class="point">0</span></div>
			<hr class="hr">
			<div class="detail-item">
			아직 투표한 사람이 없습니다</div>
		</li>
		</c:if>
	</ul>
	<ul class="ul-list non-border-btm">
		<c:if test="${!empty undefined_atdance }">
		<li class="li-list">
			<div class="col">미정 : <span class="point">${fn:length(undefined_atdance)}</span></div>
			<hr class="hr">
			<div class="row">
				<c:forEach items="${undefined_atdance }" var="undefined_atdance">
					<div class="detail-item  col-6 col-lg-3 nowrap">
						<c:if test="${empty undefined_atdance.thumbnail_image }">
						<img src="${pageContext.request.contextPath }/resources/images/profile.png" alt="Avatar" class="avatar">
						</c:if>
						<c:if test="${not empty undefined_atdance.thumbnail_image }">
						<img src="${undefined_atdance.thumbnail_image }" alt="Avatar" class="avatar">
						</c:if>
						<span class="disp-inbl margin-top nowrap">${undefined_atdance.nickname}</span>
					</div>
				</c:forEach>
			</div>
		</li>
		</c:if>
		<c:if test="${empty undefined_atdance }">
		<li class="li-list">
			<div class="col">미정 : <span class="point">0</span></div>
			<hr class="hr">
			<div class="detail-item">
			아직 투표한 사람이 없습니다</div>
		</li>
		</c:if>
	</ul>
</div>
<div id="not-voted" class="tab_detail" style="display:none">
	<ul class="ul-list non-border-btm">
		<c:if test="${!empty not_voted }">
		<li class="li-list">
			<div class="col">미투표자 : <span class="point">${fn:length(not_voted)}</span></div>
			<hr class="hr">
			<div class="row">
				<c:forEach items="${not_voted }" var="not_voted">
					<div class="detail-item  col-6 col-lg-3 nowrap">
						<c:if test="${empty not_voted.thumbnail_image }">
						<img src="${pageContext.request.contextPath }/resources/images/profile.png" alt="Avatar" class="avatar">
						</c:if>
						<c:if test="${not empty not_voted.thumbnail_image }">
						<img src="${not_voted.thumbnail_image }" alt="Avatar" class="avatar">
						</c:if>
						<span class="disp-inbl margin-top">${not_voted.nickname}</span>
					</div>
				</c:forEach>
			</div>
		</li>
		</c:if>
		<c:if test="${empty not_voted }">
		<li class="li-list">
			<div class="detail-item">
			모두 투표를 완료했습니다</div>
		</li>
		</c:if>
	</ul>
</div>
<div class="mid-banner">
	<ins class="kakao_ad_area" style="display:none;" 
	 data-ad-unit    = "DAN-gCSwQUEFuriXnEOA" 
	 data-ad-width   = "320" 
	 data-ad-height  = "100"></ins>
</div>
<script type="text/javascript" src="//t1.daumcdn.net/kas/static/ba.min.js" async></script>
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





