<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<form:form class="col s12" id="writeNoticeForm" action="postQna.do" commandName="boardVO" autocomplete="off">
<input type="hidden" name="id" value="${user_id }">
<input type="hidden" name="fromUser" value="${fromUser }">
<div class="row" id="top_wrap">
	<div class="fixed_top">
		<a onclick="location.href='qna.do'">
			<span class="material-icons" id="chevron_left" >chevron_left</span>
		</a>
		<div class="topnav-centered">
			<a href="#home" class="active">${title }</a>
		</div>
	<input type="submit" id="submit" value="완료">
	</div>
</div>
<div class="blank_div"></div>
<div class="row">
	<div class="autocomplete input-container col">
		<span class="icon material-icons">topic</span>
		<input class="input-field" type="text" name="title" id="title" placeholder="제목 입력">
	</div>
</div>
<div class="row"><div class="col"><span class="msg" id="title_msg"></span></div></div>
<hr class="hr margin-btm">
<c:if test="${not empty fromUser }">
<span class="small-font gray">*답변에는 시간이 필요합니다. 조금만 인내심을 갖고 기다려주세요:)</span>
</c:if>
<div class="row margin-top">
	<div class="text input-container col">
		<textarea class="detail input-field" name="content" id="content" placeholder="질문 내용을 입력해주세요."></textarea>
	</div>
</div>
<div class="row"><div class="col"><span class="msg" id="content_msg"></span></div></div>
</form:form>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

$(function(){
	
	$('#title').click(function(){
		$('#title_msg').text('');
	});
	$('#content').click(function(){
		$('#content_msg').text('');
	});
	
	$('#writeNoticeForm').submit(function(e){
		
		 if(!$('#title').val().replace(/^\s+|\s+$/g, '')){
				$('#title_msg').css('color','red').text('제목을 입력해주세요.');
				return false;
		}else if(!$('#content').val().replace(/^\s+|\s+$/g, '')){
			$('#content_msg').css('color','red').text('공지사항 내용을 입력해주세요.');
			return false;
		}
		
	});

});	
</script>
    