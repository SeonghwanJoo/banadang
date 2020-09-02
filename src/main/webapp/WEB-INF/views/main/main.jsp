<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row">
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
<div class="row">
	<c:if test="${empty user_id }">
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
	</c:if>
</div>
<c:if test="${not empty user_id }">
<div class="match-head">
		<span class="title-btw">경기 일정</span>
		<button class="btn_write" onclick="location.href='${pageContext.request.contextPath}/match/writeForm.do'">
			<span>매치 작성</span> <span class="material-icons">create</span>
		</button>
</div>
<hr>
<c:if test="${not empty match_list }">
<c:forEach var="match" items="${match_list}">
	<ul class="match-list">
		<li class="match">
			<div class="match-info">
				<span class="match-item">${match.match_date}</span>
				<span class="match-item">${match.start_time }~${match.end_time }</span>
				<span class="match-item">${match.address}</span>
				<span class="match-item">
					<c:if test="${match.type==1 }">축구</c:if>
					<c:if test="${match.type==2 }">풋살</c:if>
				</span>
			</div>
			<hr>
			<div class="match-info">
				<div class="row">
					<div class="team-info col">
						중마 FC<br>
						매너:2.5
						<span class="star-wrap">
						<span class="star-rating">
							<span style="width:50%"></span>
						</span>
						</span><br>
						실력:2.5
						<span class="star-rating">
							<span style="width:50%"></span>
						</span>
					</div>
					<span class="from-to">VS</span>
					<div class="team-info col">
						중마 FC<br>매너:2.5
						<span class="star-wrap">
						<span class="star-rating">
							<span style="width:50%"></span>
						</span>
						</span><br>
						실력:2.5
						<span class="star-rating">
							<span style="width:50%"></span>
						</span>
					</div>
				</div>
			</div>
			<div class="row">
				<span class="vote-rating">
					<span class="voted" style="width:<%-- ${home_attend}/${home_voted}--%>50%">
						<span class="vote-label">참석</span>
					</span>
					<span class="person material-icons">person</span>
				</span>
			</div>
			<div class="row">
				<span class="vote-rating">
					<span class="voted" style="width:<%-- ${home_absent}/${home_voted}--%>30%">
						<span class="vote-label">불참</span>
					</span>
					<span class="person material-icons">person</span>
				</span>
			</div>
			<div class="row">
				<span class="vote-rating">
					<span class="voted" style="width:<%-- ${home_undefined}/${home_undefined}--%>20%">
						<span class="vote-label">미정</span> 
					</span>
					<span class="person material-icons">person</span>
				</span>
			</div>
			<button class="block" onclick="location.href='voteForm.do?match_num=${match.match_num}'">투표하기</button>
		</li>
			</ul>
</c:forEach>
</c:if>
</c:if>









