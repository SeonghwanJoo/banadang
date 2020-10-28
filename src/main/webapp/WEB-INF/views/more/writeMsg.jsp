<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row" id="top_wrap">
	<div class="fixed_top">
		<a onclick="location.href=document.referrer">
			<span class="material-icons" id="chevron_left" >close</span>
		</a>
		<div class="topnav-centered">
			<a href="javascript:document.reload()" class="active">${title }</a>
		</div>
	</div>
</div>
<div class="blank_div"></div>
<div class="main-row cursor" onclick="location.href='${pageContext.request.contextPath}/match/invite_detail.do?match_num=${msg.match_num }'">
	<div class="x-smaller">
		<c:if test="${!empty msg.club_img }">
		<img src="${pageContext.request.contextPath}/club/imageView.do?club_num=${msg.club_num}" alt="Avatar" class="avatar">
		</c:if>
		<c:if test="${empty msg.club_img }">
		<img src="${pageContext.request.contextPath }/resources/images/blank_emblem.png" alt="Avatar" class="avatar emblem">
		</c:if>
	</div>
	<div class="x-bigger">
		<div class="main-row">
			<span class="match-item">${msg.club_name }</span>
			<span class="match-item">${msg.address }</span>
			<span class="match-item">${msg.match_date }</span>
			<span class="match-item">${msg.start_time }~${msg.end_time }</span>
		</div>
		<span class="gray">받는 사람</span>
		<span class="positive-color bold">${msg.nickname }</span>
	</div>
	<span class="material-icons float-right l-font gray">
		chevron_right
	</span>
</div>
<hr class="hr">
<div class="row">
	<div class="text input-container col">
		<textarea class="detail input-field" name="content" id="content" placeholder="메시지 내용을 입력해주세요."></textarea>
	</div>
</div>
<div style="display:block;height:2rem;">
	<span class="msg" id="content_msg"></span>
	<button id="register" class="f-r register-btn">전송</button>
	<span id="counter" class="gray small-font f-r">0 / 최대 500자</span>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function submitContent(){
	
	if(!$('#content').val().replace(/^\s+|\s+$/g, '')){
		$('#content_msg').css('color','red').text('메시지 내용을 입력해주세요.');
		return false;
	}
	
	$.ajax({
		url:'sendMsg.do',
		type:'post',
		data:{
			sender:${user_id},
			receiver:${msg.id},
			match_num:${msg.match_num},
			club_num:${msg.club_num},
			content:$('#content').val()
		},
		dataType:'json',
		cache:false,
		timeout:30000,
		success:function(data){
			if(data.result=='success'){
				location.href='sentMsg.do';//보낸 메시지함으로 이동
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
	$('#content').keyup(function(){
		
		var content=$(this).val();
		$('#counter').html(content.length+ '/ 최대 500자');
		
		if(counter.length>500){
			alert("최대 500자 까지 입력 가능합니다.");
			$(this).val(content.substring(0,500));
			$('#counter').html("500 / 최대 500자");
		}
	});
	
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