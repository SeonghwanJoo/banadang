<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row" id="top_wrap">
	<div class="fixed_top">
		<a href="myPage.do" >
		<span class="material-icons" id="cancel">close</span>
		</a>
		<div class="topnav-centered">
			<a href="javascript:location.reload()" class="active cursor">${title }</a>
		</div>
	</div>
</div>
<div class="blank_div"></div>
<c:if test="${not empty msgs}">
<ul class="ul-list non-border-btm">
	<c:forEach items="${msgs }" var="msg">
	<li class="li-list">
		<div class="main-row">
			<div class="x-smaller">
				<img src="${msg.thumbnail_image }" alt="Avatar" class="avatar">
			</div>
			<div class="x-bigger">
				<div class="main-row">
					<span class="match-item">${msg.club_name } </span>
					<span class="nickname bold">${msg.nickname }</span>
					<span class="small-font bold gray right">${msg.register_date }</span>
					<span class="material-icons more cursor m-font gray" id="more" onclick="openOption(${msg.msg_num},${msg.match_num },${msg.club_num },${msg.sender })" >more_vert</span>
				</div>
				<p>${msg.content }</p>
			</div>
		</div>
	</li>
	</c:forEach>
</ul>
</c:if>
<div id="more_modal" class="confirm-modals">
	<!-- Modal content -->
	<div class="confirm-modal-content">
		<div class="sub-content">
			<button id="reply" class="pos-btn">답장</button>
			<hr>
			<button id="delete" class="pos-btn red">삭제</button>
		</div>
		<div class="sub-content">
			<button id="more-cancel-btn" class="neg-btn">취소</button>
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function openOption(msg_num,match_num,club_num,sender){
	$('#more_modal').css('display','block');
	$('#delete').click(function(){
		$.ajax({
			url:'deleteMsgFromReceiver.do',
			type:'post',
			data:{
				msg_num: msg_num,
			},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(data){
				if(data.result=='success'){
					location.reload();
				}
				if(data.result=='errors'){
					
					alert('오류 발생');
					$(window).click(function(){
						$('#more_modal').css('display','none');
					});
				}
				
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
		
	});
	$('#reply').click(function(){
		location.href='writeMsg.do?match_num='+match_num+'&club_num='+club_num+'&id='+sender;
	});
}
	$(function(){
		$('#more').click(function(){
			
			$('#more_modal').css('display','block');
		});
		$('#more-cancel-btn').click(function(){
			$('#more_modal').css('display','none');
		});
		
	})


</script>
