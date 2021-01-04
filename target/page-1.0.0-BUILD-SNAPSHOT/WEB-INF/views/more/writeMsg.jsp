<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row" id="top_wrap">
	<div class="fixed_top">
		<a onclick="back()">
			<span class="material-icons" id="chevron_left" >close</span>
		</a>
		<div class="topnav-centered">
			<span class="active">${title }</span>
		</div>
	</div>
</div>

<div class="blank_div"></div><!-- match_num이 없을 때,club_num이 없을 때, 아이디가 없을 때-->
<div class="main-row margin-top centered-padding">
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
			<c:if test="${not empty msg.club_name }">
			<span class="match-item">${msg.club_name }</span>
			</c:if>
			<c:if test="${not empty msg.address }">
			<span class="match-item">${msg.address }</span>
			<div class="row">
			<span class="match-item"><i class="far fa-calendar-alt margin-right"></i>${msg.match_date }</span>
			<span class="match-item"><i class="far fa-clock margin-right"></i>${msg.start_time }~${msg.end_time }</span>
			</div>
			</c:if>
		</div>
	</div>
	<div class="row margin-top">
		<span class="gray margin-right">받는 사람</span>
		<c:if test="${not empty msg.nickname }">
		<span class="positive-color bold">${msg.nickname }</span>
		</c:if>
		<c:if test="${empty msg.nickname }">
		<span class="gray bold">탈퇴 회원</span>
		</c:if>
	</div>
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

function adjustHeight() {
	  var textEle = $('textarea');
	  textEle[0].style.height = 'auto';
	  var textEleHeight = textEle.prop('scrollHeight');
	  textEle.css('height', textEleHeight);
};

function submitContent(){
	
	if(!$('#content').val().replace(/^\s+|\s+$/g, '')){
		$('#content_msg').css('color','red').text('메시지 내용을 입력해주세요.');
		return false;
	}
	if('${msg.id}'==''){
		alert('탈퇴한 회원입니다.');
		return false;
	}
	$.ajax({
		url:'sendMsg.do',
		type:'post',
		data:{
			sender:${user_id},
			receiver:${msg.id},
			match_num:'${msg.match_num}',
			club_num:'${msg.club_num}',
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
	
	adjustHeight();
	var textEle = $('textarea');
	textEle.on('keyup', function() {
	  adjustHeight();
	});
	
	$('#content').focus();
	$('#content').keyup(function(){
		
		var content=$(this).val();
		$('#counter').html(content.length+ '/ 최대 500자');
		
		if(content.length>500){
			
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