<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>  
<div class="topnav" id=myTopnav>

  <!-- Left-aligned links (default) -->
	<c:if test="${title eq '팀원 모집' }">
	<span class="material-icons cursor l-font" style="position:relative;top:0.5rem;left:0.5rem;" onclick="location.href='myPage.do'">close</span>
	</c:if>
	<div class="header-wrapper">
	    <c:if test="${title eq 'main'}">
	    <img src="${pageContext.request.contextPath }/resources/images/logo.jpg" class="header-logo">
	    </c:if>
	    <c:if test="${title ne 'main' }">
	    ${title}
	    </c:if>
    </div>

  <!-- Right-aligned links -->
  <div class="topnav-right">
    <c:if test="${!empty myClub }">
	<span class="sel-team" id="sel-team">
		<span id="myClub_name">${myClub.club_name}</span>
		<span class="drop-down material-icons">
			arrow_drop_down
		</span>
	</span>
	</c:if>
    <a id="write" href="${pageContext.request.contextPath }/match/writeForm.do">
    	<i class="fas fa-edit" id="topIcon"></i>
    	<c:if test="${title eq '나의 페이지' && count_msg!=0 }">
		<span class="count-msg-page">${count_msg }</span>
		</c:if>
    </a>
  </div>
</div>

<!-- The Modal -->
<div id="team-sel-modal" class="modals">
  <!-- Modal content -->
  	
	<div class="modals-content align-center">
	<span class="close_mod">&times;</span>
		<div class="modal-wrapper">
			<h6 class="mod-h6 margin-top">소속팀 설정</h6>
			<c:if test="${!empty myClubs }">
			<c:forEach items="${myClubs }" var="club">
			<hr>
		  	<span onclick="setMyClub(${club.club_num })" class="margin-top bold disp-bl cursor" >${club.club_name }</span>
		  	</c:forEach>
		  	</c:if>
	  	</div>
	</div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	
	function setMyClub(myClub_num){
		$.ajax({
			url:'${pageContext.request.contextPath}/club/setMyClub.do',
			type:'post',
			data:{club_num:myClub_num},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(data){
				//선택한 span의 club_num값을 ajax로 넘겨 컨트롤러에서 myClub객체를 session에 저장한다
				//header의 소속팀의text를 해당클럽이름으로 변경한다
				if(data.result=="set"){
					location.reload();
				}
			},
			error:function(){
				alert("네트워크 오류 발생");
			}
		});
	}
	
	function openNav() {
	  document.getElementById("myNav").style.width = "70%";
	  document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
	}
	
	function closeNav() {
	  document.getElementById("myNav").style.width = "0%";
	  document.body.style.backgroundColor = "white";
	}
	$(function(){
		if(${title eq '팀 관리'}){
			$('#write').attr('href','${pageContext.request.contextPath}/club/createClubForm.do');
		}else if(${title eq '용병 모집'}){
			$('#write').attr('href','${pageContext.request.contextPath}/match/writeRecruit.do');
		}else if(${title eq '나의 페이지'}){
			$('#write').attr('href','${pageContext.request.contextPath}/member/myMsg.do');
			$('#topIcon').removeClass('fas fa-edit');
			$('#topIcon').addClass('fas fa-comment-dots');
		}else if(${title eq '팀원 모집'}){
			$('#write').attr('href','${pageContext.request.contextPath}/member/writeClubRecruit.do');
		}
		// Get the modal
		var modal = document.getElementById("team-sel-modal");

		// Get the button that opens the modal
		var team = document.getElementById("sel-team");

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close_mod")[0];

		// When the user clicks the button, open the modal 
		team.onclick = function() {
			modal.style.display = "block";
		}

		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	});
</script>







