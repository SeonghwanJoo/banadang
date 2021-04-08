<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- The Modal -->
<div id="toast" class="submit_toast">
  <!-- Modal content -->
    <div id="submit_toast_content" class="submit_toast_content">
		<div class="row centered margin-btm centered-padding">
			<span id="club_msg">
				소속팀이 없습니다.<br><br>
				<b>팀을 만들고 <br>
				회원들을 초대해 보세요!</b>
			</span>
		</div>
		<div class="row margin-top centered">
			<div class="col">
				<button class="alert-btn border-right-gray" id="confirm">홈으로</button>
			</div>
			<div class="col">
				<button class="alert-btn" id="create">팀 만들기</button>
			</div>
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function(){
		$('#toast').css('display','flex');
		
		$("#confirm").click(function(){
			location.href='${pageContext.request.contextPath}/main/main.do';
		});
		$('#create').click(function(){
			location.href='${pageContext.request.contextPath}/club/createClubForm.do';
		});
	});
</script>