<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty user_id }">
<div class="blank_div"></div>
<div class="row">
	<div class="col align-center">
		<c:if test="${club.filename ne 'undefined'  }">
			<img src="imageView.do?club_num=${club.club_num }"	class="emblem blocked">
		</c:if>
		<c:if test="${club.filename eq 'undefined'  }">
			<img src="${pageContext.request.contextPath }/resources/images/blank_emblem.png" class="emblem blocked">
		</c:if>
		<br>
		<span>${club.club_name}(${club.club_address })</span>
		<p><c:if test="${not empty nickname }">${nickname}님이</c:if> 당신을 ${club.club_name } 팀으로 초대합니다</p>
		<button onclick="inviteMember()" class="block">가입 하기</button>
	</div>
</div>
</c:if>
<c:if test="${not empty user_id }">
	<div id="invite_modal" class="certify-modals" style="display: block">
		<!-- Modal content -->
		<div class="certify-modal-content">
			<div class="col">
				<div class="sub-content">
					<c:if test="${club.filename ne 'undefined'  }">
						<img src="imageView.do?club_num=${club.club_num }" class="emblem blocked">
					</c:if>
					<c:if test="${club.filename eq 'undefined'  }">
						<img src="${pageContext.request.contextPath }/resources/images/blank_emblem.png" class="emblem blocked">
					</c:if>
					<br>
					<span>${club.club_name}(${club.club_address })</span>
					<c:if test="${not empty nickname }">
					<p>${nickname}님이 당신을 ${club.club_name } 팀으로 초대합니다</p>
					</c:if>
					<c:if test="${empty nickname }">
					<p>당신을 ${club.club_name } 팀으로 초대합니다</p>
					</c:if>
					<hr>
					<button id="invite-btn" class="pos-btn">수락</button>
				</div>
			</div>
			<div class="col">
				<div class="sub-content">
					<button id="invite-cancel-btn" class="neg-btn">거절</button>
				</div>
			</div>
		</div>
	</div>
</c:if>
<div id="login_modal" class="certify-modals">
	<!-- Modal content -->
	<div class="certify-modal-content">
		<div class="sub-content">
			<div class="main-row">
				<div class="login">
					<p>간편 로그인하고 GentlePro에서 우리팀을 관리해보세요</p>
					<a onclick="loginProcess()">
						<img class="login_btn"
						src="${pageContext.request.contextPath}/resources/images/kakao_login/ko/kakao_login_medium_narrow.png">
					</a>
				</div>
			</div>
		</div>
		<div class="sub-content">
			<button id="login-cancel-btn" class="neg-btn">취소</button>
		</div>
	</div>
</div>
<!-- The Modal -->
<div id="toast" class="submit_toast">
  <!-- Modal content -->
  <div id="submit_toast_content" class="submit_toast_content">
		<div class="row centered margin-btm centered-padding">
			<span id="club_msg">${club.club_name }팀에 가입했습니다.</span>
		</div>
		<div class="row margin-top centered">
			<button class="alert-btn">확인</button>
		</div>
	</div>
</div>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
Kakao.init('32776969383e4a77d92f6e18dd233bc5');
function inviteMember(){
	if('${user_id}'==''){
		$('#login_modal').css('display','block');
	}
	
};
function loginProcess(){
	location.href="https://kauth.kakao.com/oauth/authorize?client_id=0646bcb11e5b9bbdb24fc9153f7693ae&redirect_uri=https://${pageContext.request.serverName }${pageContext.request.contextPath}/member/invitedLogin.do&response_type=code&state=${club.club_num }";
};
$(function(){
	$('#login-cancel-btn').click(function(){
		$('#login_modal').css('display','none');
	});
	$('#invite-cancel-btn').click(function(){
		location.href='${pageContext.request.contextPath}/main/main.do';
	});
	$('#invite-btn').click(function(){
		$.ajax({
			url:'joinClub.do',
			type:'post',
			data:{
				id:'${user_id}',
				club_num:${club.club_num}
			},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(data){
				if(data.result=="success"){
					$('#invite_modal').css('display','none');
					$('#toast').css('display','block');
					$(window).click(function(){
						location.href='manageClub.do?club_num=${club.club_num}';
					})
				}else if(data.result=='duplicated'){
					
					location.href='manageClub.do?club_num=${club.club_num}';
					
				}else if(data.result=='errors'){
					alert('네트 워크 오류 발생');
					$(window).click(function(){
						$("#toast").css("display","none");
					});
				}
				if(data.result=="errors"){
					
					alert('오류 발생');
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
