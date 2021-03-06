<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<form:form class="col s12" id="clubRecruitForm" action="postClubRecruit.do" commandName="matchVO" autocomplete="off">
<input type="hidden" name="club_num" value="${myClub.club_num }">
<input type="hidden" name="id" value="${user_id }">
<div class="row" id="top_wrap">
	<div class="fixed_top">
		<a onclick="location.href='clubRecruit.do'">
			<span class="material-icons" id="chevron_left" >chevron_left</span>
		</a>
		<div class="topnav-centered">
			<span class="active">${title }</span>
		</div>
	<input type="submit" id="submit" value="완료">
	</div>
</div>
<div class="blank_div"></div>
<ul class="ul-list non-border-btm">
	<li class="li-list">
		<span class="input-label">주 종목 (축구/풋살) 선택</span>
		<div class="row centered-padding margin-m-top">
			<label class="label-sq">
				<span class="label-txt">축구</span>
				<input type="radio" name="type" id="soccer" value="1" checked="checked">
				<span class="checkmark-sq"></span>
			</label> 
			<label class="label-sq">
				<span class="label-txt">풋살</span>
				<input type="radio" name="type" id="futsal" value="2">
				<span class="checkmark-sq"></span>
			</label>
		</div>
		<div class="row"><div class="col"><span class="msg" id="type_msg"></span></div></div>
	</li>
	<li class="li-list">
	<span class="input-label">주 활동 요일 선택</span>
	<div class="row centered-padding margin-m-top">
		<label class="label-sq">
			<span class="label-txt">월</span>
			<input type="checkbox" name="act_days" value="월" checked="checked">
			<span class="checkmark-sq"></span>
		</label> 
		<label class="label-sq">
			<span class="label-txt">화</span>
			<input type="checkbox" name="act_days" value="화">
			<span class="checkmark-sq"></span>
		</label>
		<label class="label-sq">
			<span class="label-txt">수</span>
			<input type="checkbox" name="act_days" value="수">
			<span class="checkmark-sq"></span>
		</label>
		<label class="label-sq">
			<span class="label-txt">목</span>
			<input type="checkbox" name="act_days" value="목">
			<span class="checkmark-sq"></span>
		</label>
		<label class="label-sq">
			<span class="label-txt">금</span>
			<input type="checkbox" name="act_dayss" value="금">
			<span class="checkmark-sq"></span>
		</label>
		<label class="label-sq">
			<span class="label-txt">토</span>
			<input type="checkbox" name="act_days" value="토">
			<span class="checkmark-sq"></span>
		</label>
		<label class="label-sq">
			<span class="label-txt">일</span>
			<input type="checkbox" name="act_days" value="일">
			<span class="checkmark-sq"></span>
		</label>
	</div>
	<div class="row"><div class="col"><span class="msg" id="day_msg"></span></div></div>
	</li>
	<li class="li-list">
	<span class="input-label">주 활동 시간대 선택</span>
	<div class="row centered-padding margin-m-top">
		<label class="label-sq">
			<span class="label-txt small-font">오전 06~12</span>
			<input type="checkbox" name="act_times" value="오전" checked="checked">
			<span class="checkmark-sq"></span>
		</label> 
		<label class="label-sq">
			<span class="label-txt small-font">오후 12~18</span>
			<input type="checkbox" name="act_times" value="오후">
			<span class="checkmark-sq"></span>
		</label>
		<label class="label-sq">
			<span class="label-txt small-font">야간 18~24</span>
			<input type="checkbox" name="act_times" value="야간">
			<span class="checkmark-sq"></span>
		</label>
	</div>
	<div class="row"><div class="col"><span class="msg" id="time_msg"></span></div></div>
	</li>
	<li class="li-list">
		<span class="input-label">모집하는 포지션 선택</span>
		<div class="row centered-padding margin-m-top">
			<label class="label-sq">
				<span class="label-txt">GK</span>
				<input type="checkbox" value="GK" name="recruit_positions" class="recruit_positions" id="GK" checked="checked">
				<span class="checkmark-sq"></span>
			</label>
			<label class="label-sq">
				<span class="label-txt">DF</span>
				<input type="checkbox" value="DF" name="recruit_positions">
				<span class="checkmark-sq"></span>
			</label>
			<label class="label-sq">
				<span class="label-txt">MF</span>
				<input type="checkbox" value="MF" name="recruit_positions">
				<span class="checkmark-sq"></span>
			</label> 
			<label class="label-sq">
				<span class="label-txt">FW</span>
				<input type="checkbox" value="FW" name="recruit_positions">
				<span class="checkmark-sq"></span>
			</label>
		</div>
		<div class="row"><div class="col"><span class="msg" id="position_msg"></span></div></div>
	</li>
	<li class="li-list"  id="phone-wrapper">	
		<div class="row">
			<div class="autocomplete input-container col">
				<i class="fas fa-phone-square icon"></i> <input class="input-field"
					type="text" name="phone" id="phone" maxlength="100" placeholder="연락처 입력(앱 알림 미설정 시 필수)">
			</div>
		</div>
	</li>
	<li class="li-list">
		<div class="row">
			<div class="autocomplete input-container col">
				<span class="icon material-icons">money</span>
				<input class="input-field" type="text" maxlength="200" name="register_cost" id="register_cost" placeholder="가입비(상세 설명) 입력">
			</div>
		</div>
		<div class="row"><div class="col"><span class="msg" id="register_msg"></span></div></div>
	</li>
	<li class="li-list">
		<div class="row">
			<div class="autocomplete input-container col">
				<i class="fas fa-won-sign icon"></i>
				<input class="input-field" type="text" maxlength="100" name="month_cost" id="month_cost" placeholder="월 회비 입력">
			</div>
		</div>
		<div class="row"><div class="col"><span class="msg" id="month_msg"></span></div></div>
	</li>
	<li class="li-list">
	<div class="row">
		<div class="input-container col">
			<i class="fas fa-calendar-alt icon"></i> <input class="input-field"
				type="text" id="datepicker" placeholder="모집 마감 날짜 선택" name="recruit_due">
		</div>
	</div>
	<div class="row"><div class="col"><span class="msg" id="due_msg"></span></div></div>
	</li>
	<li class="li-list">
	<div class="row">
		<div class="text input-container col">
			<textarea class="detail input-field" name="clubRecruit_detail" id="clubRecruit_detail" placeholder="추가적으로 공유할 내용이 있으면 입력해주세요."></textarea>
		</div>
	</div>
	</li>
