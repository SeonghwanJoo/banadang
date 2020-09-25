<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="main-row">
	<div id="demo" class="carousel slide" data-ride="carousel">
	
	  <!-- Indicators -->
	  <ul class="carousel-indicators" id="carousel-indicator">
	    <li data-target="#demo" data-slide-to="0" class="active"></li>
	    <li data-target="#demo" data-slide-to="1"></li>
	    <li data-target="#demo" data-slide-to="2"></li>
	  </ul>
	  
	  <!-- The slideshow -->
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img class="slide-img" src="${pageContext.request.contextPath}/resources/images/5.jpg">
	    </div>
	    <div class="carousel-item">
	      <img class="slide-img" src="${pageContext.request.contextPath}/resources/images/6.jpg">
	    </div>
	    <div class="carousel-item">
	      <img class="slide-img" src="${pageContext.request.contextPath}/resources/images/5.jpg">
	    </div>
	  </div>
	  
	  <!-- Left and right controls -->
	  <a class="carousel-control-prev" href="#demo" data-slide="prev">
	    <span class="carousel-control-prev-icon"></span>
	  </a>
	  <a class="carousel-control-next" href="#demo" data-slide="next">
	    <span class="carousel-control-next-icon"></span>
	  </a>
	</div>
</div>

<c:if test="${empty user_id }">
<div class="main-row">
	<div class="login">
		<p>간편 로그인하고 바나당에서 우리팀을 관리해보세요</p>
		<a
			href="https://kauth.kakao.com/oauth/authorize?
	client_id=0646bcb11e5b9bbdb24fc9153f7693ae
	&redirect_uri=http://localhost:8080/banadang/member/login.do
	&response_type=code">
			<img class="login_btn"
			src="${pageContext.request.contextPath}/resources/images/kakao_login/ko/kakao_login_medium_wide.png">
		</a>
	</div>
</div>
</c:if>

<c:if test="${not empty user_id }">
<div class="match-head">
		<span class="title-btw">경기 일정</span>
		<button class="btn_write" onclick="location.href='${pageContext.request.contextPath}/match/writeForm.do'">
			<span>매치 작성</span> <span class="material-icons">create</span>
		</button>
</div>
<hr class="hr">
<c:if test="${not empty match_list }">
<ul class="match-list">
<c:forEach var="match" items="${match_list}">
	<li class="match">
		<div class="match-info">
			<div class="main-row">
				<span class="match-item">${match.match_date}</span>
				<span class="match-item">${match.start_time }~${match.end_time }</span>
				<a href="https://map.kakao.com/link/to/${match.address },${match.address_y},${match.address_x}" target="_blank">
				<span class="match-item">${match.address}</span>
				</a>
				<span class="match-item">
					<c:if test="${match.type==1 }">축구</c:if>
					<c:if test="${match.type==2 }">풋살</c:if>
				</span>
			</div>
		</div>
		<div class="main-row">
			<div class="team-info col">
				${match.home_name}<br>
				매너 : ${match.home_manner*2}
				<span class="star-wrap">
				<span class="star-rating">
					<span style="width:${match.home_manner*20}%"></span>
				</span>
				</span><br>
				실력 : ${match.home_perform*2}
				<span class="star-rating">
					<span style="width:${match.home_perform*20}%"></span>
				</span>
			</div>
			<span class="from-to">VS</span>
			<div class="team-info col">
			<c:if test="${match.away != 0 }">
				${match.away_name}<br>
				매너 : ${match.away_manner*2}
				<span class="star-wrap">
				<span class="star-rating">
					<span style="width:${match.away_manner*20}%"></span>
				</span>
				</span><br>
				실력 : ${match.away_perform*2}
				<span class="star-rating">
					<span style="width:${match.away_perform*20}%"></span>
				</span>
			</c:if>
			<c:if test="${match.away == 0 }">
				<span>모집중</span>
			</c:if>
			</div>
		</div>
		<!-- 내 팀이 -->
		<div class="main-row">
			<span class="vote-rating">
				<c:if test="${match.attend==0 }">
				<span class="voted" style="background-color:transparent">
					<span class="vote-label">참석</span>
				</span>
				</c:if>
				<c:if test="${match.attend!=0 && match.max==match.attend }">
				<span class="voted" 
					style=
						"width:${match.attend/(match.attend+match.not_attend+match.undefined)*100}%;
						background-color:#A4D3A6;">
					<span class="vote-label">참석</span>
				</span>
				</c:if>
				<c:if test="${match.attend!=0 && match.max!=match.attend }">
				<span class="voted" 
					style=
						"width:${match.attend/(match.attend+match.not_attend+match.undefined)*100}%;
						background-color:#bfbfbf;">
					<span class="vote-label">참석</span>
				</span>
				</c:if>
				<span id="num_attend" class="vote_num">${match.attend}</span>
				<span class="person material-icons">person</span>
			</span>
		</div>	
		<div class="main-row">
			<span class="vote-rating">
				<c:if test="${match.not_attend==0 }">
				<span class="voted" 
					style="background-color:transparent;">
					<span class="vote-label">불참</span>
				</span>
				</c:if>
				<c:if test="${match.not_attend!=0 && match.max==match.not_attend }">
				<span class="voted" 
					style=
						"width:${match.not_attend/(match.attend+match.not_attend+match.undefined)*100}%;
						background-color:#A4D3A6;">
					<span class="vote-label">불참</span>
				</span>
				</c:if>
				<c:if test="${match.not_attend!=0 && match.max!=match.not_attend }">
				<span class="voted" 
					style=
						"width:${match.not_attend/(match.attend+match.not_attend+match.undefined)*100}%;
						background-color:#bfbfbf;">
					<span class="vote-label">불참</span>
				</span>
				</c:if>
				<span id="num_nattend" class="vote_num">${match.not_attend}</span>
				<span class="person material-icons">person</span>
			</span>
		</div>	
		<div class="main-row">
			<span class="vote-rating">
				<c:if test="${match.undefined==0 }">
				<span class="voted" style="background-color:transparent;">
					<span class="vote-label">미정</span>
				</span>
				</c:if>
				<c:if test="${match.undefined!=0 && match.max==match.undefined }">
				<span class="voted" 
					style=
						"width:${match.undefined/(match.attend+match.not_attend+match.undefined)*100}%;
						background-color:#A4D3A6;">
					<span class="vote-label">미정</span>
				</span>
				</c:if>
				<c:if test="${match.undefined!=0 && match.max!=match.undefined }">
				<span class="voted" 
					style=
						"width:${match.undefined/(match.attend+match.not_attend+match.undefined)*100}%;
						background-color:#bfbfbf;">
					<span class="vote-label">미정</span>
				</span>
				</c:if>
				<span id="num_undefined" class="vote_num">${match.undefined}</span>
				<span class="person material-icons">person</span>
			</span>
		</div>
		<c:if test="${match.home!=match.away && match.home==match.club_num}">
		<button class="block" 
			onclick="location.href='voteForm.do?match_num=${match.match_num}&club_num=${match.club_num }'">
			${match.home_name } <c:if test="${ match.status !=0}">다시 투표하기</c:if><c:if test="${match.status ==0 }">투표하기</c:if></button>
		</c:if>
		<c:if test="${match.home!=match.away && match.away==match.club_num}">
		<button class="block" 
			onclick="location.href='voteForm.do?match_num=${match.match_num}&club_num=${match.club_num }'">
			${match.away_name } <c:if test="${match.status !=0 }">다시 투표하기</c:if><c:if test="${match.status ==0 }">투표하기</c:if></button>
		</c:if>
		<c:if test="${match.home==match.away}">
		<button class="block" 
			onclick="location.href='voteForm.do?match_num=${match.match_num}&club_num=${match.club_num }'">
			<c:if test="${match.status !=0 }">다시 투표하기</c:if><c:if test="${match.status ==0 }">투표하기</c:if></button>
		</c:if>
	</li>
	<hr class="hr">
