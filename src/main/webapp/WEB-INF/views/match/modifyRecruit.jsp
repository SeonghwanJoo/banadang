<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<form:form id="recruit_form" accept-charset="utf-8" enctype="multipart/form-data">
<input type="hidden" name="id" value="${user_id }">
<input type="hidden" name="recruit_num" value="${match.recruit_num }">
<div class="row" id="top_wrap">
	<div class="fixed_top">
		<a onclick="back()" >
		<span class="material-icons" id="cancel">close</span>
		</a>
		<div class="topnav-centered">
			<span class="active cursor">${title }</span>
		</div>
		<input type="submit" id="submit" value="완료">
	</div>
</div>
<div class="blank_div"></div>
<ul class="ul-list">
	<li class="li-list non-border-btm">
		<span class="input-label">용병을 모집하려는 경기를 선택하세요</span>
	</li>
	<li class="li-list">
		<div class="row">
			<div class="col">
				<label class="label-sq custom">
					<input type="radio" value="${match.match_num }" name="match_num" checked="checked">
					<span class="checkmark-sq"></span>
				</label>
				<div class="main-row margin-btm">
					<c:if test="${match.type==1 }">
					<span class="match-item s-chip white-bg">
					축구
					</span>	
					</c:if>
					<c:if test="${match.type==2 }">
					<span class="match-item s-chip black-bg">
					풋살
					</span>	
					</c:if>
					<span class="match-item">${match.address}</span>
				</div>
				<div>
					<span class="match-item"><i class="far fa-calendar-alt margin-right"></i>${match.match_date}</span>
					<span class="match-item"><i class="far fa-clock margin-right"></i>${match.start_time }~${match.end_time }</span>
				</div>
			</div>
		</div>
	</li>
</ul>
<ul class="ul-list non-border-btm">
	<li class="li-list">
		<span class="input-label">모집하는 포지션 선택(복수 선택 가능)</span>
		<div class="row centered-padding margin-m-top">
			<label class="label-sq m-margin-right">
				<span class="label-txt">GK</span>
				<c:if test="${fn:contains(match.recruit_position,'G') }">
				<input type="checkbox" value="GK" name="recruit_positions" class="recruit_position" id="GK" checked="checked">
				</c:if>
				<c:if test="${!fn:contains(match.recruit_position,'G') }">
				<input type="checkbox" value="GK" name="recruit_positions" class="recruit_position" id="GK">
				</c:if>
				<span class="checkmark-sq"></span>
			</label>
			<label class="label-sq m-margin-right">
				<span class="label-txt">DF</span>
				<c:if test="${fn:contains(match.recruit_position,'D') }">
				<input type="checkbox" value="DF" name="recruit_positions" checked="checked">
				</c:if>
				<c:if test="${!fn:contains(match.recruit_position,'D') }">
				<input type="checkbox" value="DF" name="recruit_positions">
				</c:if>
				<span class="checkmark-sq"></span>
			</label>
			<label class="label-sq m-margin-right">
				<span class="label-txt">MF</span>
				<c:if test="${fn:contains(match.recruit_position,'M') }">
				<input type="checkbox" value="MF" name="recruit_positions" checked="checked">
				</c:if>
				<c:if test="${!fn:contains(match.recruit_position,'M') }">
				<input type="checkbox" value="MF" name="recruit_positions">
				</c:if>
				<span class="checkmark-sq"></span>
			</label> 
			<label class="label-sq m-margin-right">
				<span class="label-txt">FW</span>
				<c:if test="${fn:contains(match.recruit_position,'W') }">
				<input type="checkbox" value="FW" name="recruit_positions" checked="checked">
				</c:if>
				<c:if test="${!fn:contains(match.recruit_position,'W') }">
				<input type="checkbox" value="FW" name="recruit_positions">
				</c:if>
				<span class="checkmark-sq"></span>
			</label>
		</div>
		<div class="row"><div class="col"><span class="msg" id="position_msg"></span></div></div>
	</li>
	<li class="li-list">
		<div class="row centered-padding margin">
			<div class="input-container selectbox height-m">
				<span class="icon material-icons">groups</span>
				<label for="recruit_count" class="recruit_count">${match.recruit_count }</label>
				<select class="input-field" name="recruit_count" id="recruit_count">
					<option class="placeholder" value="${match.recruit_count }" selected>${match.recruit_count }</option>
					<option class="placeholder" value="">필요 용병 인원수 선택</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>
			</div>
		</div>
		<div class="row"><div class="col"><span class="msg" id="count_msg"></span></div></div>
	</li>
	<li class="li-list">
		<div class="row">
			<div class="autocomplete input-container col centered-padding">
				<i class="fas fa-won-sign icon"></i>
				<input class="input-field" type="text" name="recruit_cost" id="recruit_cost" maxlength="45" placeholder="용병 참가 비용 입력" value="${match.recruit_cost }">
			</div>
		</div>
		<div class="row"><div class="col"><span class="msg" id="cost_msg"></span></div></div>
	</li>
	<li class="li-list"  id="phone-wrapper">	
		<div class="row">
			<div class="autocomplete input-container col">
				<i class="fas fa-phone-square icon"></i> <input class="input-field"
					type="text" name="phone" id="phone" maxlength="100" placeholder="연락처 입력(앱 알림 미설정 시 필수)" value="${match.phone }">
			</div>
		</div>
	</li>
	<li class="li-list">
		<div class="row">
			<div class="text input-container col">
				<textarea class="detail input-field" id="recruit_detail" name="recruit_detail" placeholder="추가적으로 공유할 내용이 있으면 입력해주세요.">${match.recruit_detail}</textarea>
			</div>
		</div>
	</li>
