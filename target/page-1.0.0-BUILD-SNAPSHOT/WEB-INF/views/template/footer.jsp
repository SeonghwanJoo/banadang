<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="floating" id="floating">
	<button class="install-btn">
		<span class="blue m-font">앱 설치</span>
		<br>
		앱을 설치하고 알림 메시지를 받아보세요!
	</button>
	<span id="test"></span>
</div>
<div class="row blank_div"></div>
<div class="row">
	<div class="bottom_menu">
		<div class="tab-row bottom-padding">
			<div class="col" id="main-bottom">
				<a class="menu-item" href="${pageContext.request.contextPath }/main/main.do">
				<span class="main material-icons bottom-icon">home</span>
				<span class="main bottom-icon-txt">홈</span>
				</a>
			</div>
			<div class="col" id="club">
				<a class="menu-item" href="${pageContext.request.contextPath }/club/club.do">
				<span class="club material-icons bottom-icon">groups</span>
				<span class="club bottom-icon-txt">팀 관리</span>
				</a>
			</div>
			<div class="col" id="invite">
				<a class="menu-item" href="${pageContext.request.contextPath }/match/match_toInvite.do">
				<span class="invite material-icons bottom-icon">sports_soccer</span>
				<span class="invite bottom-icon-txt">상대 매칭</span>
				</a>
			</div>
			<div class="col" id="join">
				<a class="menu-item" href="${pageContext.request.contextPath }/match/recruit.do">
				<span class="join material-icons bottom-icon">person_add</span>
				<span class="join bottom-icon-txt">용병 모집</span>
				</a>
			</div>
			<div class="col" id="myPage">
				<a class="menu-item" href="${pageContext.request.contextPath }/member/myPage.do">
				<i class="myPage margin-top fas fa-ellipsis-h more-icon">
				<c:if test="${count_msg!=0 && not empty count_msg }">
				<span class="count-msg">${count_msg }</span>
				</c:if>
				</i>
				
				<!-- <span class="myPage material-icons bottom-icon relative">more_horiz
				</span> -->
				</a>
			</div>
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	/* #00cd3c */
	$(function(){
		if(${ title eq 'main'}){
			$('.main').css('color','#fff');
			$('#main-bottom').css('border-top','3px solid #00cd3c');
		}else if(${title eq '경기 매치'}){
			$('.invite').css('color','#fff');
			$('#invite').css('border-top','3px solid #00cd3c');
		}else if(${title eq '용병 모집'}){
			$('.join').css('color','#fff');
			$('#join').css('border-top','3px solid #00cd3c');
		}else if(${title eq '팀 관리'}){
			$('.club').css('color','#fff');
			$('#club').css('border-top','3px solid #00cd3c');
		}else if(${title eq '더보기'}){
			$('.myPage').css('color','#fff');
			$('#myPage').css('border-top','3px solid #00cd3c');
		}
		
		var userAgent=navigator.userAgent.toLowerCase();
		var inapp = userAgent.indexOf('inapp')>-1;
		//if((userAgent.indexOf('android')>-1 || userAgent.indexOf('iphone')>-1) && !inapp){

			var position = $(window).scrollTop();
			
			
			$(window).scroll(function() {
			    var scroll = $(window).scrollTop();
			    if(scroll < position) {
			    	$('#floating').addClass('slideup');
			    } else {
			    	$('#floating').removeClass('slideup');
			    }
			    position = scroll;
			});
			
			$('.install-btn').click(function(){
				
				if(userAgent.indexOf('android')>-1){
					location.href = 'intent://gentlepro#Intent;scheme=gentlepro;package=com.easycompany.gentlepro;end';
				}else if (userAgent.indexOf('iphone')>-1){
					location.href = 'itms-apps://apps.apple.com/kr/app/apple-store/id1552824630';
				}
					
				
			});
		//} 
		
		
		
		
		
	});
</script>
