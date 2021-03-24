<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<div id="demo" class="carousel slide" data-ride="carousel">
	
	  <!-- Indicators -->
	  <ul class="carousel-indicators" id="carousel-indicator">
	    <li data-target="#demo" data-slide-to="0" class="active"></li>
	    <li data-target="#demo" data-slide-to="1"></li>
	    <li data-target="#demo" data-slide-to="2"></li>
	  </ul>
	  
	  <!-- The slideshow -->
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img class="slide-img" src="${pageContext.request.contextPath}/resources/images/1_1t-1.png">
	    </div>
	    <div class="carousel-item">
	      <img class="slide-img" src="${pageContext.request.contextPath}/resources/images/2_1t-1.png">
	    </div>
	    <div class="carousel-item">
	      <img class="slide-img" src="${pageContext.request.contextPath}/resources/images/3_1t-1.png">
	    </div>
	  </div>
	  
	  <!-- Left and right controls -->
	  <!-- <a class="carousel-control-prev" href="#demo" data-slide="prev">
	    <span class="carousel-control-prev-icon"></span>
	  </a> -->
	  <!-- <a class="carousel-control-next" href="#demo" data-slide="next">
	    <span class="carousel-control-next-icon"></span>
	  </a> -->
	</div>

<c:if test="${empty user_id }">
<div class="main-row">
	<div class="login">
		<p>간편 로그인하고 우리팀을 관리해보세요</p>
		<div class="login-wrapper">
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
</c:if>

<c:if test="${not empty user_id }">
<div class="v-padding margin-m-top">
	<span class="title-btw">경기 일정</span>
	<button class="btn_write blue-bg round-btn " id="btn_write" onclick="location.href='${pageContext.request.contextPath}/match/writeForm.do'">
		매치 작성
	</button>
</div>
<ul class="ul-list">
<c:if test="${empty match_list }">
	<li class="li-list">
		<div class="row">
			<div class="empty-wrapper margin-btm">
				<i class="far fa-grimace empty">
				</i>
				<span class=" small-font">예정된 경기가 없습니다.</span>
			</div>
		</div>
	</li>
</c:if>
<c:if test="${not empty match_list }">

