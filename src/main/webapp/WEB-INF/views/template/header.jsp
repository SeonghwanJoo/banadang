<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>  
<div class="topnav" id=myTopnav>
  <!-- Centered link -->
  <div class="topnav-centered">
    <a href="javascript:location.reload()" id="top-anchor" class="active">${title}</a>
  </div>

  <!-- Left-aligned links (default) -->
	<c:if test="${!empty myClub }">
	<span class="sel-team" id="sel-team">
		<span id="myClub_name">${myClub.club_name}</span>
		<span class="drop-down material-icons">
			arrow_drop_down
		</span>
	</span>
	</c:if>

  <!-- Right-aligned links -->
  <div class="topnav-right">
    <a id="write" href="${pageContext.request.contextPath }/match/writeForm.do">
    	<i class="fas fa-edit"></i>
    </a>
  </div>
</div>

<!-- The Modal -->
<div id="team-sel-modal" class="modals">
  <!-- Modal content -->
  	
	<div class="modals-content">
	<span class="close_mod">&times;</span>
		<h6 class="mod-h6">소속팀 설정</h6>
		<c:if test="${!empty myClubs }">
		<c:forEach items="${myClubs }" var="club">
		<hr class="hr">
	  	<span onclick="setMyClub(this)" class="set-team-opt" data-club="${club.club_num }">${club.club_name }</span>
	  	</c:forEach>
	  	</c:if>
	</div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	
	function setMyClub(myClub){
		var myClub_num=myClub.getAttribute("data-club");
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







