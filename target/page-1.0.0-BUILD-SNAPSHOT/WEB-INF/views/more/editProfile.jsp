<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<form:form class="col s12" id="form" action="updateProfile.do" commandName="memberVO" autocomplete="off">
<input type="hidden" name="id" value="${member.id }">
<div class="row" id="top_wrap">
	<div class="fixed_top">
		<a onclick="back()">
			<span class="material-icons" id="chevron_left" >chevron_left</span>
		</a>
		<div class="topnav-centered">
			<span class="active">${title }</span>
		</div>
	<input type="submit" id="submit" value="완료">
	</div>
</div>
<div class="blank_div"></div>
<span class="input-label">닉네임 수정</span>
<div class="row">
	<div class="autocomplete input-container col">
		<span class="icon material-icons">person</span>
		<input class="input-field" type="text" name="nickname" id="nickname" value="${member.nickname }"placeholder="닉네임 입력">
	</div>
</div>
<div class="row"><div class="col"><span class="msg" id="nickname_msg"></span></div></div>
<hr class="hr">
<span class="input-label">연령대 선택</span>
<div class="row centered-padding margin-m-top">
	<label class="label-sq">
		<span class="label-txt">20대</span>
		<input type="radio" value="20~29" name="age_range" id="2">
		<span class="checkmark-sq"></span>
	</label>
	<label class="label-sq">
		<span class="label-txt">30대</span>
		<input type="radio" value="30~39" name="age_range" id="3">
		<span class="checkmark-sq"></span>
	</label>
	<label class="label-sq">
		<span class="label-txt">40대</span>
		<input type="radio" value="40~49" name="age_range" id="4">
		<span class="checkmark-sq"></span>
	</label>
	<label class="label-sq">
		<span class="label-txt">50대</span>
		<input type="radio" value="50~59" name="age_range" id="5">
		<span class="checkmark-sq"></span>
	</label>
	<label class="label-sq">
		<span class="label-txt">60대</span>
		<input type="radio" value="60~69" name="age_range" id="6">
		<span class="checkmark-sq"></span>
	</label>
	<label class="label-sq">
		<span class="label-txt">70대</span>
		<input type="radio" value="70~79" name="age_range" id="7">
		<span class="checkmark-sq"></span>
	</label>
</div>
<div class="row"><div class="col"><span class="msg" id="age_msg"></span></div></div>
</form:form>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	
	$(function(){
		
		$('#nickname').focus();
		
		var age='${member.age_range}';
		sub_age=age.substring(0,1);
		if (sub_age==2){
			$('#2').prop('checked', 'true');
		}else if(sub_age==3){
			$('#3').prop('checked', 'true');
		}else if(sub_age==4){
			$('#4').prop('checked', 'true');
		}else if(sub_age==5){
			$('#5').prop('checked', 'true');
		}else if(sub_age==6){
			$('#6').prop('checked', 'true');
		}else {
			$('#7').prop('checked', 'true');
		}
		
		$("#submit").click(function(e){
			
			if(!$('#nickname').val().replace(/^\s+|\s+$/g, '')){
				$('#nickname_msg').css('color','red').text('닉네임을 입력해주세요.');
				$('#nickname').focus();
				return false;
			}
			
		});
		
		
		
	});
	
	
</script>