<c:forEach var="match" items="${match_list}">
	<li class="li-list">
		<div class="gray-border">	
			<div class="match-info-wrapper">
				<div class="main-row">
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
					<span class="match-item no-margin">${match.address}</span>
					<a class="space-right" href="https://map.kakao.com/link/to/${match.address },${match.address_y},${match.address_x}">
					<i class="fas fa-chevron-right margin-left"></i>
					</a>
					<c:if test="${empty match.cancel }">
						<c:if test="${myClub.club_auth==4 }">
						<span class="material-icons more cursor xl-font" id="more" onclick="openMore(${match.match_num},'${myClub.club_name }','${myClub.club_num }','${match.match_date }','${match.address }','${match.start_time }',false)">more_vert</span>
						</c:if>
						<c:if test="${myClub.club_auth==5 && (myClub.club_num==match.home || match.home==match.away)}">
						<span class="material-icons more cursor xl-font" id="more" onclick="openMore(${match.match_num},'${myClub.club_name }','${myClub.club_num }','${match.match_date }','${match.address }','${match.start_time }',true)">more_vert</span>
						</c:if>
						<c:if test="${myClub.club_auth==5 && (myClub.club_num==match.away && match.home!=match.away) }">
						<span class="material-icons more cursor xl-font" id="more" onclick="openMore(${match.match_num},'${myClub.club_name }','${myClub.club_num }','${match.match_date }','${match.address }','${match.start_time }',false)">more_vert</span>
						</c:if>
					</c:if>
					<c:if test="${not empty match.cancel }">
					<span class="cancel negative full">${match.cancel}팀에 의해 취소됨</span>
					</c:if>
				</div>
				<div class="row ">
					<span class="match-item"><i class="far fa-calendar-alt margin-right"></i><fmt:formatDate value="${match.match_date}" pattern="MM월 dd일"/></span>
					<span class="match-item"><i class="far fa-clock margin-right"></i>${match.start_time }~${match.end_time }</span>
				</div>
			</div>
			<div class="row small-font margin-top margin-btm">
				<c:if test="${empty match.home_name }">
				<div class="team-info col">
					<div class="row margin-top margin-btm">
						<div class="centered">
							<div class="row padding-top">
							<span class="material-icons">
							error
							</span>
							<span class="disp-inbl margin-smtop">삭제된 팀</span>
							</div>
						</div>
					</div>
				</div>
				</c:if>
				<c:if test="${not empty match.home_name }">
				<div class="team-info col cursor" onclick="location.href='${pageContext.request.contextPath}/club/club_details.do?club_num=${match.home }'">
					<div class="row margin-top margin-btm">
						<div class="centered">
							<c:if test="${ match.home_filename ne 'undefined' }">
							<img src="${pageContext.request.contextPath }/club/imageView.do?club_num=${match.home}" alt="Avatar" class="avatar emblem">
							</c:if>
							<c:if test="${match.home_filename eq 'undefined'   }">
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
				<c:if test="${ not empty match.club_loc}">
				<div class="team-info col cursor" onclick="location.href='${pageContext.request.contextPath}/club/club_details.do?club_num=${match.away }'">
					<div class="row margin-top margin-btm">
						<div class="centered">
							<c:if test="${ not empty match.away_filename && match.away_filename ne 'undefined'  }">
							<img src="${pageContext.request.contextPath }/club/imageView.do?club_num=${match.away}" alt="Avatar" class="avatar emblem">
							</c:if>
							<c:if test="${ empty match.away_filename || match.away_filename eq 'undefined'   }">
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
				<c:if test="${empty match.club_loc}">
				<div class="team-info col">
					<div class="row margin-top margin-btm">
						<div class="centered">
							<c:if test="${match.away>0 }">
							<div class="row padding-top">
							<span class="material-icons">
							error
							</span>
							<span class="disp-inbl margin-smtop">${match.away_name }</span>
							</div>
							</c:if>
							<c:if test="${match.away==0 }">
							<div class="row padding-top">
							<span class="material-icons">
							campaign
							</span>
							<span class="disp-inbl margin-smtop">${match.away_name }</span>
							</div>
							</c:if>
							<c:if test="${ match.away==-1}">
							<img src="${pageContext.request.contextPath }/resources/images/blank_emblem.png" alt="Avatar" class="avatar emblem">
							<span class="disp-inbl margin-top">${match.away_name }</span>
							</c:if>
						</div>
					</div>
				</div>
				</c:if>
			</div>
			<div class="cursor">
				<div class="row">
					<label class="vote_label">
					<span class="vote-rating">
						<span class="voted relative" id="voted-attend-${match.match_num }" style="width:${match.attend/(match.attend+match.not_attend+match.undefined)*100}%">
							<span class="vote_txt">참석</span>
							<input type="radio" name="vote_${match.match_num }" value="1" id="attend_radio_${match.match_num }" class="vote">
							<span class="vote_checkmark"></span>
						</span>
					</span>
					</label>
					<span class="vote-wrapper" onclick="goToVoteDetail('${match.club_num}','${match.match_num }','${match.home_name }','${match.away_name}')">
						<span class="person material-icons">person</span>
						<span id="num_attend_${match.match_num }" class="vote_num">${match.attend}</span>
					</span>
				</div>	
				<div class="row" >
					<label class="vote_label">
					<span class="vote-rating">
						<span class="voted relative" id="voted-not_attend-${match.match_num }" style="width:${match.not_attend/(match.attend+match.not_attend+match.undefined)*100}%">
							<span class="vote_txt">불참</span>
							<input type="radio" name="vote_${match.match_num }" value="2" id="not_attend_radio_${match.match_num }" class="vote">
							<span class="vote_checkmark"></span>
						</span>
					</span>
					</label>
					<span class="vote-wrapper" onclick="goToVoteDetail('${match.club_num}','${match.match_num }','${match.home_name }','${match.away_name}')">
						<span class="person material-icons">person</span>
						<span id="num_nattend_${match.match_num }" class="vote_num">${match.not_attend}</span>
					</span>
				</div>	
				<div class="row">
					<label class="vote_label">
					<span class="vote-rating">
						<span class="voted relative" id="voted-not_fixed-${match.match_num }" style="width:${match.undefined/(match.attend+match.not_attend+match.undefined)*100}%">
							<span class="vote_txt">미정</span>
							<input type="radio" name="vote_${match.match_num }" value="3" id="undefined_radio_${match.match_num }" class="vote">
							<span class="vote_checkmark"></span>
						</span>
					</span>
					</label>
					<span class="vote-wrapper" onclick="goToVoteDetail('${match.club_num}','${match.match_num }','${match.home_name }','${match.away_name}')">
						<span class="person material-icons">person</span>
						<span id="num_undefined_${match.match_num }" class="vote_num" >${match.undefined}</span>
					</span>
				</div>
			</div>
			<input type="hidden" id="isVoted_${match.match_num }" value="${match.status !=0 }">
			<button class="block white-bg margin-top" id="vote_btn_${match.match_num }" onclick="toggleVote(${match.match_num})">투표하기</button>
			<div class="total_wrapper margin-btm">
				<span class="cursor" onclick="location.href='vote_detail.do?club_num=${match.club_num }&match_num=${match.match_num}&home_name=${match.home_name}&away_name=${match.away_name}&isMain=true'">
				<span class="total_person material-icons">person</span>
				<span id="total_${match.match_num }" class="total blue">${match.attend+match.not_attend+match.undefined}</span><span class="unit"> 명 투표 </span>
				<i class="total fas fa-chevron-right"></i>
				</span>
				<span class="share cursor" onclick="sendLinkForVote('${match.match_num}','${match.club_num}','${match.match_date}','${match.address}','${match.start_time}')">
				투표 공유하기
				<img class="kakaolink-share" src="${pageContext.request.contextPath }/resources/images/kakaolink_btn.png">
				</span>
			</div>
		</div>
		<div class="row">
			<div class="col centered">
				<button class="black-bg block no-border" onclick="location.href='voteForm.do?match_num=${match.match_num}&club_num=${myClub.club_num }&isMain=true'">
					<i class="fas fa-comment-dots m-margin-right"></i>댓글 보기
				</button>
			</div>
			<span class="border-btw"></span>
			<div class="col centered">
				<button class="black-bg block no-border" onclick="location.href='replyToVote.do?match_num=${match.match_num}&club_num=${match.club_num }'">
					<i class="fas fa-pen m-margin-right"></i>댓글 쓰기
				</button>
			</div>
		</div>
	</li>
