<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- The Modal -->
<div id="toast" class="submit_toast">

  <!-- Modal content -->
	<div id="submit_toast_content" class="submit_toast_content">
		<div class="row centered margin-btm centered-padding">
			<span id="club_msg">로그인 상태의 팀 소속 회원만 접근 가능합니다.</span>
		</div>
		<div class="row margin-top centered">
			<div class="col">
				<button class="alert-btn border-right" id="confirm">로그인하기</button>
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
		$('#toast').css('display','flex');
		$('#confirm').click(function(){
			location.href='${pageContext.request.contextPath}/main/main.do';
		})
		$('#join').click(function(){
			location.href='${pageContext.request.contextPath}/club/inviteMember.do?club_num=${club_num}'
		});
	});

</script>