</ul>
</form:form>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function(){
		
		var selectTarget = $('.selectbox select');

		selectTarget.change(function(){
			var select_name = $(this).children('option:selected').text();
		    $(this).siblings('label').text(select_name);
		});
		    
		selectTarget.on({
			'focus' : function () {
		    	$(this).parent().addClass('focus');
		    },
		    'blur' : function () {
		    	$(this).parent().removeClass('focus');
		    }
		});
		
		$('input:checkbox').click(function(){
			$('#position_msg').text('');
		});
		$('#recruit_count').click(function(){
			$('#count_msg').text('');
		});
		$('#recruit_cost').click(function(){
			$('#cost_msg').text('');
		});
		
		$('#submit').click(function(e){
			e.preventDefault();
			if(!$('input:checkbox').is(':checked')){
				$('#position_msg').css('color','red').text('포지션을 선택해주세요');
				$('#position_msg').focus();
				return false;
			}else if($('#recruit_count').val()==''){
				$('#count_msg').css('color','red').text('용병 필요 인원을 선택해주세요');
				$('#recruit_count').focus();
				return false;
			}else if($('#recruit_cost').val()==''){
				$('#cost_msg').css('color','red').text('참가 비용을 입력해주세요');
				$('#recruit_cost').focus();
				return false;
			}
			
			var formData = new FormData($('#recruit_form')[0]);
			$.ajax({
				url:'updateRecruit.do',
				type:'post',
				data:formData,
				dataType:'json',
				processData: false,
	            contentType: false,
				cache:false,
				timeout:30000,
				success:function(data){
					if(data.result=="updated"){
						$("#club_msg").text("용병 모집 글 수정 완료");
						$("#toast").css("display","flex");
						$("#confirm").click(function(){
							location.href="recruitDetail.do?recruit_num="+data.recruit_num;
						});
						$(window).click(function(){
							location.href="recruitDetail.do?recruit_num="+data.recruit_num;
						});
					}
					
					
					if(data.result=="errors"){
						
						$("#club_msg").text("용병 모집 글 수정 실패");
						$("#toast").css("display","flex");
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