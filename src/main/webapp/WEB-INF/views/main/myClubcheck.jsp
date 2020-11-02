<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- The Modal -->
<div id="toast" class="submit_toast">

  <!-- Modal content -->
  <div id="submit_toast_content" class="submit_toast_content">
     <span id="club_msg">소속된 팀이 없습니다</span>
     <br><br>확인
  </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function(){
		$("#toast").css("display","block");
		$("#submit_toast_content").click(function(){
			location.href="${pageContext.request.contextPath}/main/main.do";
		})
	});

</script>