</c:forEach>
</c:if>
</ul>
<div class="v-padding margin-m-top">
	<span class="title-btw">지난 경기 상대팀 평점 작성</span>
</div>
<ul class="ul-list non-border-btm">
<c:if test="${empty past_match }">
<li class="li-list">
	<div class="row margin-btm">
		<div class="empty-wrapper">
			<i class="far fa-grimace empty">
			</i>
			<span class=" small-font">최근 2주간 경기 중 평가할 상대팀이 없습니다.</span>
		</div>
	</div>
</li>
</c:if>
<c:if test="${not empty past_match }">

<c:forEach var="match" items="${past_match}">
<li class="li-list non-border-btm">
	<div class="gray-border">
		<div class="match-info-wrapper">
			<div class="main-row ">
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
			<div class="row ">
				<span class="match-item"><i class="far fa-calendar-alt margin-right"></i><fmt:formatDate value="${match.match_date}" pattern="MM월 dd일"/></span>
				<span class="match-item"><i class="far fa-clock margin-right"></i>${match.start_time }~${match.end_time }</span>
			</div>
		</div>
		<div class="match-info">
			<div class="main-row small-font margin-top margin-btm">
				<div class="team-info col cursor" onclick="location.href='${pageContext.request.contextPath}/club/club_details.do?club_num=${match.home }'">
					<div class="row margin-top margin-btm">
						<div class="centered">
							<c:if test="${match.home_filename ne 'undefined'  }">
							<img src="${pageContext.request.contextPath }/club/imageView.do?club_num=${match.home}" alt="Avatar" class="avatar emblem">
							</c:if>
							<c:if test="${match.home_filename eq 'undefined'   }">
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
				<span class="from-to">VS</span>
				<div class="team-info col cursor" onclick="location.href='${pageContext.request.contextPath}/club/club_details.do?club_num=${match.away }'">
					<div class="row margin-top margin-btm">
						<div class="centered">
							<c:if test="${match.away_filename ne 'undefined'}">
							<img src="${pageContext.request.contextPath }/club/imageView.do?club_num=${match.away}" alt="Avatar" class="avatar emblem">
							</c:if>
							<c:if test="${match.away_filename eq 'undefined'}">
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
						<span>${match.away_perform*2}</span>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<c:if test="${match.home==match.club_num}">
			<button class="block white-bg margin-top" onclick="location.href='ratingForm.do?match_num=${match.match_num}&club_num=${match.away }&isMain=true'">${match.away_name } 평점 작성 하기</button>
			</c:if>
			<c:if test="${match.away==match.club_num }">
			<button class="block white-bg margin-top" onclick="location.href='ratingForm.do?match_num=${match.match_num}&club_num=${match.home }&isMain=true'">${match.home_name } 평점 작성 하기</button>
			</c:if>
		</div>
	</div>
