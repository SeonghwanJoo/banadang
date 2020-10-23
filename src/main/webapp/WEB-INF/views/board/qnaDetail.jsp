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
			<a href="javascript:document.reload()" class="active">${title }</a>
		</div>
		<c:if test="${board.id==user_id }">
		<span class="material-icons more cursor xl-font" id="more">more_horiz</span>
		</c:if>
	</div>
</div>
<div class="blank_div"></div>
<div class="main-row">
	<span class="small-font bold gray">${board.register_date }</span>
</div>
<div class="main-row">
	<span class="m-font">${board.title }</span>
</div>
<hr class="hr">
<p class="detail">
	${board.content}
</p>
<c:if test="${not empty board.answer }">
<hr class="hr">
<i class="fab fa-replyd"></i>
<div class="main-row">
	<span class="small-font bold gray">${board.answer_reg_date }</span>
</div>
<textarea class="detail">
${board.answer }
</textarea>
</c:if>
<c:if test="${mem_auth==2 }">
<button class="block" id="modifyAnswerForQna">
답변(수정) 하기
</button>
</c:if>
<div id="more_modal" class="confirm-modals">
	<!-- Modal content -->
	<div class="confirm-modal-content">
		<div class="sub-content">
			<button id="modify" class="pos-btn" onclick="location.href='modifyQna.do?qna_num=${board.qna_num}'">수정</button>
			<hr>
			<button id="delete" class="pos-btn red" onclick="location.href='deleteQna.do?qna_num=${board.qna_num}'">삭제</button>
		</div>
		<div class="sub-content">
			<button id="more-cancel-btn" class="neg-btn">취소</button>
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function(){
		$('#more').click(function(){
			
			$('#more_modal').css('display','block');
		});
		$('#more-cancel-btn').click(function(){
			$('#more_modal').css('display','none');
		});
		
	})


</script>