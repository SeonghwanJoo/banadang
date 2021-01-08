<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="row" id="top_wrap">
	<div class="fixed_top">
		<a href="notice.do">
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
<div class="main-row margin-top centered-padding">
	<span class="small-font bold gray">${board.register_date }</span>
</div>
<div class="main-row centered-padding">
	<span class="m-font">${board.title }</span>
</div>
<hr class="hr">
<div class="centered-padding">
	<textarea class="detail" readonly>${board.content}</textarea>
</div>
<div id="more_modal" class="confirm-modals">
	<!-- Modal content -->
	<div class="confirm-modal-content">
		<div class="sub-content">
			<button id="modify" class="pos-btn" onclick="location.href='modifyNotice.do?notice_num=${board.notice_num}'">수정</button>
			<hr>
			<button id="delete" class="pos-btn red" onclick="location.href='deleteNotice.do?notice_num=${board.notice_num}'">삭제</button>
		</div>
		<div class="sub-content">
			<button id="more-cancel-btn" class="neg-btn">취소</button>
		</div>
	</div>
</div>
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
	textEle.on('keydown', function() {
	  adjustHeight();
	});
	
	$('#more').click(function(){
		
		$('#more_modal').css('display','block');
	});
	$('#more-cancel-btn').click(function(){
		$('#more_modal').css('display','none');
	});
	
})


</script>