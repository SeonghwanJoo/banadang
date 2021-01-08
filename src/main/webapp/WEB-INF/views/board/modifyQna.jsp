<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<form:form class="col s12" id="updateNoticeForm" action="updateQna.do" commandName="boardVO" autocomplete="off">
<input type="hidden" name="qna_num" value="${board.qna_num }">
<div class="row" id="top_wrap">
	<div class="fixed_top">
		<a onclick="location.href='qna.do'">
			<span class="material-icons" id="chevron_left" >chevron_left</span>
		</a>
		<div class="topnav-centered">
			<span class="active">${title }</span>
		</div>
	<input type="submit" id="submit" value="완료">
	</div>
</div>
<div class="blank_div"></div>
<div class="row">
	<div class="autocomplete input-container col">
		<span class="icon material-icons">topic</span>
		<input class="input-field" type="text" name="title" id="title" value="${board.title }"placeholder="제목 입력">
	</div>
</div>
<div class="row"><div class="col"><span class="msg" id="title_msg"></span></div></div>
<hr class="hr">
<div class="row">
	<div class="text input-container col">
		<textarea class="detail input-field" name="content" id="content" placeholder="질문 내용을 입력해주세요.">${board.content }</textarea>
	</div>
</div>
<div class="row"><div class="col"><span class="msg" id="content_msg"></span></div></div>
</form:form>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

function adjustHeight() {
	  var textEle = $('textarea');
	  textEle[0].style.height = 'auto';
	  var textEleHeight = textEle.prop('scrollHeight');
	  textEle.css('height', textEleHeight);
};

$(function(){
	
	adjustHeight();
	var textEle = $('textarea');
	textEle.on('keyup', function() {
	  adjustHeight();
	  var str=$(this).val();
		if(str.length>500){
			alert("최대 500자 까지 입력 가능합니다.");
			$(this).val(str.substring(0,500));
		}
	});
	
	
	$('#title').keyup(function (){
		
		var str=$(this).val();
		if(str.length>100){
			alert("최대 100자 까지 입력 가능합니다.");
			$(this).val(str.substring(0,100));
		}
		
	});
	
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
    