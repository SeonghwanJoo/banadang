<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="row" id="top_wrap">
	<div class="fixed_top">
		<a href="qna.do">
			<span class="material-icons" id="chevron_left" >chevron_left</span>
		</a>
		<div class="topnav-centered">
			<span class="active">${title }</span>
		</div>
		<c:if test="${board.id==user_id }">
		<span class="material-icons more cursor xl-font" id="more">more_horiz</span>
		</c:if>
	</div>
</div>
<div class="blank_div"></div>
<ul class="ul-list">
	<li class="li-list">
		<div class="main-row">
			<span class="small-font bold gray">${board.register_date }</span>
		</div>
		<div class="main-row">
			<span class="m-font">${board.title }</span>
		</div>
		<hr class="hr">
		<textarea class="detail">
			${board.content}
		</textarea>
	</li>
</ul>
<c:if test="${board.fromUser==1}">
<button class="reply-btn" onclick="location.href='replytoQna.do?qna_num=${board.qna_num}'">
	<span class="material-icons icon-margin gray">
	account_circle
	</span>
	<span class="gray small-font">댓글 입력</span>
</button>
</c:if>


<c:if test="${not empty answers }">
<c:forEach items="${answers }" var="answer">
<hr class="hr">
<div class="main-row">
	<span class="nickname">${answer.nickname }</span>
	<span class="small-font bold gray">${answer.register_date }</span>
	<span class="material-icons more cursor m-font gray" id="more" onclick="modifyAnswer(${answer.answer_num})" >more_vert</span>
</div>
<p>
${answer.content }
</p>
</c:forEach>
</c:if>

<div id="reply-more_modal" class="confirm-modals">
	<!-- Modal content -->
	<div class="confirm-modal-content">
		<div class="sub-content">
			<button id="reply-modify" class="pos-btn">댓글 수정</button>
			<hr>
			<button id="reply-delete" class="pos-btn red">댓글 삭제</button>
		</div>
		<div class="sub-content">
			<button id="reply-more-cancel-btn" class="neg-btn">취소</button>
		</div>
	</div>
</div>
<div id="more_modal" class="confirm-modals">
	<!-- Modal content -->
	<div class="confirm-modal-content">
		<div class="sub-content">
			<button id="modify" class="pos-btn" onclick="location.href='modifyQna.do?qna_num=${board.qna_num}'">글 수정</button>
			<hr>
			<button id="delete" class="pos-btn red" onclick="location.href='deleteQna.do?qna_num=${board.qna_num}'">글 삭제</button>
		</div>
		<div class="sub-content">
			<button id="more-cancel-btn" class="neg-btn">취소</button>
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function modifyAnswer(answer_num){
	$('#reply-more_modal').css('display','block');
	$('#reply-delete').click(function(){
		$.ajax({
			url:'deleteAnswer.do',
			type:'post',
			data:{
				answer_num: answer_num,
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
						$('#reply-more_modal').css('display','none');
					});
				}
				
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
		
	});
	$('#reply-modify').click(function(){
		location.href='modifyAnswer.do?answer_num='+answer_num;
	});
}
	$(function(){
		$('#more').click(function(){
			
			$('#more_modal').css('display','block');
		
		});
			
		$('#reply-more-cancel-btn').click(function(){
			$('#reply-more_modal').css('display','none');
		});
		
	});


</script>