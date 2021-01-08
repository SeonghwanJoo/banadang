<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="row">
	<form:form class="col s12" id="form" autocomplete="off">
		<input type="hidden" name="id" value="${user_id }">
		<input type="hidden" name="match_num" id="match_num" value="${match.match_num }">
		<div class="row" id="top_wrap">
			<div class="fixed_top">
				<a href="#" onclick="back()">
				<span class="material-icons" id="cancel">close</span>
				</a>
				<div class="topnav-centered">
					<span class="active">${title }</span>
				</div>
				<input type="submit" id="submit" value="완료">
			</div>
		</div>
		<div class="blank_div"></div>
		<span class="red">경기 추가 설명외에 주요 항목은 수정이 불가능합니다.</span>
		<span class="input-label">경기 유형(축구/풋살) 선택</span>
		<div class="row centered-padding">
			<c:if test="${match.type==1 }">
			<label class="chip">
				<span class="chip-txt">축구</span>
				<input type="radio" name="type" id="soccer" value="1" checked="checked">
				<span class="checkmark"></span>
			</label> 
			<label class="chip">
				<span class="chip-txt">풋살</span>
				<input type="radio" name="type" id="futsal" value="2">
				<span class="checkmark"></span>
			</label>
			</c:if>
			<c:if test="${match.type==2 }">
			<label class="chip">
				<span class="chip-txt">축구</span>
				<input type="radio" name="type" id="soccer" value="1">
				<span class="checkmark"></span>
			</label> 
			<label class="chip">
				<span class="chip-txt">풋살</span>
				<input type="radio" name="type" id="futsal" value="2" checked="checked">
				<span class="checkmark"></span>
			</label>
			</c:if>
		</div>
		<hr>
		<span class="input-label">예정된 상대팀 있음/상대팀 초청 선택</span>
		<div class="row centered-padding">
			<c:if test="${match.away==0 }">
			<label class="chip wider">
				<span class="chip-txt">상대팀 있음</span>
				<input type="radio" name="opponent" id="exist" value="1" >
				<span class="checkmark"></span>
			</label> 
			<label class="chip wider">
				<span class="chip-txt">상대팀 초청</span>
				<input type="radio" name="opponent" id="non-exist" value="2" checked="checked">
				<span class="checkmark"></span>
			</label>
			</c:if>
			<c:if test="${match.away!=0 }">
			<label class="chip wider">
				<span class="chip-txt">상대팀 있음</span>
				<input type="radio" name="opponent" id="exist" value="1" checked="checked">
				<span class="checkmark"></span>
			</label> 
			<label class="chip wider">
				<span class="chip-txt">상대팀 초청</span>
				<input type="radio" name="opponent" id="non-exist" value="2">
				<span class="checkmark"></span>
			</label>
			</c:if>
		</div>
		<div class="row"><div class="col"><span class="msg" id="type_msg"></span></div></div>
		<hr class="hr">
		<input type="hidden" id="home" name="home" value="${myClub.club_num}">
		<input type="hidden" name="away" id="away" value="${match.away }">
		<div id="away-wrapper">
			<div class="row">
				<div class="autocomplete input-container col">
					<i class="fa fa-users icon"></i> <input class="input-field"
						type="text" readonly placeholder="상대팀명 입력 (목록에서 선택)" name="away_name" id="away_name" value="${match.away_name}">
				</div>
			</div>
		<div class="row"><div class="col"><span class="msg" id="away_msg"></span></div></div>
		<hr class="hr">
		</div>
		<div class="row">
			<div class="autocomplete input-container col">
				<i class="fas fa-map-marked-alt icon"></i> <input class="input-field"
					type="text" name="address" id="address" placeholder="경기 장소 지도 검색" value="${match.address }">
			</div>
			<input type="hidden" name="address_x" id="address_x" value="${match.address_x }">
			<input type="hidden" name="address_y" id="address_y"value="${match.address_y }">
		</div>
		<div class="row"><div class="col"><span class="msg" id="address_msg"></span></div></div>
		<hr class="hr">
		<div class="row">
			<div class="input-container col">
				<i class="fas fa-calendar-alt icon"></i> <input class="input-field"
					type="text" id="datepicker" placeholder="경기 날짜 선택" name="match_date" value=${match.match_date }>
			</div>
		</div>
		<div class="row"><div class="col"><span class="msg" id="date_msg"></span></div></div>
		<hr class="hr">
		<div class="row">
			<div class="input-container col">
				<i class="far fa-clock icon"></i> <select class="time input-field" id="start_time" name="start_time">
					<option value="${match.start_time }">${match.start_time }</option>
					<option value="06:00">06:00</option>
					<option value="06:30">06:30</option>
					<option value="07:00">07:00</option>
					<option value="07:30">07:30</option>
					<option value="08:00">08:00</option>
					<option value="08:30">08:30</option>
					<option value="09:00">09:00</option>
					<option value="09:30">09:30</option>
					<option value="10:00">10:00</option>
					<option value="10:30">10:30</option>
					<option value="11:00">11:00</option>
					<option value="11:30">11:30</option>
					<option value="12:00">12:00</option>
					<option value="12:30">12:30</option>
					<option value="13:00">13:00</option>
					<option value="13:30">13:30</option>
					<option value="14:00">14:00</option>
					<option value="14:30">14:30</option>
					<option value="15:00">15:00</option>
					<option value="15:30">15:30</option>
					<option value="16:00">16:00</option>
					<option value="16:30">16:30</option>
					<option value="17:00">17:00</option>
					<option value="17:30">17:30</option>
					<option value="18:00">18:00</option>
					<option value="18:30">18:30</option>
					<option value="19:00">19:00</option>
					<option value="19:30">19:30</option>
					<option value="20:00">20:00</option>
					<option value="20:30">20:30</option>
					<option value="21:00">21:00</option>
					<option value="21:30">21:30</option>
					<option value="22:00">22:00</option>
					<option value="22:30">22:30</option>
					<option value="23:00">23:00</option>
					<option value="23:30">23:30</option>
					<option value="24:00">00:00</option>
					<option value="24:30">00:30</option>
					<option value="01:00">01:00</option>
					<option value="01:30">01:30</option>
					<option value="02:00">02:00</option>
					<option value="02:30">02:30</option>
					<option value="03:00">03:00</option>
					<option value="03:30">03:30</option>
					<option value="04:00">04:00</option>
					<option value="04:30">04:30</option>
					<option value="05:00">05:00</option>
					<option value="05:30">05:30</option>
				</select>
			</div>
			<span class="from-to">~</span>
			<div class="input-container col">
				<i class="far fa-clock icon"></i> <select class="time input-field" id="end_time" name="end_time">
					<option class="placeholder" value="${match.end_time }">${match.end_time }</option>
					<option value="06:00">06:00</option>
					<option value="06:30">06:30</option>
					<option value="07:00">07:00</option>
					<option value="07:30">07:30</option>
					<option value="08:00">08:00</option>
					<option value="08:30">08:30</option>
					<option value="09:00">09:00</option>
					<option value="09:30">09:30</option>
					<option value="10:00">10:00</option>
					<option value="10:30">10:30</option>
					<option value="11:00">11:00</option>
					<option value="11:30">11:30</option>
					<option value="12:00">12:00</option>
					<option value="12:30">12:30</option>
					<option value="13:00">13:00</option>
					<option value="13:30">13:30</option>
					<option value="14:00">14:00</option>
					<option value="14:30">14:30</option>
					<option value="15:00">15:00</option>
					<option value="15:30">15:30</option>
					<option value="16:00">16:00</option>
					<option value="16:30">16:30</option>
					<option value="17:00">17:00</option>
					<option value="17:30">17:30</option>
					<option value="18:00">18:00</option>
					<option value="18:30">18:30</option>
					<option value="19:00">19:00</option>
					<option value="19:30">19:30</option>
					<option value="20:00">20:00</option>
					<option value="20:30">20:30</option>
					<option value="21:00">21:00</option>
					<option value="21:30">21:30</option>
					<option value="22:00">22:00</option>
					<option value="22:30">22:30</option>
					<option value="23:00">23:00</option>
					<option value="23:30">23:30</option>
					<option value="24:00">00:00</option>
					<option value="24:30">00:30</option>
					<option value="01:00">01:00</option>
					<option value="01:30">01:30</option>
					<option value="02:00">02:00</option>
					<option value="02:30">02:30</option>
					<option value="03:00">03:00</option>
					<option value="03:30">03:30</option>
					<option value="04:00">04:00</option>
					<option value="04:30">04:30</option>
					<option value="05:00">05:00</option>
					<option value="05:30">05:30</option>
				</select>
			</div>
		</div>
		<div class="row"><div class="col"><span class="msg" id="start_msg"></span></div></div>
		<div class="row"><div class="col"><span class="msg" id="end_msg"></span></div></div>
		<hr class="hr">
		<div class="row" id="cost-wrapper" style="display:none">
			<div class="autocomplete input-container col">
				<i class="fas fa-won-sign"></i> <input class="input-field"
					type="text" name="cost" id="cost" placeholder="구장 비용 입력" value="${match.cost }">
			</div>
		</div>
		<hr class="hr">
		<div class="row">
			<div class="text input-container col">
				<textarea class="detail input-field" id="match_detail" name="match_detail" placeholder="추가적으로 공유할 내용이 있으면 입력해주세요.(매너/실력은 자동 계산되어 보여집니다)">${match.match_detail }</textarea>
			</div>
		</div>
		<hr class="hr">
	</form:form>
