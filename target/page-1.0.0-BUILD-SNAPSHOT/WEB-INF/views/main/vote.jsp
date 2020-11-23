<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${empty user_id }">
<div id="login_modal" class="certify-modals" style="display:block">
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
	</div>
</div>
</c:if>
<c:if test="${not empty user_id }">
<div class="row" id="top_wrap">
	<div class="fixed_top">
		<c:if test="${isMain==true }">
		<a href="${pageContext.request.contextPath}/main/main.do" >
		<span class="material-icons" id="cancel">close</span>
		</a>
		</c:if>
		<c:if test="${isMain==false }">
		<a href="${pageContext.request.contextPath}/club/manageClub.do?club_num=${myClub.club_num}" >
		<span class="material-icons" id="chevron_left">chevron_left</span>
		</a>
		</c:if>
		<div class="topnav-centered">
			<a href="#home" class="active">${title }</a>
		</div>
	</div>
</div>
<div class="blank_div"></div>
<ul class="ul-list">
	<li class="li-list">	
		<div class="match-info-wrapper">
			<div class="row">
				<c:if test="${match.type==1 }">
				<span class="match-item last soccer">
				축구
				</span>	
				</c:if>
				<c:if test="${match.type==2 }">
				<span class="match-item last futsal">
				풋살
				</span>	
				</c:if>
				<span class="match-item">${match.address}</span>
			</div>
			<div class="row gray">
				<span class="match-item"><i class="far fa-calendar-alt margin-right"></i><fmt:formatDate value="${match.match_date}" pattern="MM월 dd일"/></span>
				<span class="match-item"><i class="far fa-clock margin-right"></i>${match.start_time }~${match.end_time }</span>
			</div>
		</div>
		<div class="row small-font margin-top margin-btm">
			<c:if test="${empty match.home_name }">
			<div class="team-info col">
				<span class="disp-inbl margin-top">삭제된 팀</span>
			</div>
			</c:if>
			<c:if test="${not empty match.home_name }">
			<div class="team-info col cursor" onclick="location.href='${pageContext.request.contextPath}/club/club_details.do?club_num=${match.home }'">
				<div class="row margin-top margin-btm">
					<div class="centered">
						<c:if test="${not empty match.home_filename }">
						<img src="${pageContext.request.contextPath }/club/imageView.do?club_num=${match.home}" alt="Avatar" class="avatar emblem">
						</c:if>
						<c:if test="${empty match.home_filename  }">
						<img src="${pageContext.request.contextPath }/resources/images/blank_emblem.png" alt="Avatar" class="avatar emblem">
						</c:if>
						<span class="disp-inbl margin-top">${match.home_name}</span>
					</div>
				</div>
				<div class="centered">
					<span class="margin-right">매너</span> 
					<span class="star-rating">
						<span style="width:${match.home_manner*20}%"></span>
					</span>
					<span>${match.home_manner*2}</span>
				</div>
				<div class="centered">
					<span class="margin-right">실력</span> 
					<span class="star-rating">
						<span style="width:${match.home_perform*20}%"></span>
					</span>
					${match.home_perform*2}
				</div>
			</div>
			</c:if>
			<span class="from-to">VS</span>
			<c:if test="${match.away != 0 }">
				<c:if test="${not empty match.away_name }">
				<div class="team-info col cursor" onclick="location.href='${pageContext.request.contextPath}/club/club_details.do?club_num=${match.away }'">
					<div class="row margin-top margin-btm">
						<div class="centered">
							<c:if test="${not empty match.away_filename }">
							<img src="${pageContext.request.contextPath }/club/imageView.do?club_num=${match.away}" alt="Avatar" class="avatar emblem">
							</c:if>
							<c:if test="${empty match.away_filename  }">
							<img src="${pageContext.request.contextPath }/resources/images/blank_emblem.png" alt="Avatar" class="avatar emblem">
							</c:if>
							<span class="disp-inbl margin-top">${match.away_name}</span>
						</div>
					</div>
					<div class="centered">
						<span class="margin-right">매너</span> 
						<span class="star-rating">
							<span style="width:${match.away_manner*20}%"></span>
						</span>
						<span>${match.away_manner*2}</span>
					</div>
					<div class="centered">
						<span class="margin-right">실력</span> 
						<span class="star-rating">
							<span style="width:${match.away_perform*20}%"></span>
						</span>
						${match.away_perform*2}
					</div>
				</div>
				</c:if>
				<c:if test="${empty match.away_name }">
				<div class="team-info col">
					<span class="disp-inbl margin-top">삭제된 팀</span>
				</div>
				</c:if>
			</c:if>
			<c:if test="${match.away == 0 }">
			<div class="team-info col">
				<div class="row margin-top">
					<div class="margin-top centered">
						<span class="disp-bl">모집 중</span>
					</div>
				</div>
			</div>
			</c:if>
		</div>
		<input type="hidden" id="id" value="${user_id }">
		<input type="hidden" id="match_num" value="${match.match_num }">
		<input type="hidden" id="club_num" value="${myClub.club_num }">
		<div class="cursor" onclick="location.href='${pageContext.request.contextPath}/main/vote_detail.do?club_num=${match.club_num }&match_num=${match.match_num }&home_name=${match.home_name }&away_name=${match.away_name }'">
			<div class="row">
				<span class="vote-rating">
					<span class="voted" id="attend" style="width:${match.attend/(match.attend+match.not_attend+match.undefined)*100}%">
						<span class="vote-label">참석
							<i class="fas fa-check sign"  id="attend_sign" ></i>
						</span>
					</span>
					<span class="vote-wrapper">
						<span class="person material-icons">person</span>
						<span id="num_attend" class="vote_num">${match.attend}</span>
					</span>
				</span>
			</div>
			<div class="row">
				<span class="vote-rating">
					<span class="voted" id="not_attend" style="width:${match.not_attend/(match.attend+match.not_attend+match.undefined)*100}%">
						<span class="vote-label">불참
							<i class="fas fa-check sign"  id="not_attend_sign" ></i>
						</span>
					</span>
					<span class="vote-wrapper">
						<span class="person material-icons">person</span>
						<span id="num_nattend" class="vote_num">${match.not_attend}</span>
					</span>
				</span>
			</div>	
			<div class="row">
				<span class="vote-rating">
					<span class="voted" id="undefined" style="width:${match.undefined/(match.attend+match.not_attend+match.undefined)*100}%">
						<span class="vote-label">미정
							<i class="fas fa-check sign"  id="undefined_sign" ></i>
						</span>
					</span>
					<span class="vote-wrapper">
						<span class="person material-icons">person</span>
						<span id="num_undefined" class="vote_num">${match.undefined}</span>
					</span>
				</span>
			</div>
		</div>
		<hr>
		<span class="input-label">참석 여부 선택</span>
		<div class="row space-around">
			<label class="chip m-wider">
				<span class="chip-txt">참석</span>
				<input type="radio" name="vote" value="1" id="attend_radio" class="vote">
				<span class="checkmark"></span>
			</label>
			<label class="chip m-wider">
				<span class="chip-txt">불참</span>
				<input type="radio" name="vote" value="2" id="not_attend_radio" class="vote">
				<span class="checkmark"></span>
			</label>
			<label class="chip m-wider">
				<span class="chip-txt">미정</span>
				<input type="radio" name="vote" value="3" id="undefined_radio" class="vote">
				<span class="checkmark"></span>
			</label>
		</div>
		<hr class="hr">
		<div class="total_wrapper margin-btm">
			<span class="cursor" onclick="location.href='vote_detail.do?club_num=${match.club_num }&match_num=${match.match_num}&home_name=${match.home_name}&away_name=${match.away_name}'">
			<span class="total_person material-icons">person</span>
			<span id="total" class="total">${match.attend+match.not_attend+match.undefined}</span><span class="unit"> 명 투표 </span>
			<i class="total fas fa-chevron-right"></i>
			</span>
			<span class="share cursor" onclick="sendLink('${match.match_num}','${match.club_num}','${match.match_date}','${match.address}','${match.start_time}')">
			투표 공유하기
			<img class="kakaolink-share" src="${pageContext.request.contextPath }/resources/images/kakaolink_btn.png">
			</span>
		</div>
	</li>
