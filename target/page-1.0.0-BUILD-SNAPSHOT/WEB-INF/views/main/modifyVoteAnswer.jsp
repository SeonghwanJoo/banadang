<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row" id="top_wrap">
	<div class="fixed_top">
		<a onclick="back()">
			<span class="material-icons" id="chevron_left" >chevron_left</span>
		</a>
		<div class="topnav-centered">
			<span class="active">${title }</span>
		</div>
		<input type="submit" id="submit" value="등록">
	</div>
</div>
<div class="blank_div"></div>
<div class="row">
	<div class="text input-container col">
		<textarea class="detail input-field" name="content" id="content" placeholder="댓글 내용을 입력해주세요.">${answer.content }</textarea>
	</div>
</div>
<div style="display:block;height:2rem;">
	<span class="msg" id="content_msg"></span>
	<button id="register" class="f-r register-btn">등록</button>
	<span id="counter" class="gray small-font f-r">0 / 최대 500자</span>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

function submitContent(){
	
	if(!$('#content').val().replace(/^\s+|\s+$/g, '')){
		$('#content_msg').css('color','red').text('댓글 내용을 입력해주세요.');
		return false;
	}
	
	$.ajax({
		url:'updateAnswerToVote.do',
		type:'post',
		data:{
			voteAnswer_num:${answer.voteAnswer_num},
			content:$('#content').val()
		},
		dataType:'json',
		cache:false,
		timeout:30000,
		success:function(data){
			if(data.result=='success'){
				location.href='voteForm.do?match_num=${answer.match_num}&club_num=${answer.club_num}&isMain=${answer.isMain}';
			}
			if(data.result=='errors'){
				alert('오류 발생');
			}
			
		},
		error:function(){
			alert('네트워크 오류 발생');
		}
	});
}

$(function(){
	
	$('#content').focus();
	
	$('#submit').click(function(){
		submitContent();
	});
	$('#register').click(function(){
		submitContent();
	});
	$('#content').click(function(){
		$('#content_msg').text('');
	});
});


</script>