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
		<input type="submit" id="submit" value="신고">
	</div>
</div>
<div class="blank_div"></div>
<div class="main-row margin-top centered-padding">
	<span class="m-margin-right" >작성자</span>
	<span>${report.name}</span>
</div>
<div class="main-row margin-top centered-padding">
	<div class="x-smaller">
		<span>내용</span>
	</div>
	<div class="x-bigger">
		<p>${report.content}</p>
	</div>
</div>
<hr>
<div class="row"><div class="col"><span class="msg" id="reason_msg"></span></div></div>
<span class="input-label bold">사유 선택</span>
<ul class="ul-list non-border-btm">
	<li class="li-list">
		<label class="login-label">
			스팸 홍보/도배 글입니다.
			<input type="radio" name="reason" value="1">
			<span class="checkmark"></span>
		</label>
	</li>
	<li class="li-list">
		<label class="login-label">
			음란물입니다.
			<input type="radio" name="reason" value="2">
			<span class="checkmark"></span>
		</label>
	</li>
	<li class="li-list">
		<label class="login-label">
			불법 정보를 포함하고 있습니다.
			<input type="radio" name="reason" value="3">
			<span class="checkmark"></span>
		</label>
	</li>
	<li class="li-list">
		<label class="login-label">
			청소년에게 유해한 내용입니다.
			<input type="radio" name="reason" value="4">
			<span class="checkmark"></span>
		</label>
	</li>
	<li class="li-list">
		<label class="login-label">
			욕설/생명경시/혐오/차별적 표현입니다.
			<input type="radio" name="reason" value="5">
			<span class="checkmark"></span>
		</label>
	</li>
	<li class="li-list">
		<label class="login-label">
			개인정보 노출 게시물입니다.
			<input type="radio" name="reason" value="6">
			<span class="checkmark"></span>
		</label>
	</li>
	<li class="li-list">
		<label class="login-label">
			불쾌한 표현이 있습니다.
			<input type="radio" name="reason" value="7">
			<span class="checkmark"></span>
		</label>
	</li>
	<li class="li-list">
		<label class="login-label">
			불법 촬영물 등이 포함되어 있습니다.
			<input type="radio" name="reason" value="8">
			<span class="checkmark"></span>
		</label>
	</li>
</ul>
<!-- The Modal -->
<div id="toast" class="submit_toast">

  <!-- Modal content -->
  <div id="submit_toast_content" class="submit_toast_content">
		<div class="row centered margin-btm centered-padding">
			<span id="club_msg">신고 접수 되었습니다.</span>
		</div>
		<div class="row margin-top centered">
			<button class="alert-btn" onclick="back()">확인</button>
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

function submitReport(){
	
	if(!$('input:radio').is(':checked')){
		$('#reason_msg').css('color','red').text('신고 사유를 선택해주세요.');
		$('#reason_msg').focus();
		return false;
	}
	$.ajax({
		url:'submitReport.do',
		type:'post',
		data:{
			source:'${report.source}',
			reported_id:'${report.reported_id}',
			reporting_id:'${report.reporting_id}',
			write_num:'${report.write_num}',
			name:'${report.name}',
			content:'${report.content}',
			reason:$('input:checked').val()
		},
		dataType:'json',
		cache:false,
		timeout:30000,
		success:function(data){
			if(data.result='success'){
				$('#toast').css('display','flex');
			}
		},
		error:function(){
			alert('네트워크 오류 발생');
		}
	});
	
}

$(function(){
	
	$('#submit').click(function(){
		submitReport();
	});
	
	
})	


</script>