</ul>
<button class="reply-btn" onclick="location.href='replyToVote.do?match_num=${match.match_num}&club_num=${match.club_num }&isMain=${isMain }'">
	<span class="material-icons icon-margin gray">
	account_circle
	</span>
	<span class="gray small-font">댓글 입력</span>
</button>
<c:if test="${not empty answers }">
<div id="answer-wrapper" class="margin-top">
<ul class="ul-list non-border-btm">
<c:forEach items="${answers }" var="answer">
<li class="li-list">
	<div class="main-row">
		<div class="x-smaller">
			<c:if test="${empty answer.thumbnail_image }">
			<img src="${pageContext.request.contextPath }/resources/images/profile.png" alt="Avatar" class="avatar">
			</c:if>
			<c:if test="${not empty answer.thumbnail_image }">
			<img src="${answer.thumbnail_image }" alt="Avatar" class="avatar">
			</c:if>
		</div>
		<div class="x-bigger">
			<div class="main-row">
			<span class="nickname">${answer.nickname }</span>
			<span class="small-font bold gray right">${answer.register_date }</span>
			<c:if test="${answer.id==user_id }">
			<span class="material-icons more cursor m-font gray" id="more" onclick="modifyAnswer(${answer.voteAnswer_num})" >more_vert</span>
			</c:if>
			</div>
			<p>${answer.content }</p>
		</div>
	</div>
</li>
</c:forEach>
</ul>
</div>
</c:if>
<div id="more_modal" class="confirm-modals">
	<!-- Modal content -->
	<div class="confirm-modal-content">
		<div class="sub-content">
			<button id="modify" class="pos-btn">수정</button>
			<hr>
			<button id="delete" class="pos-btn red">삭제</button>
		</div>
		<div class="sub-content">
			<button id="more-cancel-btn" class="neg-btn">취소</button>
		</div>
	</div>
