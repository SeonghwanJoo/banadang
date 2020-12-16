<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:if test="${!empty myClubs }">
<span class="margin-top disp-bl bold margin-left" >우리팀을 선택하세요</span>
<div class="invite-wrapper" id="invite-wrapper">
 	<ul class="ul-list non-border-btm">
 		<c:forEach items="${myClubs }" var="myClub">
		<li class="select li-list gray" onclick="location.href='${pageContext.request.contextPath}/club/manageClub.do?club_num=${myClub.club_num}'">
			<div class="row">
				<div class="col club_main">
					<c:if test="${myClub.filename ne 'undefined' }">
					<img src="imageView.do?club_num=${myClub.club_num}" alt="Avatar" class="avatar emblem">
					</c:if>
					<c:if test="${myClub.filename eq 'undefined'}">
					<img src="${pageContext.request.contextPath }/resources/images/blank_emblem.png" alt="Avatar" class="avatar emblem">
					</c:if>
					<span class="disp-inbl margin-top">${myClub.club_name }</span><br>
				</div>
				<div class="col club_sub">
					<span class="disp-inbl margin-top">${myClub.club_address}</span>
				</div>
			</div>
		</li>
		</c:forEach>
	</ul>
</div>
<div class="mid-banner">
	<ins class="kakao_ad_area" style="display:none;" 
	 data-ad-unit    = "DAN-gCSwQUEFuriXnEOA" 
	 data-ad-width   = "320" 
	 data-ad-height  = "100"></ins>
 </div>
<script type="text/javascript" src="//t1.daumcdn.net/kas/static/ba.min.js" async></script>
</c:if>
<c:if test="${empty myClubs }">
<!-- The Modal -->
<div id="toast" class="submit_toast">
  <!-- Modal content -->
    <div id="submit_toast_content" class="submit_toast_content">
		<div class="row centered margin-btm centered-padding">
			<span id="club_msg">소속팀이 없습니다.</span>
		</div>
		<div class="row margin-top centered">
			<div class="col">
				<button class="alert-btn border-right" id="confirm">닫기</button>
			</div>
			<div class="col">
				<button class="alert-btn yellow" id="create">팀 만들기</button>
			</div>
		</div>
	</div>
</div>
<!-- The Modal -->
</c:if>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function(){
		$("#toast").css("display","block");
		$("#confirm").click(function(){
			$("#toast").css("display","none");
		});
		$('#create').click(function(){
			location.href='createClubForm.do';
		});
	});

</script>



