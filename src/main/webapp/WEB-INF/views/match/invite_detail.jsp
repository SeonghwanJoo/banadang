<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="row" id="top_wrap">
	<div class="fixed_top">
		<a href="#" onclick="history.go(-1); return false;">
		<span class="material-icons" id="cancel" onclick="goBack();">close</span>
		</a>
		<div class="topnav-centered">
			<a href="#home" class="active">${title }</a>
		</div>
		<input type="submit" id="submit" value="신청">
	</div>
</div>
<div class="blank_div"></div>
<div class="invite-wrapper" id="invite-wrapper">
 	<ul class="ul-list">
		<li class="li-list">
			<div class="row">
				<span class="match-item">${match.match_date}</span>
				<span class="match-item">${match.start_time }~${match.end_time }</span>
				<span class="match-item">
					<c:if test="${match.type==1 }">축구</c:if>
					<c:if test="${match.type==2 }">풋살</c:if>
				</span>
			</div>
			<div class="row">
				<div class="col club_main">
					<c:if test="${!empty match.club_img }">
					<img src="${pageContext.request.contextPath }/club/imageView.do?club_num=${match.club_num}" alt="Avatar" class="avatar emblem">
					</c:if>
					<c:if test="${empty match.club_img }">
					<img src="${pageContext.request.contextPath }/resources/images/blank_emblem.png" alt="Avatar" class="avatar emblem">
					</c:if>
					<span class="club_name">${match.club_name }</span><br>
				</div>
				<div class="col">
					<span class="age">평균 연령 : 30대</span><br>
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
			</div>
		</li>
		<li class="li-list">
			<span class="rating_count">총 ${match.count }명의 평가</span>
			<div class="row">
				<div class="col">
					매너 
					<span class="star-rating">
						<span style="width:${match.manner*20}%"></span>
					</span>${match.manner*2}
				</div>
				<div class="col">
					실력  
					<span class="star-rating">
						<span style="width:${match.perform*20}%"></span>
					</span>${match.perform*2}
				</div>			
			</div>
		</li>
		<li class="li-list">
			<span>${match.address}</span>
			<span class="cost">(구장 비용 : ${match.cost })</span>
			<div id="map" style="width:100%;height:300px;"></div>
		</li>
		<c:if test="${!empty match.match_detail }">
		<li class="li-list">
			<p>${match.match_detail }</p>
		</li>
		</c:if>
		<li class="li-list">
			<textarea class="detail input-field" id="invite_detail" name="invite_detail" placeholder="매치 초청 팀에 전송할 내용 입력"></textarea>
		</li>
	</ul>
</div>
<!-- The Modal -->
<div id="toast" class="submit_toast">
  <!-- Modal content -->
  <div id="toast-content" class="submit_toast_content">
     <span id="matchRequest_msg">경기 신청 완료</span>
     <br><br>확인
  </div>
</div>
<!-- The Modal -->
<div id="team" class="submit_toast">
	<!-- Modal content -->
	<div id="team-content" class="submit_toast_content">
		<div class="row">
			<div class="input-container col">
			<c:if test="${!empty myClubs }">
			<c:if test="${fn:length(myClubs)==1}">
				<c:forEach items="${myClubs }" var="myClub">
				<input type="hidden" id="away" name="away" value="${myTeam.club_num}">
				</c:forEach>
			</c:if>
			<c:if test="${fn:length(myClubs)>1}">
				<i class="fa fa-users icon"></i>
				<select class="time input-field" id="away" name="away">
					<option value="">우리팀 선택</option>
						<c:forEach items="${myClubs }" var="myClub">
							<option value="${myClub.club_num}">${myClub.club_name }</option>
						</c:forEach>
				</select>
			</c:if>
			</c:if>
			</div>
		</div>
		<span id="myTeam_msg"></span>
		<input type="button" class="btn-modal" id="close"value="취소">
		<input type="button" class="btn-modal" id="team_confirm" value="확인">
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
		
		$('#submit').click(function(){
			console.log("invite_detail : "+$('#invite_detail').val());
		
			
			console.log("myTeam.length : "+"${fn:length(myClubs)}");			
			<c:if  test="${fn:length(myClubs)>1}">
				$('#team').css('display','block');
				$('#team_confirm').click(function(){
					if($('#away').val()==''){
						$('#myTeam_msg').css('color','red').text('우리팀을 선택하세요');
				
					}else{
						$('#team').hide();
						postMatchRequest(${match.match_num }, ${user_id},$('#away').val(),$('#invite_detail').val());
					}
				});
				$('#away').click(function(){
					$('#myTeam_msg').text('');
				});
				$('#close').click(function(){
					$('#team').hide();
				});
			</c:if>
			<c:if test="${fn:length(myClubs)==1}">
			postMatchRequest( ${match.match_num}, ${user_id}, $('#away').val(), $('#invite_detail').val());
			</c:if>
			
			<c:if test="${fn:length(myClubs)==0}">
				$('#matchRequest_msg').text('소속팀의 관리자만 경기 신청 가능');
				$('#toast').css('display','block');
				$('#toast').click(function(){
					$('#toast').hide();
				});
				
			</c:if>
			
			function postMatchRequest(a,b,c,d){
				$.ajax({
					url:'postMatchRequest.do',
					type:'post', 
					data:{
						match_num: a,
						id:b,
						away:c,
						invite_detail:d
					},
					dataType:'json',
					cache:false,
					timeout:30000,
					success:function(data){
						console.log(data.result);
						if(data.result=='requested'){
							$('#matchRequest_msg').text('경기 신청  완료');
						}else if(data.result=='duplicated'){
							$('#matchRequest_msg').text('이미 경기 신청하셨습니다');
						}
						
						$('#toast').css('display','block');
						$('#confirm').click(function(){
							location.href='${pageContext.request.contextPath}/main/main.do';
						});
						$(window).click(function(){
							location.href='${pageContext.request.contextPath}/main/main.do';
						});
					},
					error:function(){
						alert('네트워크 오류 발생');
					}
				});
			}

		});
	});
  	
</script>