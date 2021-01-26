<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="row" id="top_wrap">
	<div class="fixed_top">
		<a href="recruit.do">
		<span class="material-icons" id="cancel">close</span>
		</a>
		<div class="topnav-centered">
			<span class="active">${title }</span>
		</div>
		<c:if test="${match.club_num!=myClub.club_num }">
		<input type="submit" id="submit" value="신청">
		</c:if>
		<c:if test="${match.club_num==myClub.club_num && myClub.club_auth>4 }">
		<span class="material-icons more cursor xl-font" id="more">more_horiz</span>
		</c:if>
	</div>
</div>
<div class="blank_div"></div>
<div class="invite-wrapper" id="invite-wrapper">
 	<ul class="ul-list non-border-btm">
		<li class="li-list">
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
				<span class="match-item"><i class="far fa-calendar-alt margin-right"></i>${match.match_date}</span>
				<span class="match-item"><i class="far fa-clock margin-right"></i>${match.start_time }~${match.end_time }</span>
			</div>
			<div class="row small-font gray">
				<div class="col club_main">
					<c:if test="${match.filename ne 'undefined' }">
					<img src="${pageContext.request.contextPath }/club/imageView.do?club_num=${match.club_num}" alt="Avatar" class="avatar emblem">
					</c:if>
					<c:if test="${match.filename eq 'undefined' }">
					<img src="${pageContext.request.contextPath }/resources/images/blank_emblem.png" alt="Avatar" class="avatar emblem">
					</c:if>
					<span class="club_name">${match.club_name }</span><br>
					<span class="uniform">
						유니폼
						<c:if test="${!empty match.club_color }">
						<span class="color" style="background-color:${match.club_color}"></span>
						</c:if>
						<c:if test="${empty match.club_color }">
						미정
						</c:if>
					</span>
				</div>
				<div class="col">
					<span class="age">연령대 <span class="xs-font margin-left">${match.club_age }</span></span><br>
					<span class="send-msg cursor" onclick="location.href='${pageContext.request.contextPath}/member/writeMsg.do?match_num=${match.match_num }&club_num=${match.club_num }&id=${match.id }'" >
						<b>메시지 보내기</b>
						<i class="fas fa-comment"></i>
					</span>
				</div>
			</div>
		</li>
		<li class="li-list cursor" onclick="location.href='${pageContext.request.contextPath}/club/club_details.do?club_num=${match.club_num }'">
			<span class="rating_count">총 ${match.count }명의 평가 <i class="fas fa-chevron-right"></i></span>
			<div class="row small-font gray">
				<div class="col flex-start">
					매너 
					<span class="star-rating">
						<span style="width:${match.manner*20}%"></span>
					</span>${match.manner*2}
				</div>
				<div class="col flex-start">
					실력  
					<span class="star-rating">
						<span style="width:${match.perform*20}%"></span>
					</span>${match.perform*2}
				</div>			
			</div>
		</li>
		<li class="li-list">
			<span>${match.address}</span>
			<div id="map"></div>
		</li>
		<c:if test="${!empty match.recruit_detail }">
		<li class="li-list">
			<p class="detail readonly">${match.recruit_detail }</p>
		</li>
		</c:if>
		<li class="li-list">
			<!-- 포지션 -->
			<div class="row">
				<div class="col flex-start">
				<span class="margin-n-v disp-inbl">필요 포지션</span>
					<c:if test="${fn:contains(match.recruit_position,'G') }">
					<span class="small-chip">
						<span>GK</span>
					</span>
					</c:if>
					<c:if test="${fn:contains(match.recruit_position,'D') }">
					<span class="small-chip">
						<span>DF</span>
					</span>
					</c:if>
					<c:if test="${fn:contains(match.recruit_position,'M') }">
					<span class="small-chip">
						<span>MF</span>
					</span> 
					</c:if>
					<c:if test="${fn:contains(match.recruit_position,'W') }">
					<span class="small-chip">
						<span>FW</span>
					</span>
					</c:if>
				</div>
			</div>
			<div class="row">
				<div class="col">참가 비용 &nbsp; <span class="underline">${match.recruit_cost }</span></div>
				<div class="col">필요 인원 &nbsp; <span class="underline">${match.recruit_count }</span></div>
			</div>
		</li>
		<li class="li-list non-border-btm">
			<textarea class="detail input-field" id="recruit_req_detail" name="recruit_req_detail" placeholder="용병 신청 시 ${match.club_name } 팀에 추가적으로 전달할 내용 입력"></textarea>
		</li>
	</ul>
</div>
<div id="recruit_modal" class="confirm-modals">
	<!-- Modal content -->
	<div class="confirm-modal-content">
		<!-- 기존회원 관리 옵션(강제탈퇴,운영진 권한부여,일반회원 권한 부여 )-->
		<div class="sub-content">
			<span>희망 포지션을 선택하세요</span>
			<c:if test="${fn:contains(match.recruit_position,'G') }">
			<hr>
			<button id="gk-btn" value="gk" class="pos-btn">GK</button>
			</c:if>
			<c:if test="${fn:contains(match.recruit_position,'D') }">
			<hr>
			<button id="df-btn" value="df" class="pos-btn">DF</button>
			</c:if>
			<c:if test="${fn:contains(match.recruit_position,'M') }">
			<hr>
			<button id="mf-btn" value="mf" class="pos-btn">MF</button>
			</c:if>
			<c:if test="${fn:contains(match.recruit_position,'W') }">
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
			<button id="modify" class="pos-btn" onclick="location.href='modifyRecruit.do?recruit_num=${match.recruit_num}&club_num=${match.club_num }'">수정</button>
			<hr>
			<button id="delete" class="pos-btn red" onclick="location.href='deleteRecruit.do?recruit_num=${match.recruit_num}&club_num=${match.club_num }'">삭제</button>
		</div>
		<div class="sub-content">
			<button id="more-cancel-btn" class="neg-btn">닫기</button>
		</div>
	</div>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

	//이미지 지도에서 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(${match.address_y}, ${match.address_x}); 
	
	// 이미지 지도에 표시할 마커입니다
	// 이미지 지도에 표시할 마커는 Object 형태입니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition,
	    text:'${match.address}'
	});
	
	
	var mapContainer  = document.getElementById('map'), // 이미지 지도를 표시할 div  
	    mapOption = { 
	        center: new kakao.maps.LatLng(${match.address_y}, ${match.address_x}), // 이미지 지도의 중심좌표
	        level: 3, // 이미지 지도의 확대 레벨
	    };    
	// 이미지 지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption);
	marker.setMap(map); 
	$(function(){
		
		if (${match.club_color eq 'rgb(0, 0, 0)'}){
			$(".color").css("border","1px solid #fff");
		}
		
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
					url:'postRecruitRequest.do',
					type:'post', 
					data:{
						match_num: '${match.match_num}',
						id:'${user_id}',
						club_num:'${match.club_num}',
						recruit_position:position,
						recruit_req_detail:$('#recruit_req_detail').val(),
						home_name:'${match.id}'
					},
					dataType:'json',
					cache:false,
					timeout:30000,
					success:function(data){
						console.log(data.result);
						if(data.result=='requested'){
							$('#club_msg').text('용병 신청  완료');
						}else if(data.result=='duplicated'){
							$('#club_msg').text('이미 용병 신청하셨습니다');
						}
						$('#toast').css('display','flex');
						$('#confirm').click(function(){
							location.href='${pageContext.request.contextPath}/member/myRecruitReq.do';
						});
						$(window).click(function(){
							location.href='${pageContext.request.contextPath}/member/myRecruitReq.do';
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