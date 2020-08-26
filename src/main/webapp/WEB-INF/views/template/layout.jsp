<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title"/></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
@import url('https://fonts.googleapis.com/css2?family=Russo+One&display=swap');
</style>
<!-- Google icon -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
<div id="main">
	<div id="main_header">
		<tiles:insertAttribute name="header"/>
	</div>
	<div id="main_body">
		<tiles:insertAttribute name="body"/>
	</div>
	<div id="main_footer">
		<tiles:insertAttribute name="footer"/>
	</div>
</div>
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


<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</div>	
</body>
</html>




