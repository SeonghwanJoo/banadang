<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="row" id="top_wrap">
	<div class="fixed_top">
		<a href="clubRecruit.do">
		<span class="material-icons" id="cancel">close</span>
		</a>
		<div class="topnav-centered">
			<a href="javascript:document.reload()" class="active">${title }</a>
		</div>
		<c:if test="${clubRecruit.club_num!=myClub.club_num }">
		<input type="submit" id="submit" value="신청">
		</c:if>
		<c:if test="${clubRecruit.club_num==myClub.club_num && myClub.club_auth>4 }">
		<span class="material-icons more cursor xl-font" id="more">more_horiz</span>
		</c:if>
	</div>
</div>
<div class="blank_div"></div>
<div class="invite-wrapper" id="invite-wrapper">
 	<ul class="ul-list">
		<li class="li-list">
			<div class="main-row">
				<span class="match-item"> <span class="gray">주 활동 요일 </span>${clubRecruit.act_day}</span>
				<span class="match-item"><span class="gray">주 활동 시간대 </span> ${clubRecruit.act_time }</span>
				<span class="match-item">
					<c:if test="${clubRecruit.type==1 }">축구</c:if>
					<c:if test="${clubRecruit.type==2 }">풋살</c:if>
				</span>
			</div>
			<div class="row small-font gray">
				<div class="col club_main">
					<c:if test="${!empty clubRecruit.club_img }">
					<img src="${pageContext.request.contextPath }/club/imageView.do?club_num=${clubRecruit.club_num}" alt="Avatar" class="avatar emblem">
					</c:if>
					<c:if test="${empty clubRecruit.club_img }">
					<img src="${pageContext.request.contextPath }/resources/images/blank_emblem.png" alt="Avatar" class="avatar emblem">
					</c:if>
					<span class="club_name">${clubRecruit.club_name }</span><br>
					<span class="relative positive-color cursor" onclick="location.href='${pageContext.request.contextPath}/member/writeMsg.do?club_num=${clubRecruit.club_num }&id=${clubRecruit.id }'" >
						<b>메시지 보내기</b>
						<i class="fas fa-comment bubble"></i>
					</span>
				</div>
				<div class="col">
					<span class="age"><span class="gray">주 연령대 </span>${clubRecruit.club_age }</span><br>
					<span class="uniform gray">
						유니폼
						<c:if test="${!empty clubRecruit.club_color }">
						<span class="color" style="background-color:${clubRecruit.club_color}"></span>
						</c:if>
						<c:if test="${empty clubRecruit.club_color }">
						미정
						</c:if>
					</span>
				</div>
			</div>
		</li>
		<li class="li-list cursor" onclick="location.href='${pageContext.request.contextPath}/club/club_details.do?club_num=${clubRecruit.club_num }'">
			<span class="rating_count">총 ${clubRecruit.count }명의 평가 <i class="fas fa-chevron-right"></i></span>
			<div class="row small-font gray">
				<div class="col">
					매너 
					<span class="star-rating">
						<span style="width:${clubRecruit.manner*20}%"></span>
					</span>${clubRecruit.manner*2}
				</div>
				<div class="col">
					실력  
					<span class="star-rating">
						<span style="width:${clubRecruit.perform*20}%"></span>
					</span>${clubRecruit.perform*2}
				</div>			
			</div>
		</li>
		<li class="li-list">
			<span>${clubRecruit.club_address}(주 활동 경기장 : ${clubRecruit.club_loc })</span>
			<div id="map" style="width:100%;height:300px;"></div>
		</li>
		<c:if test="${!empty clubRecruit.clubRecruit_detail }">
		<li class="li-list">
			<p>${clubRecruit.clubRecruit_detail }</p>
		</li>
		</c:if>
		<li class="li-list">
			<div class="row">
				<span class="col"><span class="gray">가입비</span> <span>${clubRecruit.register_cost }</span></span>
				<span class="col"><span class="gray">월 회비</span> <span>${clubRecruit.month_cost }</span></span>
			</div>
			<!-- 포지션 -->
			<div class="row">
				<span class="center gray">필요 포지션</span>
				<c:if test="${fn:contains(clubRecruit.recruit_position,'G') }">
				<span class="chip">
					<span class="chip-txt">GK</span>
				</span>
				</c:if>
				<c:if test="${fn:contains(clubRecruit.recruit_position,'D') }">
				<span class="chip">
					<span class="chip-txt">DF</span>
				</span>
				</c:if>
				<c:if test="${fn:contains(clubRecruit.recruit_position,'M') }">
				<span class="chip">
					<span class="chip-txt">MF</span>
				</span> 
				</c:if>
				<c:if test="${fn:contains(clubRecruit.recruit_position,'W') }">
				<span class="chip">
					<span class="chip-txt">FW</span>
				</span>
				</c:if>
			</div>
		</li>
		<li class="li-list">
			<textarea class="detail input-field" id="clubRecruit_req_detail" name="clubRecruit_req_detail" placeholder="가입 신청 시 ${clubRecruit.club_name } 팀에 추가적으로 전달할 내용 입력"></textarea>
		</li>
	</ul>
