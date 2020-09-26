<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="row" id="top_wrap">
	<div class="fixed_top">
		<a href="club.do" >
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
				<div class="col club_main">
					<c:if test="${!empty myClub.club_img }">
					<img src="imageView.do?club_num=${myClub.club_num}" alt="Avatar" class="avatar emblem">
					</c:if>
					<c:if test="${empty myClub.club_img }">
					<img src="${pageContext.request.contextPath }/resources/images/blank_emblem.png" alt="Avatar" class="avatar emblem">
					</c:if>
					<span class="club_name">${myClub.club_name }</span><br>
					<span>${myClub.club_address }</span>
				</div>
				<div class="col">
					<span class="age">
						연령대 ${myClub.club_age }
					</span><br>
					<span class="uniform">
						유니폼
						<c:if test="${!empty myClub.club_color }">
						<span class="color" style="background-color:${myClub.club_color}"></span>
						</c:if>
						<c:if test="${empty myClub.club_color }">
						미정
						</c:if>
					</span>
				</div>
			</div>
			<span class="rating_count">총 ${myClub.rating_count }명의 평가</span>
			<div class="row">
				<div class="col">
					매너 
					<span class="star-rating">
						<span style="width:${myClub.manner*20}%"></span>
					</span><fmt:formatNumber value="${myClub.manner*2}" pattern="0.0"/>
				</div>
				<div class="col">
					실력  
					<span class="star-rating">
						<span style="width:${myClub.perform*20}%"></span>
					</span><fmt:formatNumber value="${myClub.perform*2}" pattern="0.0"/>
				</div>			
			</div>
		</li>
	</ul>
	<div class="tab-row" id="tab-row">
		<div class="tab-col">
			<button class="tab-btn small-font " onclick="openTap(event,'manageMatch')">매칭 현황</button>
		</div>
		<div class="tab-col">
			<button class="tab-btn small-font tab-active" onclick="openTap(event,'manageSchedule')">경기 일정</button>
		</div>
		<div class="tab-col">
			<button class="tab-btn small-font" onclick="openTap(event,'manageMember')">회원 관리</button>
		</div>
	</div>
	<div class="tab_detail" id="manageMatch" >
		<c:if test="${!empty away_club }">
		<h6>상대팀 초청한 경기(선택 후 상대팀 확정)</h6>
		<ul class="ul-list">
			<c:forEach items="${away_club }" var="away">
			<li class="li-list">
				<div class="row">
					<span class="match-item">${away.match_date }</span>
					<span class="match-item">${away.start_time } ~ ${away.end_time }</span>
					<span class="match-item">${away.address}</span>
					<c:if test="${away.type==1 }">
					<span class="match-item">축구</span>
					</c:if>
					<c:if test="${away.type==2 }">
					<span class="match-item">풋살</span>
					</c:if>
					<c:if test="${away.acceptance==1 }">
					<span id="status-${request_num}"class="status neutral">대기 중</span>
					</c:if>
					<c:if test="${away.acceptance==2 }">
					<span id="status-${request_num}"class="status positive">수락</span>
					</c:if>
					<c:if test="${away.acceptance==3 }">
					<span id="status-${request_num}"class="status negative">거절</span>
					</c:if>
				</div>
				<div class="row">
					<div class="col club_main">
						<c:if test="${!empty away.club_img }">
							<img src="imageView.do?club_num=${away.club_num }" class="avatar emblem">
						</c:if>
						<c:if test="${empty away.club_img }">
							<img src="${pageContext.request.contextPath}/resources/images/blank_emblem.png" class="avatar emblem">
						</c:if>
						<span class="club_name">${away.club_name }</span><br>
						<span class="uniform">유니폼
							<c:if test="${!empty away.club_color }">
								<span class="color" style="background-color:${away.club_color}"></span>
							</c:if>
							<c:if test="${empty away.club_color }">
								 미정
							</c:if>
						</span>
					</div>
					<div class="col">
						<span class='rating'>매너</span>
							<span class='star-wrap'>
								<span class='star-rating'>
									<span style='width:${away.manner*20 }%'></span>
								</span><fmt:formatNumber value="${away.manner*2}" pattern="0.0"/><br>
							<span class='rating'>실력</span>
								<span class='star-rating'>
									<span style='width:${away.perform*20 }%'></span>
								</span><fmt:formatNumber value="${away.perform*2}" pattern="0.0"/><br>
							</span>
						<span class="age">연령대 ${away.club_age }</span>
					</div>
				</div>
				<span class="material-icons collapsible">add_circle</span>
				<div class="collapsible-content">
					<p>${away.request_detail}
						ksahdfkhkwhfjkl
						Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
					</p>
					<c:if test="${away.acceptance==1 }">
					<div class="row">
						<div class="half_col">
							<button class="first-btn" onclick="answerForMatchReq(${away.request_num},'${away.club_name }',3,${away.club_num },${away.match_num })">거절</button>
						</div>
						<div class="half_col">
							<button class="second-btn" onclick="answerForMatchReq(${away.request_num},'${away.club_name }',2,${away.club_num },${away.match_num })">수락</button>
						</div>
					</div>
					</c:if>
				</div>
			</li>
			</c:forEach>
		</ul>
		</c:if>
		<c:if test="${!empty home_club}">
		<h6>경기 신청한 내역</h6>
		<ul class="ul-list">
			<c:forEach items="${home_club }" var="home">
			<c:if test="${home.club_num != myClub.club_num }">
			<li class="li-list">
				<div class="row">
					<span class="match-item">${home.match_date }</span>
					<span class="match-item">${home.start_time } ~ ${home.end_time }</span>
					<span class="match-item">${home.address}</span>
					<c:if test="${home.type==1 }">
					<span class="match-item">축구</span>
					</c:if>
					<c:if test="${home.type==2 }">
					<span class="match-item">풋살</span>
					</c:if>
					<c:if test="${home.acceptance==1 }">
					<span id="status-${request_num}"class="status neutral">대기 중</span>
					</c:if>
					<c:if test="${home.acceptance==2 }">
					<span id="status-${request_num}"class="status positive">수락</span>
					</c:if>
					<c:if test="${home.acceptance==3 }">
					<span id="status-${request_num}"class="status negative">거절</span>
					</c:if>
				</div>
				<div class="row">
					<div class="col club_main">
						<c:if test="${!empty home.club_img }">
							<img src="imageView.do?club_num=${home.club_num}"  class="avatar emblem">
						</c:if>
						<c:if test="${empty home.club_img }">
							<img src="${pageContext.request.contextPath}/resources/images/blank_emblem.png" class="avatar emblem">
						</c:if>
						<span class="club_name">${home.club_name }</span><br>
						<span class="uniform">유니폼
							<c:if test="${!empty home.club_color }">
								<span class="color" style="background-color:${home.club_color}"></span>
							</c:if>
							<c:if test="${empty home.club_color }">
								 미정
							</c:if>
						</span>
					</div>
					<div class="col">
						<span class='rating'>매너</span>
							<span class='star-wrap'>
								<span class='star-rating'>
									<span style='width:${home.manner*20 }%'></span>
								</span><fmt:formatNumber value="${home.manner*2}" pattern="0.0"/><br>
							<span class='rating'>실력</span>
								<span class='star-rating'>
									<span style='width:${home.perform*20 }%'></span>
								</span><fmt:formatNumber value="${home.perform*2}" pattern="0.0"/><br>
							</span>
						<span class="age">연령대 ${home.club_age }</span>
					</div>
				</div>
				<span class="material-icons collapsible">add_circle</span>
				<div class="collapsible-content">
					<p>${home.match_detail}
						ksahdfkhkwhfjkl
						Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
					</p>
				</div>
			</li>
			</c:if>
			</c:forEach>
		</ul>
		</c:if>
	</div>
	<div class="tab_detail" id="manageSchedule" style="display:block" >
		<c:if test="${not empty user_id }">
		<div class="match-head">
				<span class="title-btw">경기 일정</span>
				<button class="btn_write" onclick="location.href='${pageContext.request.contextPath}/match/writeForm.do'">
					<span>매치 작성</span> <span class="material-icons">create</span>
				</button>
		</div>
		<hr class="hr">
		<c:if test="${not empty match_list }">
		<ul class="match-list">
		<c:forEach var="match" items="${match_list}">
			<li class="match">
				<div class="match-info">
					<div class="main-row">
						<span class="match-item">${match.match_date}</span>
						<span class="match-item">${match.start_time }~${match.end_time }</span>
						<a href="https://map.kakao.com/link/to/${match.address },${match.address_y},${match.address_x}" target="_blank">
						<span class="match-item">${match.address}</span>
						</a>
						<span class="match-item">
							<c:if test="${match.type==1 }">축구</c:if>
							<c:if test="${match.type==2 }">풋살</c:if>
						</span>
					</div>
				</div>
				<div class="main-row">
					<div class="team-info col">
						${match.home_name}<br>
						매너 : ${match.home_manner*2}
						<span class="star-wrap">
						<span class="star-rating">
							<span style="width:${match.home_manner*20}%"></span>
						</span>
						</span><br>
						실력 : ${match.home_perform*2}
						<span class="star-rating">
							<span style="width:${match.home_perform*20}%"></span>
						</span>
					</div>
					<span class="from-to">VS</span>
					<div class="team-info col">
					<c:if test="${match.away != 0 }">
						${match.away_name}<br>
						매너 : ${match.away_manner*2}
						<span class="star-wrap">
						<span class="star-rating">
							<span style="width:${match.away_manner*20}%"></span>
						</span>
						</span><br>
						실력 : ${match.away_perform*2}
						<span class="star-rating">
							<span style="width:${match.away_perform*20}%"></span>
						</span>
					</c:if>
					<c:if test="${match.away == 0 }">
						<span>모집중</span>
					</c:if>
					</div>
				</div>
				<!-- 내 팀이 -->
				<div class="main-row">
					<span class="vote-rating">
						<c:if test="${match.attend==0 }">
						<span class="voted" style="background-color:transparent">
							<span class="vote-label">참석</span>
						</span>
						</c:if>
						<c:if test="${match.attend!=0 && match.max==match.attend }">
						<span class="voted" 
							style=
								"width:${match.attend/(match.attend+match.not_attend+match.undefined)*100}%;
								background-color:#A4D3A6;">
							<span class="vote-label">참석</span>
						</span>
						</c:if>
						<c:if test="${match.attend!=0 && match.max!=match.attend }">
						<span class="voted" 
							style=
								"width:${match.attend/(match.attend+match.not_attend+match.undefined)*100}%;
								background-color:#bfbfbf;">
							<span class="vote-label">참석</span>
						</span>
						</c:if>
						<span id="num_attend" class="vote_num">${match.attend}</span>
						<span class="person material-icons">person</span>
					</span>
				</div>	
				<div class="main-row">
					<span class="vote-rating">
						<c:if test="${match.not_attend==0 }">
						<span class="voted" 
							style="background-color:transparent;">
							<span class="vote-label">불참</span>
						</span>
						</c:if>
						<c:if test="${match.not_attend!=0 && match.max==match.not_attend }">
						<span class="voted" 
							style=
								"width:${match.not_attend/(match.attend+match.not_attend+match.undefined)*100}%;
								background-color:#A4D3A6;">
							<span class="vote-label">불참</span>
						</span>
						</c:if>
						<c:if test="${match.not_attend!=0 && match.max!=match.not_attend }">
						<span class="voted" 
							style=
								"width:${match.not_attend/(match.attend+match.not_attend+match.undefined)*100}%;
								background-color:#bfbfbf;">
							<span class="vote-label">불참</span>
						</span>
						</c:if>
						<span id="num_nattend" class="vote_num">${match.not_attend}</span>
						<span class="person material-icons">person</span>
					</span>
				</div>	
				<div class="main-row">
					<span class="vote-rating">
						<c:if test="${match.undefined==0 }">
						<span class="voted" style="background-color:transparent;">
							<span class="vote-label">미정</span>
						</span>
						</c:if>
						<c:if test="${match.undefined!=0 && match.max==match.undefined }">
						<span class="voted" 
							style=
								"width:${match.undefined/(match.attend+match.not_attend+match.undefined)*100}%;
								background-color:#A4D3A6;">
							<span class="vote-label">미정</span>
						</span>
						</c:if>
						<c:if test="${match.undefined!=0 && match.max!=match.undefined }">
						<span class="voted" 
							style=
								"width:${match.undefined/(match.attend+match.not_attend+match.undefined)*100}%;
								background-color:#bfbfbf;">
							<span class="vote-label">미정</span>
						</span>
						</c:if>
						<span id="num_undefined" class="vote_num">${match.undefined}</span>
						<span class="person material-icons">person</span>
					</span>
				</div>
				<c:if test="${match.home!=match.away && match.home==match.club_num}">
				<button class="block" 
					onclick="location.href='voteForm.do?match_num=${match.match_num}&club_num=${match.club_num }'">
					${match.home_name } <c:if test="${ match.status !=0}">다시 투표하기</c:if><c:if test="${match.status ==0 }">투표하기</c:if></button>
				</c:if>
				<c:if test="${match.home!=match.away && match.away==match.club_num}">
				<button class="block" 
					onclick="location.href='voteForm.do?match_num=${match.match_num}&club_num=${match.club_num }'">
					${match.away_name } <c:if test="${match.status !=0 }">다시 투표하기</c:if><c:if test="${match.status ==0 }">투표하기</c:if></button>
				</c:if>
				<c:if test="${match.home==match.away}">
				<button class="block" 
					onclick="location.href='voteForm.do?match_num=${match.match_num}&club_num=${match.club_num }'">
					<c:if test="${match.status !=0 }">다시 투표하기</c:if><c:if test="${match.status ==0 }">투표하기</c:if></button>
				</c:if>
			</li>
			<hr class="hr">
		</c:forEach>
		</ul>
		</c:if>
		<div class="match-head">
				<span class="title-btw">지난 경기 상대팀 평점 작성</span>
		</div>
		<hr class="hr">
		<c:if test="${not empty past_match }">
		<ul class="match-list">
		<c:forEach var="match" items="${past_match}">
		<c:if test="${match.home!=match.away && !fn:contains(match.away_name,'미등록팀')}">
		<li class="match">
			<div class="match-info">
				<div class="main-row">
					<span class="match-item">${match.match_date}</span>
					<span class="match-item">${match.start_time }~${match.end_time }</span>
					<span class="match-item">${match.address}</span>
					<span class="match-item">
						<c:if test="${match.type==1 }">축구</c:if>
						<c:if test="${match.type==2 }">풋살</c:if>
					</span>
				</div>
			</div>
			<div class="match-info">
				<div class="main-row">
					<div class="team-info col">
						${match.home_name}<br>
						매너 : ${match.home_manner*2}/10
						<span class="star-wrap">
						<span class="star-rating">
							<span style="width:${match.home_manner*20}%"></span>
						</span>
						</span><br>
						실력 : ${match.home_perform*2}/10
						<span class="star-rating">
							<span style="width:${match.home_perform*20}%"></span>
						</span>
					</div>
					<span class="from-to">VS</span>
					<div class="team-info col">
						${match.away_name}<br>
						매너 : ${match.away_manner*2}/10
						<span class="star-wrap">
						<span class="star-rating">
							<span style="width:${match.away_manner*20}%"></span>
						</span>
						</span><br>
						실력 : ${match.away_perform*2}/10
						<span class="star-rating">
							<span style="width:${match.away_perform*20}%"></span>
						</span>
					</div>
				</div>
			</div>
			<c:if test="${match.home==match.club_num}">
			<button class="block" onclick="location.href='ratingForm.do?match_num=${match.match_num}&club_num=${match.away }'">${match.away_name } 평점 작성 하기</button>
			</c:if>
			<c:if test="${match.away==match.club_num }">
			<button class="block" onclick="location.href='ratingForm.do?match_num=${match.match_num}&club_num=${match.home }'">${match.home_name } 평점 작성 하기</button>
			</c:if>
		</li>
		<hr class="hr"> 
		</c:if>
		</c:forEach>
		</ul>
		</c:if>
		</c:if>
	</div>
	<div class="tab_detail" id="manageMember" >
		
	</div>