</c:forEach>
</ul>
</c:if>
<div class="match-head">
		<span class="title-btw">지난 경기 상대팀 평점 작성</span>
</div>
<hr class="hr">
<c:if test="${not empty past_match }">
<ul class="match-list">
<c:forEach var="match" items="${past_match}">
<c:if test="${match.home!=match.away && !fn:contains(match.away_name,'미등록팀')}">
<li class="match">
	<div class="match-info">
		<div class="main-row">
			<span class="match-item">${match.match_date}</span>
			<span class="match-item">${match.start_time }~${match.end_time }</span>
			<span class="match-item">${match.address}</span>
			<span class="match-item">
				<c:if test="${match.type==1 }">축구</c:if>
				<c:if test="${match.type==2 }">풋살</c:if>
			</span>
		</div>
	</div>
	<div class="match-info">
		<div class="main-row">
			<div class="team-info col">
				${match.home_name}<br>
				매너 : ${match.home_manner*2}/10
				<span class="star-wrap">
				<span class="star-rating">
					<span style="width:${match.home_manner*20}%"></span>
				</span>
				</span><br>
				실력 : ${match.home_perform*2}/10
				<span class="star-rating">
					<span style="width:${match.home_perform*20}%"></span>
				</span>
			</div>
			<span class="from-to">VS</span>
			<div class="team-info col">
				${match.away_name}<br>
				매너 : ${match.away_manner*2}/10
				<span class="star-wrap">
				<span class="star-rating">
					<span style="width:${match.away_manner*20}%"></span>
				</span>
				</span><br>
				실력 : ${match.away_perform*2}/10
				<span class="star-rating">
					<span style="width:${match.away_perform*20}%"></span>
				</span>
			</div>
		</div>
	</div>
	<c:if test="${match.home==match.club_num}">
	<button class="block" onclick="location.href='ratingForm.do?match_num=${match.match_num}&club_num=${match.away }'">${match.away_name } 평점 작성 하기</button>
	</c:if>
	<c:if test="${match.away==match.club_num }">
	<button class="block" onclick="location.href='ratingForm.do?match_num=${match.match_num}&club_num=${match.home }'">${match.home_name } 평점 작성 하기</button>
	</c:if>
</li>
<hr class="hr"> 
</c:if>
</c:forEach>
</ul>
</c:if>
</c:if>