</li>
</c:forEach>
</c:if>
</ul>
</c:if>

<!-- The Modal -->
<div id="toast" class="submit_toast">

  <!-- Modal content -->
  	<div id="toast_content" class="submit_toast_content">
		<div class="row centered margin-btm centered-padding">
			<span id="club_msg">참석 여부 선택 후 투표해 주세요.</span>
		</div>
		<div class="row margin-top centered">
			<button class="alert-btn" id="vote-alert">확인</button>
		</div>
	</div>
</div>
<!-- The Modal -->
<div id="myModals" class="modals">
	<!-- Modal content -->
	<div class="modals-content">
		<span class="close_mod">&times;</span>
	    <img src="${pageContext.request.contextPath }/resources/images/event1.png" class="event"/>
	    <input type="button" class="block black-bg" onclick="location.href='${pageContext.request.contextPath}/board/event.do'" value="이벤트 참여하러 가기">
	    <span class="noseen">
				일주일 동안 닫기
			  <input type="checkbox" name="noseen">
	    </span>
	</div>
</div>
<div id="more_modal" class="confirm-modals">
	<!-- Modal content -->
	<div class="confirm-modal-content">
		<div class="sub-content" id="option">
			<button id="share" class="pos-btn">
			투표 링크 공유
			<img class="kakaolink-share" src="${pageContext.request.contextPath }/resources/images/kakaolink_btn.png">
			</button>
			<hr class="hr">
			<button id="detail" class="pos-btn">경기 상세</button>
		</div>
		<div class="sub-content">
			<button id="more-cancel-btn" class="neg-btn">닫기</button>
		</div>
	</div>
</div>
<div class="floating" id="floating">
	<button class="install-btn nowrap">
		<span class="m-font">앱 다운받기</span>
		<br>
		중요한 매칭 알림을 받을 수 있어요!
	</button>
	<span class="material-icons close_install_btn">
	close
	</span>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="https://appleid.cdn-apple.com/appleauth/static/jsapi/appleid/1/en_US/appleid.auth.js"></script>
<script>


Kakao.init('32776969383e4a77d92f6e18dd233bc5');

