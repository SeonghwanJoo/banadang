<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="topnav" id=myTopnav>

  <!-- Centered link -->
  <div class="topnav-centered">
    <a href="#home" class="active">BANADANG</a>
  </div>

  <!-- Left-aligned links (default) -->
  <!-- Use any element to open/show the overlay navigation menu -->
  <!-- <span style="color:#689f38; font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span> -->
  <c:if test="${empty user_id }">
  <a href="#login.do">회원가입</a>
  <a href="#login.do">로그인</a>
  </c:if>
  <c:if test="${!empty user_id}">
   <a href="#myPage.do">마이페이지</a>
   <a href="#recruit.do">팀원 모집</a>
   <a href="#logout.do">로그 아웃</a>
  </c:if>
  <a href="javascript:void(0);" class="icon" onclick="openNav()">
    <i class="fa fa-bars"></i>
  </a>

  <!-- Right-aligned links -->
  <div class="topnav-right">
    <a href="#about">About</a>
  </div>

</div>
<script>
function openNav() {
  document.getElementById("myNav").style.width = "70%";
  document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
}

function closeNav() {
  document.getElementById("myNav").style.width = "0%";
  document.body.style.backgroundColor = "white";
}
</script>






