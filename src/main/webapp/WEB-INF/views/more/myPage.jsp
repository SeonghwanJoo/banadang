<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<ul class="ul-list">
	<li class="li-list">
		<div class="row">
			<div class="col">
				<img src="${member.thumbnail_image }" alt="Avatar" class="avatar">
				<span>${member.nickname }  </span>
				<c:if test="${not empty member.age_range }">
				<span> | ${fn:substring(member.age_range,0,1)}0대</span>
				</c:if>
				<br>
				<span>${member.email }</span>
			</div>
			<div class="col">
				<button class="sync" onclick="location.href='${pageContext.request.contextPath}/member/kakaoSync.do'">
					<img src="${pageContext.request.contextPath }/resources/images/kakao-logo.jpg">
					<span class="sync-text">카카오 프로필 동기화</span>
					<span class="material-icons sync-icon">sync</span>
				</button>
			</div>
		</div>
	</li>
</ul>
<ul class="ul-list">
	<li class="li-list cursor" onclick="location.href='myRecruitReq.do'">
		<div class="row">
			<div class="col">
				<i class="fas fa-user-plus"></i>
				<span>나의 용병 신청 현황</span>
			</div>
		</div>
	</li>
	<li class="li-list cursor" onclick="location.href='myClubRecruitReq.do'">
		<div class="row">
			<div class="col">
				<i class="fas fa-users"></i>
				<span>나의 팀 가입 신청 현황</span>
			</div>
		</div>
	</li>
</ul>
<ul class="ul-list">
	<li class="li-list cursor" onclick="location.href='clubRecruit.do'">
		<div class="row">
			<div class="col">
				<i class="far fa-futbol"></i>
				<span>팀원 모집</span>
			</div>
		</div>
	</li>
	<li class="li-list">
		<div class="row">
			<div class="col">
				<i class="fas fa-share-alt"></i>
				<span>앱 공유</span>
			</div>
		</div>
	</li>
	<li class="li-list cursor" onclick="location.href='${pageContext.request.contextPath}/board/notice.do'">
		<div class="row">
			<div class="col">
				<i class="fas fa-bullhorn"></i>
				<span>공지 사항</span>
			</div>
		</div>
	</li>
	<li class="li-list cursor" onclick="location.href='${pageContext.request.contextPath}/board/qna.do'">
		<div class="row">
			<div class="col">
				<i class="fas fa-headset"></i>
				<span>자주 묻는 질문</span>
			</div>
		</div>
	</li>
	<li class="li-list">
		<div class="row">
			<div class="col">
				<i class="fas fa-cog"></i>
				<span>앱 설정</span>
			</div>
		</div>
	</li>
</ul>
<ul class="ul-list">
	<li class="li-list">
		<div class="row">
			<div class="col">
				<a href="${pageContext.request.contextPath}/member/logout.do">
				<span>로그아웃</span>
				</a>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<span class="red">서비스 탈퇴</span>
			</div>
		</div>
	</li>
</ul>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

</script>
