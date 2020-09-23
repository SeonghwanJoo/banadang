<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${!empty user_id }">
<div class="row blank_div"></div>
<div class="row">
	<div class="bottom_menu">
		<div class="tab-row">
			<div class="col">
				<a class="menu-item" href="${pageContext.request.contextPath }/main/main.do">
				<span class="main material-icons bottom-icon">home</span>
				<span class="main bottom-icon-txt">홈</span>
				</a>
			</div>
			<div class="col">
				<a class="menu-item" href="${pageContext.request.contextPath }/club/club.do">
				<span class="club material-icons bottom-icon">groups</span>
				<span class="club bottom-icon-txt">팀 관리</span>
				</a>
			</div>
			<div class="col">
				<a class="menu-item" href="${pageContext.request.contextPath }/match/match_toInvite.do">
				<span class="invite material-icons bottom-icon">sports_soccer</span>
				<span class="invite bottom-icon-txt">상대팀 매칭</span>
				</a>
			</div>
			<div class="col">
				<a class="menu-item" href="${pageContext.request.contextPath }/match/join.do">
				<span class="join material-icons bottom-icon">person_add</span>
				<span class="join bottom-icon-txt">용병 모집</span>
				</a>
			</div>
			<div class="col">
				<a href="javascript:void(0);" class="menu-item" onclick="openNav()">
				<span class="myPage material-icons bottom-icon">more_horiz</span>
				<span class="myPage bottom-icon-txt"></span>
				</a>
			</div>
		</div>
	</div>
</div>
</c:if>
 <!-- The overlay -->
<div id="myNav" class="overlay">
	<!-- Button to close the overlay navigation -->
	<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>

	<!-- Overlay content -->
	<div class="overlay-content">
		  <c:if test="${empty user_id }">
			  <a href="${pageContext.request.contextPath}/member/login.do">회원가입</a>
			  <a href="${pageContext.request.contextPath}/member/login.do">로그인</a>
		  </c:if>
		  <c:if test="${!empty user_id}">
			  <a href="#myPage.do">마이페이지</a>
			  <a href="#recruit.do">팀원 모집</a>
			  <a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a>
		  </c:if>
	</div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

function openNav() {
  document.getElementById("myNav").style.width = "70%";
  document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
  if(document.getElementById("carousel-indicator")){
	  document.getElementById("carousel-indicator").style.display="none";
  }
  
}

function closeNav() {
  document.getElementById("myNav").style.width = "0%";
  document.body.style.backgroundColor = "white";
  if(document.getElementById("carousel-indicator")){
  	document.getElementById("carousel-indicator").style.display="";
  }
}
	$(function(){
		if( ${ title eq 'BANADANG'}){
			$('.main').css('color','black');
		}else if(${title eq '경기 매치'}){
			$('.invite').css('color','black');
		}else if(${title eq '용병 모집'}){
			$('.join').css('color','black');
		}else if(${title eq '팀 관리'}){
			$('.club').css('color','black');
		}else if(${title eq 'My BANADANG'}){
			$('.myPage').css('color','black');
		}
		
	});
</script>
