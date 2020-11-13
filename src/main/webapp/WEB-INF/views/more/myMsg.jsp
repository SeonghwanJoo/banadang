<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row" id="top_wrap">
	<div class="fixed_top">
		<a href="myPage.do" >
		<span class="material-icons" id="cancel">close</span>
		</a>
		<div class="topnav-centered">
			<a id="sel" class="active cursor gray">${title }
				<span class="drop-down material-icons">
					arrow_drop_down
				</span>
			</a>
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
				<c:if test="${not empty msg.thumbnail_image }">
				<img src="${msg.thumbnail_image }" alt="Avatar" class="avatar align-center">
				</c:if>
				<c:if test="${empty msg.thumbnail_image }">
				<img src="${pageContext.request.contextPath }/resources/images/profile.png" alt="Avatar" class="avatar align-center">
				</c:if>
			</div>
			<div class="x-bigger">
				<div class="main-row">
					<span class="match-item">${msg.club_name } </span>
					<c:if test="${not empty msg.nickname }">
					<span class="nickname bold">${msg.nickname }</span>
					</c:if>
					<c:if test="${empty msg.nickname }">
					<span class="gray bold">탈퇴 회원</span>
					</c:if>
					<span class="small-font bold gray right">${msg.register_date }</span>
					<span class="material-icons more cursor m-font gray" id="more" onclick="openOption(${msg.msg_num},'${msg.match_num }','${msg.club_num }','${msg.sender }')" >more_vert</span>
				</div>
				<p class="gray">${msg.content }</p>
			</div>
		</div>
	</li>
	</c:forEach>
</ul>
</c:if>
<!-- The Modal -->
<div id="sel-modal" class="modals">
  <!-- Modal content -->
  	
	<div class="modals-content">
	<span class="close_mod">&times;</span>
		<h6 class="mod-h6">메시지함 선택</h6>
		<hr>
	  	<span onclick="location.href='myMsg.do'" class="margin-top bold disp-bl cursor" >받은 메시지 함</span>
	  	<hr>
	  	<span onclick="location.href='sentMsg.do'" class="margin-top bold disp-bl cursor">보낸 메시지 함</span>
	</div>
</div>
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

// Get the modal
var modal = document.getElementById("sel-modal");

// Get the button that opens the modal
var sel = document.getElementById("sel");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close_mod")[0];

// When the user clicks the button, open the modal 
sel.onclick = function() {
	modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
	modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
	if (event.target == modal) {
		modal.style.display = "none";
	}
}

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
		$.ajax({
			url:'updateMsgStatus.do',
			type:'post',
			data:{
				receiver: ${user_id},
			},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(data){
				if(data.result=='errors'){
					
					alert('오류 발생');
				}
				
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
		$('#more').click(function(){
			
			$('#more_modal').css('display','block');
		});
		$('#more-cancel-btn').click(function(){
			$('#more_modal').css('display','none');
		});
		
	})


</script>
