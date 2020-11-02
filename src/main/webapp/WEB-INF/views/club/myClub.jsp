<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:if test="${!empty myClubs }">
<span>우리팀을 선택하세요</span>
<div class="invite-wrapper" id="invite-wrapper">
 	<ul class="ul-list non-border-btm">
 		<c:forEach items="${myClubs }" var="myClub">
		<li class="select li-list" onclick="location.href='${pageContext.request.contextPath}/club/manageClub.do?club_num=${myClub.club_num}'">
			<div class="row">
				<div class="col club_main">
					<c:if test="${!empty myClub.club_img }">
					<img src="imageView.do?club_num=${myClub.club_num}" alt="Avatar" class="avatar emblem">
					</c:if>
					<c:if test="${empty myClub.club_img }">
					<img src="${pageContext.request.contextPath }/resources/images/blank_emblem.png" alt="Avatar" class="avatar emblem">
					</c:if>
					<span class="club_name">${myClub.club_name }</span><br>
				</div>
				<div class="col club_sub">
					<span id="club_loc">${myClub.club_address}</span>
				</div>
			</div>
		</li>
		</c:forEach>
	</ul>
</div>
</c:if>
<c:if test="${empty myClubs }">
<!-- The Modal -->
<div id="toast" class="submit_toast">
  <!-- Modal content -->
  <div id="submit_toast_content" class="submit_toast_content">
  	<span id="club_msg">소속팀이 없습니다</span>
  	<br><br>확인
  </div>
</div>
<!-- The Modal -->
</c:if>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function(){
		$("#toast").css("display","block");
		$("#submit_toast_content").click(function(){
			$("#toast").css("display","none");
		})
	});

</script>