</ul>
</form:form>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>


$(function(){
	
	$('#clubRecruit_detail').keyup(function (){
		
		var str=$(this).val();
		if(str.length>500){
			alert("최대 500자 까지 입력 가능합니다.");
			$(this).val(str.substring(0,500));
		}
		
	});
	

	$('#soccer').click(function(){
		$('#type_msg').text('');
		$('#type').val(1);
	});
	$('#futsal').click(function(){
		$('#type_msg').text('');
		$('#type').val(2);
	});
	$('input[name=act_days]').click(function(){
		$('#day_msg').text('');
	});
	$('input[name=act_times]').click(function(){
		$('#time_msg').text('');
	});
	$('input[name=recruit_positions]').click(function(){
		$('#position_msg').text('');
	});
	$('#datepicker').click(function(){
		$('#date_msg').text('');
	});
	$('#register_cost').click(function(){
		$('#register_msg').text('');
	});
	$('#month_cost').click(function(){
		$('#month_msg').text('');
	});
	
	$('#clubRecruitForm').submit(function(e){
		
		if(!$("input:checked[name='type']").is(":checked")){
			$('#type_msg').css('color','red').text('축구/풋살을 선택해주세요.');
			return false;
		}else if(!$("input:checked[name='act_days']").is(":checked")){
			$('#day_msg').css('color','red').text('주 활동 요일을 선택해주세요.');
			return false;
		}else if(!$("input:checked[name='act_times']").is(":checked")){
			$('#time_msg').css('color','red').text('주 활동 시간대를 선택해주세요.');
			return false;
		}else if(!$("input:checked[name='recruit_positions']").is(":checked")){
			$('#position_msg').css('color','red').text('모집 포지션을 선택해주세요.');
			return false;
		}else if(!$('#register_cost').val().replace(/^\s+|\s+$/g, '')){
			$('#register_msg').css('color','red').text('가입비를 입력해주세요');
			return false;
		}else if(!$('#month_cost').val().replace(/^\s+|\s+$/g, '')){
			$('#month_msg').css('color','red').text('월 회비를 입력해주세요.');
			return false;
		}else if($('#datepicker').val()==''){
			$('#due_msg').css('color','red').text('모잡 마감일을 입력해주세요.');
			return false;
		}
		var pickedDay=$('#datepicker').val();
		var splitDay=pickedDay.split('-');
		var convertedDay=new Date(splitDay[0],splitDay[1]-1,splitDay[2]);
		var dayAfter=new Date();
		dayAfter.setDate(dayAfter.getDate()+30);
		if(convertedDay>dayAfter){
			$('#due_msg').css('color','red').text('모잡 마감일은 한달 이내로 설정 가능합니다.');
			return false;
		}
		
	});
	
	
	let today=new Date();
	/*datepicker-start*/

	$('#datepicker').daterangepicker(
		{
			"opens" : "left",
			minDate : today,
			singleDatePicker : true,
			showDropdowns : true,
			autoUpdateInput : false,
			autoApply: true,
			"locale" : {
				"format" : "YYYY/MM/DD",
				"separator" : " ~ ",
				"applyLabel" : "Apply",
				"cancelLabel" : "Cancel",
				"fromLabel" : "From",
				"toLabel" : "To",
				"customRangeLabel" : "Custom",
				"weekLabel" : "W",
				"daysOfWeek" : [ "일", "월", "화", "수", "목",
				"금", "토" ],
				"monthNames" : [ "1월", "2월", "3월", "4월",
				"5월", "6월", "7월", "8월", "9월",
				"10월", "11월", "12월" ],
				"firstDay" : 1
			}
		},
		function(start, end, label) {
			$('#datepicker').val(start.format('YYYY-MM-DD'));
		});

		/*datepicker-end*/
});	
</script>
    