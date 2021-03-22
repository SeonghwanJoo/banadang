<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="row" id="top_wrap">
	<div class="fixed_top">
		<a href="javascript:location.href='${pageContext.request.contextPath }/member/myPage.do'">
		<span class="material-icons" id="cancel">close</span>
		</a>
		<div class="topnav-centered">
			<span class="active">${title }</span>
		</div>
	</div>
</div>
<div class="blank_div"></div>
<ul class="ul-list non-border-btm gray">
	<li class="li-list cursor" onclick="location.href='${pageContext.request.contextPath}/member/logout.do'">
		<div class="row">
			<div class="col">
				<i class="fas fa-sign-out-alt"></i>
				<span>로그아웃</span>
			</div>
		</div>
	</li>
	<li class="li-list cursor" id="unlink">
		<div class="row">
			<div class="col">
				<span class="red">서비스 탈퇴</span>
			</div>
		</div>
	</li>
</ul>
<!-- The Modal -->
<div id="myModals" class="modals">
	<!-- Modal content -->
	<div class="modals-content">
		<span id="close_mod" class="close_mod">&times;</span>
		<span class="m-font bold disp-bl align-center margin-top">계정 삭제하기</span>
		<hr>
		<span class="gray small-font disp-bl margin-top margin-btm centered-padding">
			계정을 삭제하면 상대팀 평가 및 작성한 경기 정보를 제외한 회원 정보,가입 팀 정보, 메시지, 게시글 등의
			활동 정보가 삭제됩니다.</span>
		<span class="disp-bl bold margin-tbm centered-padding">
			계정을 삭제하는 사유를 알려주시면 향후 서비스 개선에 큰 도움이 됩니다.
		</span>
		<div class="row margin-top padding-left">
			<input type="text" placeholder="사유 입력" id="reason" name="reason">
		</div>
		<hr class="hr">
		<div class="row margin-top">
			<input type="submit" class="block modal-block" id="submit_delete" value="계정 영구 삭제">
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	// Get the modal
	var modal = document.getElementById("myModals");

	// Get the button that opens the modal
	var unlink = document.getElementById("unlink");


	// When the user clicks the button, open the modal 
	unlink.onclick = function() {
	 	modal.style.display = "block";
	}
	

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	  if (event.target == modal) {
	    modal.style.display = "none";
	  }
	}
	$('#close_mod').click(function(){
		 modal.style.display = "none";
	});
	$(function(){
		
		$('#submit_delete').click(function(){
			$.ajax({
				url:'unlink.do',
				type:'post',
				data:{
					id: '${user_id}',
					reason : $('#reason').val(),
				},
				dataType:'json',
				cache:false,
				timeout:30000,
				success:function(data){
					if(data.result=='success'){
						location.href="${pageContext.request.contextPath}/main/main.do";
					}	
					if(data.result=='errors'){
						alert('오류 발생');
					}
					
				},
				error:function(){
					alert('네트워크 오류 발생');
				}
			});
		});
	});
</script>