<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="row" id="top_wrap">
	<div class="fixed_top">
		<a href="javascript:location.href='match_toInvite.do'">
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
<c:if test="${empty user_id }">
<div class="confirm-modals" style="display:block">
	<div class="confirm-modal-content">
		<div class="login">
			<div class="login-wrapper">
				<p class="black-bg-op bold">로그인이 필요한 페이지 입니다</p>
				<button class="signin-button kakao-btn" onclick="login(true)">
					<img src="${pageContext.request.contextPath }/resources/images/kakao-logo.jpg">
					<span>카카오톡으로 간편 로그인</span>
				</button>
				<button class="signin-button kakao-btn" onclick="login(false)">
					<img class="round" src="${pageContext.request.contextPath }/resources/images/kakao_account.png">
					<span>다른 카카오 계정으로 로그인</span>
				</button>
				<div id="appleid-signin" class="signin-button" data-color="white" data-border="false" data-type="sign-in"></div>
				<div class="row margin-top" style="display:none" id="sel_login">
					<label class="login-label">
						로그인 상태 유지
					  <input type="checkbox" checked="checked">
					  <span class="checkmark"></span>
					</label>
				</div>
			</div>
		</div>
	</div>
</div>
</c:if>
<c:if test="${not empty user_id && empty myClub }">
<!-- The Modal -->
<div id="emptyClub_toast" class="submit_toast" style="display:flex">
  <!-- Modal content -->
    <div id="emptyClub_submit_toast_content" class="submit_toast_content">
		<div class="row centered margin-btm centered-padding">
			<span id="club_msg">
				소속팀이 없습니다.<br><br>
				<b>팀을 만들고 <br>
				매치 신청해주세요.</b>
			</span>
		</div>
		<div class="row margin-top centered">
			<div class="col">
				<button class="alert-btn border-right-gray" id="emptyClub_confirm">목록</button>
			</div>
			<div class="col">
				<button class="alert-btn" id="create">팀 만들기</button>
			</div>
		</div>
	</div>
</div>
</c:if>
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
				<span class="material-icons float-right cursor" id="report_more">more_vert</span>
			</div>
			<div class="row small-font gray">
				<div class="col club_main">
					<c:if test="${match.filename ne 'undefined'}">
					<img src="${pageContext.request.contextPath }/club/imageView.do?club_num=${match.club_num}" alt="Avatar" class="avatar emblem">
					</c:if>
					<c:if test="${match.filename eq 'undefined'}">
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
			<span>${match.address} 
				<c:if test="${match.away == 0 }">
				(으)로 초청합니다
				</c:if>
				<c:if test="${match.away == -2 }">
				 주변 지역으로 초청해주세요
				</c:if>
			</span><br>
			<span class="cost">구장 비용 : ${match.cost }</span>
			<div id="map"></div>
		</li>
		<c:if test="${!empty match.match_detail }">
		<li class="li-list">
			<p class="detail readonly">${match.match_detail }</p>
		</li>
		</c:if>
		<li class="li-list non-border-btm">
			<textarea class="detail input-field" id="request_detail" name="request_detail" placeholder="매치 신청 시 ${match.club_name } 팀에 추가적으로 전달할 내용 입력"></textarea>
		</li>
	</ul>
</div>
<div class="mid-banner">
	<ins class="kakao_ad_area" style="display:none;" 
	 data-ad-unit    = "DAN-gCSwQUEFuriXnEOA" 
	 data-ad-width   = "320" 
	 data-ad-height  = "100"></ins>
</div>
<script type="text/javascript" src="//t1.daumcdn.net/kas/static/ba.min.js" async></script>
<!-- The Modal -->
<div id="toast" class="submit_toast">
	<!-- Modal content -->
	<div id="toast-content" class="submit_toast_content">
		<div class="row centered margin-btm centered-padding">
			<span id="matchRequest_msg">경기 신청 완료</span>
		</div>
		<div class="row margin-top centered">
			<button class="alert-btn" id="confirm">확인</button>
		</div>
	</div>