</div>
</c:if>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
Kakao.init('32776969383e4a77d92f6e18dd233bc5');
function sendLink(match_num,club_num,match_date,address,start_time) {
    Kakao.Link.sendCustom({
    	templateId: 39879,
    	templateArgs: {
    		'msg_title': '경기 참석 투표를 완료해주세요.',
    		'msg_description': address+'에서 '+match_date+'일 '+start_time+'에 경기 예정입니다.',
    		'club_num': club_num,
    		'match_num': match_num,
    		'isMain': true
    	}
    })
  }
function loginProcess(){
	location.href="https://kauth.kakao.com/oauth/authorize?client_id=0646bcb11e5b9bbdb24fc9153f7693ae&redirect_uri=http://${pageContext.request.serverName }:${pageContext.request.serverPort}${pageContext.request.contextPath}/member/voteLogin.do&response_type=code&state=${match.match_num }-${match.club_num}-${isMain}";
};
function modifyAnswer(voteAnswer_num){
	$('#more_modal').css('display','block');
	$('#delete').click(function(){
		$.ajax({
			url:'deleteVoteAnswer.do',
			type:'post',
			data:{
				voteAnswer_num: voteAnswer_num,
			},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(data){
				if(data.result=='success'){
					location.reload();
				}
				if(data.result=='errors'){
					
					alert('오류 발생');
					$(window).click(function(){
						$('#more_modal').css('display','none');
					});
				}
				
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
		
	});
	$('#modify').click(function(){
		location.href='modifyVoteAnswer.do?voteAnswer_num='+voteAnswer_num+'&isMain=${isMain}';
	});
}
function setVoteStyle(max,attend,not_attend,undefined,status){
	
	if(max==0){
		$('#attend').css('background-color','transparent');
		$('#not_attend').css('background-color','transparent');
		$('#undefined').css('background-color','transparent');
	}else if (max==attend){
		console.log('max==attend 진입');
		$('#attend').css('background-color','#a4d3a6');
		$('#not_attend').css('background-color','#bfbfbf');
		$('#undefined').css('background-color','#bfbfbf');
	}else if(max==not_attend){
		$('#attend').css('background-color','#bfbfbf');
		$('#not_attend').css('background-color','#a4d3a6');
		$('#undefined').css('background-color','#bfbfbf')
	}else if(max==undefined){
		$('#attend').css('background-color','#bfbfbf');
		$('#not_attend').css('background-color','#bfbfbf');
		$('#undefined').css('background-color','#a4d3a6');
	}
	if( status ==  1){
		$('#attend_sign').css('display','inline-block');
		$('#not_attend_sign').css('display','none');
		$('#undefined_sign').css('display','none');
	}else if(status == 2){
		$('#attend_sign').css('display','none');
		$('#not_attend_sign').css('display','inline-block');
		$('#undefined_sign').css('display','none');
	}else if(status == 3){
		$('#attend_sign').css('display','none');
		$('#not_attend_sign').css('display','none');
		$('#undefined_sign').css('display','inline-block');
	}else{
		$('#attend_sign').css('display','none');
		$('#not_attend_sign').css('display','none');
		$('#undefined_sign').css('display','none');
	}
}

	$(function(){
		
		$('#more').click(function(){
			
			$('#more_modal').css('display','block');
		});
		$('#more-cancel-btn').click(function(){
			$('#more_modal').css('display','none');
		});
		if(${match.status}==1){
			$('#attend_radio').prop('checked',true);
		}else if(${match.status}==2){
			$('#not_attend_radio').prop('checked',true);
		}else if(${match.status}==3){
			$('#undefined_radio').prop('checked',true);
		}
		
		setVoteStyle(${match.max},${match.attend},${match.not_attend},${match.undefined},${match.status});
		
		$('.vote').click(function(){
			
			var status=$(this).val();
			$.ajax({
				url:'vote.do',
				type:'post',
				data:{id:$('#id').val(),
					match_num:$('#match_num').val(),
					club_num:$('#club_num').val(),
					status:status},
					dataType:'json',
					cache:false,
					timeout:30000,
					success:function(data){
						
						var total=data.attend+data.not_attend+data.undefined;
						
						$('#attend').css('width',(data.attend/total)*100+'%');
						$('#not_attend').css('width',(data.not_attend/total)*100+'%');
						$('#undefined').css('width',(data.undefined/total)*100+'%');
						$('#num_attend').text(data.attend);
						$('#num_nattend').text(data.not_attend);
						$('#num_undefined').text(data.undefined);
						$('#total').text(total);
						var max=Math.max(data.attend,data.not_attend,data.undefined);
						setVoteStyle(max,data.attend,data.not_attend,data.undefined,status)
						
					},
					error:function(){
						alert('네트워크 오류 발생');
					}
			});
		});
	});

</script>