function sendLinkForVote(match_num,club_num,match_date,address,start_time) {
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
function openMore(match_num,club_name,club_num,match_date,address,start_time,modify){
		
		$('#options').replaceWith('');
		var itemStr='';
		if(modify){
			
			itemStr+=
				'<div id="options">'
				+'<hr class="hr">'
				+'<button id="modify" class="pos-btn">수정</button>'
				+'<hr class="hr">'
				+'<button id="delete" class="pos-btn red">삭제</button>'
				+'</div>';
			
			$(itemStr).appendTo('#option');
		}
		$('#more_modal').css('display','block');
		 
		$('#modify').click(function(){
			 location.href='${pageContext.request.contextPath}/match/modifyMatch.do?match_num='+match_num+'&club_num='+club_num;
		});
		$('#delete').click(function(){
			location.href='${pageContext.request.contextPath}/match/deleteMatch.do?match_num='+match_num+'&club_name='+club_name+'&club_num='+club_num;
		});
		$('#share').click(function(){
			sendLinkForVote(match_num,club_num,match_date,address,start_time);
			$('#more_modal').css('display','none');
		});
		$('#detail').click(function(){
			location.href='${pageContext.request.contextPath}/match/matchDetail.do?match_num='+match_num+'&isMain=true';
		});
		$('#more-cancel-btn').click(function(){
			$('#more_modal').css('display','none');
			
		});
		
 }
var state='';
if($('input:checkbox').is(':checked')){
 	state=true;
}else{
	state=false;
}
function login(throughTalk){
	
	Kakao.Auth.authorize({
		  redirectUri: $(location).attr('protocol')+"//"+"${pageContext.request.serverName }${pageContext.request.contextPath}/member/login.do"
		  ,state: state.toString()
		  ,throughTalk: throughTalk
	});
	
 }
function setCookie(cName, cValue, cDay){
	var expire = new Date();
	expire.setDate(expire.getDate() + cDay);
	cookies = cName + '=' + escape(cValue) + '; path=/ '; 
	if(typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
	document.cookie = cookies;
}
function getCookie(cookieName){
    var cookieValue=null;
    if(document.cookie){
        var array=document.cookie.split((escape(cookieName)+'='));
        if(array.length >= 2){
            var arraySub=array[1].split(';');
            cookieValue=unescape(arraySub[0]);
        }
    }
    return cookieValue;
}
function goToVoteDetail(club_num, match_num, home_name, away_name){
	
	location.href='${pageContext.request.contextPath}/main/vote_detail.do?club_num='+club_num+'&match_num='+match_num+'&home_name='+home_name+'&away_name='+away_name+'&isMain=true';
	
}

function toggleVote(match_num){
	
	//투표를 한 상태 일때  누르면 text 변경(다시 투표하기>투표하기), input enable, 
	let isVoted=($('#isVoted_'+match_num).val()==='true');
	console.log('isVoted : '+ isVoted+typeof(isVoted));
	if(isVoted){
		$('#vote_btn_'+match_num).text('투표하기');
		$('input[name=vote_'+match_num+']').removeAttr('disabled');
		$('#isVoted_'+match_num).val(false);
	} else {
		
		console.log('right before hasVoted');
		
		var hasVoted=$('input[name=vote_'+match_num+']').is(':checked');
		if(!hasVoted){
			console.log('in hasVoted');
			$('#club_msg').text('참석 여부 선택 후 투표해주세요.');
			$('#toast').css('display','flex');
			return;
		}
		console.log('right before ajax');
		$.ajax({
			url:'vote.do',
			type:'post',
			data:{
				id:'${user_id}',
				match_num:match_num,
				club_num:${myClub.club_num},
				status:$('input[name=vote_'+match_num+']:checked').val()
				},
				dataType:'json',
				cache:false,
				timeout:30000,
				success:function(data){
					
					var total=data.attend+data.not_attend+data.undefined;
					
					
					$('#voted-attend-'+match_num).css('width',(data.attend/total)*100+'%');
					$('#voted-not_attend-'+match_num).css('width',(data.not_attend/total)*100+'%');
					$('#voted-not_fixed-'+match_num).css('width',(data.undefined/total)*100+'%');
					$('#num_attend_'+match_num).text(data.attend);
					$('#num_nattend_'+match_num).text(data.not_attend);
					$('#num_undefined_'+match_num).text(data.undefined);
					$('#total_'+match_num).text(total); 
					var max=Math.max(data.attend,data.not_attend,data.undefined);
					setVoteStyle(max,data.attend,data.not_attend,data.undefined,match_num);
					
					$('#vote_btn_'+match_num).text('다시 투표하기');
					$('input[name=vote_'+match_num+']').attr('disabled', 'true');
					$('#isVoted_'+match_num).val(true);
					$('#club_msg').text('투표 완료했습니다.');
					$('#toast').css('display','flex');
					
				},
				error:function(){
					alert('네트워크 오류 발생');
				}
		});
	}
	
	//투표를 안한 상태 일때 누르면 input value 점검, DB update/insert, text 변경(다시 투표하기>투표하기), input disable, isVoted=true
}
function setVoteStyle(max,attend,not_attend,undefined,match_num){
	
	if (max==attend){
		$('#voted-attend-'+match_num).css('background-color','#00643c');
		$('#voted-not_attend-'+match_num).css('background-color','#888');
		$('#voted-not_fixed-'+match_num).css('background-color','#888');
	}else if(max==not_attend){
		$('#voted-attend-'+match_num).css('background-color','#888');
		$('#voted-not_attend-'+match_num).css('background-color','#00643c');
		$('#voted-not_fixed-'+match_num).css('background-color','#888')
	}else if(max==undefined){
		$('#voted-attend-'+match_num).css('background-color','#888');
		$('#voted-not_attend-'+match_num).css('background-color','#888');
		$('#voted-not_fixed-'+match_num).css('background-color','#00643c');
	}

}
 $(function(){
	 
	 
	 $('#vote-alert').click(function(){
			$('#toast').css('display','none');
	});
	 
	 var cookieValue=getCookie('noseen');
	 if(cookieValue==null||cookieValue==''){
		 $('#myModals').css('display','block');
	 }
	$('input:checkbox[name="noseen"]').click(function(){
		
		$('#myModals').css('display','none');
		setCookie('noseen','noseenForOneDay',7);
		
	});
	$('.close_mod').click(function(){
		
		$('#myModals').css('display','none');
		
	});

	var userAgent=navigator.userAgent.toLowerCase();

	if (userAgent.indexOf('android')==-1 && userAgent.indexOf('iphone')==-1) {
		$('#sel_login').css('display','block');
		$('input:checkbox').prop('checked',false);
	}
	 
	if(userAgent.indexOf('iphone')==-1 && userAgent.indexOf('mac')==-1 && userAgent.indexOf('ipad')==-1 ){
		$('#appleid-signin').css('display','none');
	} 
	
	 
	let matches=new Array();
	
	document.addEventListener('AppleIDSignInOnSuccess', function(data) {
	     
		 var detail = data.detail;
		 console.log(detail.authorization.id_token);
	     console.log(detail.user);
	     var nickname = '';
	     var email='';
	     if (detail.user != null){
	    	 nickname=detail.user.name.firstName +' '+ detail.user.name.lastName;
	    	 email=detail.user.email
	     }
	     
	     $.ajax({
	    	url:'${pageContext.request.contextPath}/member/signInWithApple.do',
	    	type:'post',
	    	data: {
	    		id_token:detail.authorization.id_token,
	    		nickname:nickname,
	    		email:email,
	    		state:state
	    	},
	    	timeout:30000,
	    	dataType:'json',
			cache:false,
			success:function(res){
				if(res.result='success'){
					if(res.loginType>0){
						location.href='${pageContext.request.contextPath}/member/agreement.do';
					}else{
						location.reload();
					}
					
				}
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
	     });
	});
	document.addEventListener('AppleIDSignInOnFailure', (error) => {
	     alert('로그인 실패. 잠시 후 다시 시도해주세요.');
	});
	<c:forEach items="${match_list}" var="match">
		var obj={};
		obj.match_num="${match.match_num}";
	 	obj.max="${match.max}";
	 	obj.attend="${match.attend}";
	 	obj.not_attend="${match.not_attend}";
	 	obj.undefined="${match.undefined}";
	 	obj.status="${match.status}";
	 	matches.push(obj);
	</c:forEach>
	for(var i=0; i<matches.length;i++){
	 	
		var max=matches[i].max;
	 	var attend=matches[i].attend;
	 	var not_attend=matches[i].not_attend;
	 	var not_fixed=matches[i].undefined;
	 	var match_num=matches[i].match_num;
	 	var status=matches[i].status;
	 	if (max==attend){
	 		$('#voted-attend-'+matches[i].match_num).css('background-color','#00643c');
	 	}else if(max==not_attend){
	 		$('#voted-not_attend-'+matches[i].match_num).css('background-color','#00643c');
	 	}else if(max==not_fixed){
	 		$('#voted-not_fixed-'+matches[i].match_num).css('background-color','#00643c');
	 	}
	 	
	 	if (status==0){
	 		$('#voted-attend-'+matches[i].match_num).css('background-color','#888');
	 		$('#voted-not_attend-'+matches[i].match_num).css('background-color','#888');
	 		$('#voted-not_fixed-'+matches[i].match_num).css('background-color','#888');
	 	}else{
	 		$('input[name=vote_'+matches[i].match_num+']').attr('disabled','true');
	 		$('#vote_btn_'+matches[i].match_num).text('다시 투표하기');
	 		
	 		if(status==1){
		 		$('#attend_radio_'+matches[i].match_num).prop('checked',true);
		 	}else if(status==2){
		 		$('#not_attend_radio_'+matches[i].match_num).prop('checked',true);
		 	}else if(status==3){
		 		$('#undefined_radio_'+matches[i].match_num).prop('checked',true);
		 	}
	 	}
	 	
   }
	
	
	$('.close_install_btn').click(function(){
		$('#floating').css('display','none');
	});
	
	if((userAgent.indexOf('android')>-1 || userAgent.indexOf('iphone')>-1) && !(userAgent.indexOf('inapp')>-1)){

		
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
	} 
	 
 });
	

</script>