</div>
<!-- The Modal -->
<div id="myClub-toast" class="submit_toast">
	<!-- Modal content -->
	<div id="myClub-toast-content" class="submit_toast_content">
		<div class="row centered margin-btm centered-padding">
			<span>소속팀의 운영진만 경기 신청 가능합니다</span>
		</div>
		<div class="row margin-top centered">
			<button class="alert-btn">확인</button>
		</div>
	</div>
</div>
<div id="more_modal" class="confirm-modals">
	<!-- Modal content -->
	<div class="confirm-modal-content">
		<div class="sub-content">
			<button id="modify" class="pos-btn" onclick="location.href='modifyMatch.do?match_num=${match.match_num}&club_num=${myClub.club_num }'">수정</button>
			<hr>
			<button id="delete" class="pos-btn red" onclick="location.href='deleteMatch.do?match_num=${match.match_num}&club_name=${myClub.club_name }&club_num=${myClub.club_num }'">삭제</button>
		</div>
		<div class="sub-content">
			<button id="more-cancel-btn" class="neg-btn">닫기</button>
		</div>
	</div>
</div>
<div id="report_more_modal" class="confirm-modals">
	<!-- Modal content -->
	<div class="confirm-modal-content">
		<div class="sub-content">
			<button id="report" class="pos-btn" onclick="location.href='${pageContext.request.contextPath }/member/writeReport.do?source=1&reported_id=${match.id}&reporting_id=${user_id}&write_num=${match.match_num}&content=${match.match_detail }&name=${match.club_name }'">신고하기</button>
		</div>
		<div class="sub-content">
			<button id="report-more-cancel-btn" class="neg-btn">닫기</button>
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
	
	Kakao.init('32776969383e4a77d92f6e18dd233bc5');
	
	var state='';
	if($('input:checkbox').is(':checked')){
	 	state=true;
	}
	function login(throughTalk){
		
		Kakao.Auth.authorize({
			  redirectUri: $(location).attr('protocol')+"//"+"${pageContext.request.serverName }${pageContext.request.contextPath}/member/matchLogin.do"
			  ,state: '${match.match_num}' + '-' + state
			  ,throughTalk: throughTalk
		});
		
	 }

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
		
		$('#report_more').click(function(){
			$('#report_more_modal').css('display','block');
		});
		$('#report-more-cancel-btn').click(function(){
			$('#report_more_modal').css('display','none');
		});
		
		$("#emptyClub_confirm").click(function(){
			location.href='${pageContext.request.contextPath}/match/match_toInvite.do';
		});
		$('#create').click(function(){
			location.href='${pageContext.request.contextPath}/club/createClubForm.do';
		});
		
		$('#submit').click(function(){
		
			postMatchRequest( ${match.match_num}, '${user_id}', '${myClub.club_num}', $('#request_detail').val(),'${match.id}','${match.club_num}','${match.club_name}');
			

		});
	});
	
	function postMatchRequest(a,b,c,d,e,f,g){
		if(c==''||${myClub.club_auth<5}){
			$('#myClub-toast').css('display','flex');
			$('#myClub-toast').click(function(){
				$('#myClub-toast').css('display','none');
			})
			return;
		}
		$.ajax({
			url:'postMatchRequest.do',
			type:'post', 
			data:{
				match_num: a,
				id:b,
				away:c,
				request_detail:d,
				home_name:e,
				club_num:f,
				club_name:g
			},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(data){
				$('#toast').css('display','flex');
				if(data.result=='requested'){
					$('#matchRequest_msg').text('홈팀 '+g+'에게 어웨이 ${myClub.club_name}팀이 경기 신청했습니다.');
				}else if(data.result=='duplicated'){
					$('#matchRequest_msg').text('이미 경기 신청하셨습니다');
				}else{
					$('#matchRequest_msg').text('경기 신청 오류');
				}
				
				$('#confirm').click(function(){
					if(data.result=='requested'){
						location.href='${pageContext.request.contextPath}/club/manageClub.do?club_num=${myClub.club_num}&clubManageFrom=2';
					}else{
						$('#toast').css('display','none');
					}
					
				});
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
	}
  	
</script>