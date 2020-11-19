<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- The Modal -->
<div id="toast" class="submit_toast">

  <!-- Modal content -->
	<div id="submit_toast_content" class="submit_toast_content">
		<div class="row centered margin-btm centered-padding">
			<span id="club_msg">팀의 소속된 회원만 접근 가능합니다.</span>
		</div>
		<div class="row margin-top centered">
			<div class="col">
				<button class="alert-btn border-right" id="confirm">확인</button>
			</div>
			<div class="col">
				<button class="alert-btn yellow" id="join">팀 가입하기</button>
			</div>
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function(){
		$("#toast").css("display","block");
		$("#confirm").click(function(){
			location.href="${pageContext.request.contextPath}/main/main.do";
		})
		$('#join').click(function(){
			location.href="${pageContext.request.contextPath}/club/inviteMember.do?club_num=${club_num}"
		});
	});

</script>