</div>
<div id="recruit_modal" class="confirm-modals">
	<!-- Modal content -->
	<div class="confirm-modal-content">
		<!-- 기존회원 관리 옵션(강제탈퇴,운영진 권한부여,일반회원 권한 부여 )-->
		<div class="sub-content">
			<span>희망 포지션을 선택하세요</span>
			<c:if test="${fn:contains(clubRecruit.recruit_position,'G') }">
			<hr>
			<button id="gk-btn" value="gk" class="pos-btn">GK</button>
			</c:if>
			<c:if test="${fn:contains(clubRecruit.recruit_position,'D') }">
			<hr>
			<button id="df-btn" value="df" class="pos-btn">DF</button>
			</c:if>
			<c:if test="${fn:contains(clubRecruit.recruit_position,'M') }">
			<hr>
			<button id="mf-btn" value="mf" class="pos-btn">MF</button>
			</c:if>
			<c:if test="${fn:contains(clubRecruit.recruit_position,'W') }">
			<hr>
			<button id="fw-btn" value="fw" class="pos-btn">FW</button>
			</c:if>
		</div>
		<div class="sub-content">
			<button id="cancel-btn" class="neg-btn">취소</button>
		</div>
	</div>
</div>
<div id="more_modal" class="confirm-modals">
	<!-- Modal content -->
	<div class="confirm-modal-content">
		<div class="sub-content">
			<button id="modify" class="pos-btn" onclick="location.href='modifyClubRecruit.do?clubRecruit_num=${clubRecruit.clubRecruit_num}'">수정</button>
			<hr>
			<button id="delete" class="pos-btn red" onclick="location.href='deleteClubRecruit.do?clubRecruit_num=${clubRecruit.clubRecruit_num}'">삭제</button>
		</div>
		<div class="sub-content">
			<button id="more-cancel-btn" class="neg-btn">취소</button>
		</div>
	</div>
</div>
<!-- The Modal -->
<div id="toast" class="submit_toast">
  <!-- Modal content -->
  	<div id="submit_toast_content" class="submit_toast_content">
		<div class="row centered margin-btm centered-padding">
			<span id="club_msg">팀 가입 신청 완료</span>
		</div>
		<div class="row margin-top centered">
			<button class="alert-btn">확인</button>
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	//이미지 지도에서 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(${clubRecruit.club_locY}, ${clubRecruit.club_locX}); 
	
	// 이미지 지도에 표시할 마커입니다
	// 이미지 지도에 표시할 마커는 Object 형태입니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition,
	    text:'${clubRecruit.club_loc}'
	});
	
	
	var mapContainer  = document.getElementById('map'), // 이미지 지도를 표시할 div  
	    mapOption = { 
	        center: new kakao.maps.LatLng(${clubRecruit.club_locY}, ${clubRecruit.club_locX}), // 이미지 지도의 중심좌표
	        level: 3, // 이미지 지도의 확대 레벨
	    };    
	// 이미지 지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption);
	marker.setMap(map); 
	console.log('clubRecruit_num : '+${clubRecruit.clubRecruit_num})
	$(function(){
		$('#more').click(function(){
			$('#more_modal').css('display','block');
		});
		$('#more-cancel-btn').click(function(){
			$('#more_modal').css('display','none');
		});
		$('#submit').click(function(){
			$('#recruit_modal').css('display','block');
			$('.pos-btn').click(function(){
				var position=$(this).val();
				$.ajax({
					url:'postClubRecruitRequest.do',
					type:'post', 
					data:{
						id:'${user_id}',
						club_num:'${clubRecruit.club_num}',
						recruit_position:position,
						clubRecruit_req_detail:$('#clubRecruit_req_detail').val(),
						clubRecruit_num:${clubRecruit.clubRecruit_num}
					},
					dataType:'json',
					cache:false,
					timeout:30000,
					success:function(data){
						if(data.result=='success'){
							$('#recruitRequest_msg').text('팀원 가입 신청  완료');
						}else if(data.result=='duplicated'){
							$('#recruitRequest_msg').text('이미 가입 신청하셨습니다');
						}
						$('#toast').css('display','block');
						$('#confirm').click(function(){
							location.href='${pageContext.request.contextPath}/member/myClubRecruitReq.do';
						});
						$(window).click(function(){
							location.href='${pageContext.request.contextPath}/member/myClubRecruitReq.do';
						});
					},
					error:function(){
						alert('네트워크 오류 발생');
					}
				});
			});
		});
		$('#cancel-btn').click(function(){
			$('#recruit_modal').css('display','none');
		});
	});
  	
</script>