</div>
<div id="answer_modal" class="confirm-modals">
	<!-- Modal content -->
	<div class="confirm-modal-content">
		<div class="sub-content">
			<span id="answer_msg"></span>
			<hr>
			<button id="answer-btn" class="pos-btn"></button>
		</div>
		<div class="sub-content">
			<button id="cancel-btn" class="neg-btn">취소</button>
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function answerForMatchReq(request_num,club_name,acceptance,club_num,match_num){
	if(acceptance==2){
		$('#answer_msg').text(club_name+'의 경기 신청을 수락하겠습니까?');
		var info='<br>(해당 경기에 '+club_name+'외 나머지 신청은 거절합니다)'
		$('#answer_msg').append(info);
		$('#answer-btn').text('수락');
	}else if(acceptance==3){
		$('#answer_msg').text(club_name+'의 경기 신청을 거절하겠습니까?');
		$('#answer-btn').text('거절');
	}
	$('#answer_modal').css('display','block');
	$('#answer-btn').click(function(){
		$.ajax({
			url:'answerForMatch.do',
			type:'post',
			data:{
				request_num:request_num,
				acceptance:acceptance,
				club_num:club_num,
				match_num:match_num},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(data){
				if(data.result=="updated"){
					console.log("updated 진입");
					location.reload();
				}
				if(data.result=="errors"){
					
					alert('오류 발생');
					$(window).click(function(){
						$("#answer_modal").css("display","none");
					});
				}
				
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
		
	});
	var reject_modal=document.getElementById('answer_modal');
	$('#cancel-btn').click(function(){
		$('#answer_modal').css('display','none');
	});
	window.onclick = function(event) {
		if (event.target == answer_modal) {
			reject_modal.style.display = "none";
		}
	}
}


function openTap(evt,tab){
	$('.tab_detail').css('display','none');
	$('.tab-btn').removeClass(' tab-active');
	var tap=document.getElementById(tab);
	tap.style.display="block";
	evt.currentTarget.className += " tab-active";
}
window.onscroll=function(){myFunction()};
var tab=document.getElementById("tab-row");
var sticky=tab.offsetTop;
function myFunction(){
	if(window.pageYOffset+60 >=sticky){
		tab.classList.add("sticky");
	}else{
		tab.classList.remove("sticky");
	}
}

$(function(){
	var collap = document.getElementsByClassName("collapsible");
	var i;

	for (i = 0; i < collap.length; i++) {
		collap[i].addEventListener("click", function() {
	    var panel = this.nextElementSibling;
	    if (panel.style.maxHeight) {
	    	panel.style.maxHeight = null;
	    	$(this).text("add_circle");
	    } else {
	    	$(this).text("remove_circle");
	      	panel.style.maxHeight = panel.scrollHeight + "px";
	    } 
	  });
	}
});

	


</script>