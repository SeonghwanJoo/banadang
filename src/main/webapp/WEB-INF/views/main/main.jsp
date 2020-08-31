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
		<span class="title-btw">Coming matches</span>
		<button class="btn_write" onclick="location.href='${pageContext.request.contextPath}/match/writeForm.do'">
			<span>매치 작성</span> <span class="material-icons">create</span>
		</button>
		<br class="end">
</div>
<c:if test="${not empty match_list }">
<c:forEach var="match" items="${match_list}">
	<ul class="match-list">
		<li class="match">${match.start_time }~${match.end_time }
			${match.address} ${match.type}<br> ${match.home_name }(${match.home_perform}/${match.home_manner})
			vs. ${match.away_name }(${match.away_perform}/${match.away_manner})
			참석 <span class="vote-rating">
				<span style="width:${home_attend}/${home_voted}%"></span>
			</span><br>
			불참 <span class="vote-rating">
				<span style="width:${home_absent}/${home_voted}%"></span>
			</span><br>
			미정 <span class="vote-rating">
				<span style="width:${home_undefined}/${home_undefined}%"></span>
			</span><br>
			<div class="row">
				<div class="btn-group btn-group-toggle col-sm-12"
					data-toggle="buttons">
					<label class="btn btn-light active"> <input type="radio"
						name="vote" id="attend" value="1"> 참석
					</label> <label class="btn btn-light"> <input type="radio"
						name="vote" id="absent" value="2"> 불참
					</label> <label class="btn btn-light"> <input type="radio"
						name="vote" id="undefined" value="3"> 미정
					</label>
				</div>
			</div>
		</li>
	</ul>
</c:forEach>
</c:if>
</c:if>