</div>

<!-- The Modal -->
<div id="toast" class="submit_toast">

  <!-- Modal content -->
  	<div id="submit_toast_content" class="submit_toast_content">
		<div class="row centered margin-btm centered-padding">
			<span id="club_msg"></span>
		</div>
		<div class="row margin-top centered">
			<button class="alert-btn">확인</button>
		</div>
	</div>
</div>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

function adjustHeight() {
	  var textEle = $('textarea');
	  textEle[0].style.height = 'auto';
	  var textEleHeight = textEle.prop('scrollHeight');
	  textEle.css('height', textEleHeight);
};

$( function() {
	
	adjustHeight();
	var textEle = $('textarea');
	textEle.on('keydown', function() {
	  adjustHeight();
	  var str=$(this).val();
		if(str.length>500){
			alert("최대 500자 까지 입력 가능합니다.");
			$(this).val(str.substring(0,500));
		}
	});
	

	$('#exist').attr('disabled',true);
	$('#non-exist').attr('disabled',true);
	$('#soccer').attr('disabled',true);
	$('#futsal').attr('disabled',true);
	$('#address').attr('disabled',true);
	$('#datepicker').attr('disabled',true);
	$('#start_time').attr('disabled',true);
	$('#end_time').attr('disabled',true);
	
	$('#form').submit(function(e){
		
		e.preventDefault();
		$.ajax({
			url:'updateMatch.do',
			type:'post',
			data:{match_detail:$('#match_detail').val(),
				match_num:$('#match_num').val()},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(data){
				if(data.result=="updated"){
					$("#club_msg").text("경기 일정 수정 완료");
					$("#toast").css("display","block");
					$("#confirm").click(function(){
						location.href="${pageContext.request.contextPath}/club/manageClub.do?club_num=${myClub.club_num}";
					});
					$(window).click(function(){
						location.href="${pageContext.request.contextPath}/club/manageClub.do?club_num=${myClub.club_num}";
					});
				}
				
				if(data.result=="errors"){
					
					$("#club_msg").text("경기 일정 에러 발생");
					$("#toast").css("display","block");
					$('#confirm').click(function(){
						$("#toast").css("display","none");
					});
					$(window).click(function(){
						$("#toast").css("display","none");
					});
				}
				
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
	});
});
	
</script>
