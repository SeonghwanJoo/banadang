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
		<p>간편 로그인하고 GentlePro에서 우리팀을 관리해보세요</p>
		<a
			href="https://kauth.kakao.com/oauth/authorize?
	client_id=0646bcb11e5b9bbdb24fc9153f7693ae
	&redirect_uri=http://${pageContext.request.serverName }:${pageContext.request.serverPort}${pageContext.request.contextPath}/member/login.do
	&response_type=code">
			<img class="login_btn"
			src="${pageContext.request.contextPath}/resources/images/kakao_login/ko/kakao_login_medium_wide.png">
		</a>
	</div>
</div>
</c:if>

<c:if test="${not empty user_id }">
<div class="border-btm v-padding">
	<span class="title-btw">경기 일정</span>
	<button class="btn_write" id="btn_write" onclick="location.href='${pageContext.request.contextPath}/match/writeForm.do'">
		<span>매치 작성</span><i class="fas fa-pen margin-left"></i>
	</button>
</div>
<c:if test="${empty match_list }">
<div class="row">
	<div class="empty-wrapper">
		<i class="far fa-grimace empty">
		</i>
		<span class=" small-font">예정된 경기가 없습니다.</span>
	</div>
</div>
</c:if>
<c:if test="${not empty match_list }">
<ul class="ul-list">
<c:forEach var="match" items="${match_list}">
	<li class="li-list">
		<div class="match-info-wrapper">
			<div class="main-row ">
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
				<a href="https://map.kakao.com/link/to/${match.address },${match.address_y},${match.address_x}" target="_blank">
					<span class="match-item">${match.address}</span>
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
				<span class="status negative full">${match.cancel}팀에 의해 취소됨</span>
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
			<c:if test="${not empty match.away_name && match.away != 0}">
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
		<div class="cursor" onclick="location.href='${pageContext.request.contextPath}/main/vote_detail.do?club_num=${match.club_num }&match_num=${match.match_num }&home_name=${match.home_name }&away_name=${match.away_name }'">
			<div class="row">
				<span class="vote-rating">
					<span class="voted" id="voted-attend-${match.match_num }" style="width:${match.attend/(match.attend+match.not_attend+match.undefined)*100}%">
						<span class="vote-label">참석</span>
					</span>
					<span class="vote-wrapper">
						<span class="person material-icons">person</span>
						<span id="num_attend" class="vote_num">${match.attend}</span>
					</span>
				</span>
			</div>	
			<div class="row" >
				<span class="vote-rating">
					<span class="voted" id="voted-not_attend-${match.match_num }" style="width:${match.not_attend/(match.attend+match.not_attend+match.undefined)*100}%">
						<span class="vote-label">불참</span>
					</span>
					<span class="vote-wrapper">
						<span class="person material-icons">person</span>
						<span id="num_nattend" class="vote_num">${match.not_attend}</span>
					</span>
				</span>
			</div>	
			<div class="row">
				<span class="vote-rating">
					<span class="voted" id="voted-not_fixed-${match.match_num }" style="width:${match.undefined/(match.attend+match.not_attend+match.undefined)*100}%">
						<span class="vote-label">미정</span>
					</span>
					<span class="vote-wrapper">
						<span class="person material-icons">person</span>
						<span id="num_undefined" class="vote_num">${match.undefined}</span>
					</span>
				</span>
				<c:if test="${empty match.cancel}">
				
			</c:if>
			</div>
		</div>
		<div class="row">
			<button class="block" 
				onclick="location.href='voteForm.do?match_num=${match.match_num}&club_num=${myClub.club_num }&isMain=true'">
				<c:if test="${ match.status !=0}">다시 투표하기</c:if><c:if test="${match.status ==0 }">투표하기</c:if>
			</button>
		</div>
	</li>
</c:forEach>
</ul>
</c:if>
<div class="border-btm v-padding">
	<span class="title-btw">지난 경기 상대팀 평점 작성</span>
</div>
<c:if test="${empty past_match }">
<div class="row">
	<div class="empty-wrapper">
		<i class="far fa-grimace empty">
		</i>
		<span class=" small-font">최근 2주간 경기가 없습니다.</span>
	</div>
</div>
</c:if>
<c:if test="${not empty past_match }">
<ul class="ul-list non-border-btm">
<c:forEach var="match" items="${past_match}">
<c:if test="${match.home!=match.away && !fn:contains(match.away_name,'미등록팀')}">
<li class="li-list">
	<div class="match-info-wrapper">
		<div class="main-row ">
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
			<c:if test="${not empty match.cancel }">
			<span class="status negative full">${match.cancel}팀에 의해 취소됨</span>
			</c:if>
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
			<span class="from-to">VS</span>
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
					<span>${match.away_perform*2}</span>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<c:if test="${match.home==match.club_num}">
		<button class="block margin-top" onclick="location.href='ratingForm.do?match_num=${match.match_num}&club_num=${match.away }'">${match.away_name } 평점 작성 하기</button>
		</c:if>
		<c:if test="${match.away==match.club_num }">
		<button class="block margin-top" onclick="location.href='ratingForm.do?match_num=${match.match_num}&club_num=${match.home }'">${match.home_name } 평점 작성 하기</button>
		</c:if>
	</div>
</li>
</c:if>
</c:forEach>
</ul>
</c:if>
</c:if>
<div id="more_modal" class="confirm-modals">
	<!-- Modal content -->
	<div class="confirm-modal-content">
		<div class="sub-content" id="option">
			<button id="share" class="pos-btn">투표 링크 공유</button>
		</div>
		<div class="sub-content">
			<button id="more-cancel-btn" class="neg-btn">취소</button>
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
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
		var itemStr='';
		if(modify){
			console.log('if modify 진입');
			
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
			 location.href='${pageContext.request.contextPath}/match/modifyMatch.do?match_num='+match_num;
		});
		$('#delete').click(function(){
			location.href='${pageContext.request.contextPath}/match/deleteMatch.do?match_num='+match_num+'&club_name='+club_name;
		});
		$('#share').click(function(){
			sendLinkForVote(match_num,club_num,match_date,address,start_time);
			$('#more_modal').css('display','none');
		});
		$('#more-cancel-btn').click(function(){
			$('#more_modal').css('display','none');
			if(modify){
				$('#options').replaceWith('');
			}
		});
 }
 $(function(){
	 let matches=new Array();
	 <c:forEach items="${match_list}" var="match">
	 	var obj={};
	 	obj.match_num="${match.match_num}";
	 	obj.max="${match.max}";
	 	obj.attend="${match.attend}";
	 	obj.not_attend="${match.not_attend}";
	 	obj.undefined="${match.undefined}";
	 	matches.push(obj);
	 </c:forEach>
	  for(var i=0; i<matches.length;i++){
	 	
	 	var max=matches[i].max;
	 	var attend=matches[i].attend;
	 	var not_attend=matches[i].not_attend;
	 	var not_fixed=matches[i].undefined;
	 	console.log("undefined : "+not_fixed);
	 	console.log("not_attend : "+not_attend);
	 	var match_num=matches[i].match_num;
	 	console.log("max/attend/not_attend/undefined/match_num : "+max+"/"+attend+"/"+not_attend+"/"+not_fixed+"/"+match_num);
	 	 if(max==0){
	 		$('#voted-attend-'+matches[i].match_num).css('background-color','transparent');
	 		$('#voted-not_attend-'+matches[i].match_num).css('background-color','transparent');
	 		$('#voted-not_fixed-'+matches[i].match_num).css('background-color','transparent');
	 	}else if (max==attend){
	 		$('#voted-attend-'+matches[i].match_num).css('background-color','#a4d3a6');
	 		$('#voted-not_attend-'+matches[i].match_num).css('background-color','#bfbfbf');
	 		$('#voted-not_fixed-'+matches[i].match_num).css('background-color','#bfbfbf');
	 	}else if(max==not_attend){
	 		$('#voted-attend-'+matches[i].match_num).css('background-color','#bfbfbf');
	 		$('#voted-not_attend-'+matches[i].match_num).css('background-color','#a4d3a6');
	 		$('#voted-not_fixed-'+matches[i].match_num).css('background-color','#bfbfbf')
	 	}else if(max==not_fixed){
	 		$('#voted-attend-'+matches[i].match_num).css('background-color','#bfbfbf');
	 		$('#voted-not_attend-'+matches[i].match_num).css('background-color','#bfbfbf');
	 		$('#voted-not_fixed-'+matches[i].match_num).css('background-color','#a4d3a6');
	 	}
	 	if(attend==0){
	 		console.log("attend==0 진입");
	 		$('#voted-attend-'+matches[i].match_num).css('background-color','transparent');
	 	}
	 	if(not_attend==0){
	 		console.log("not_attend==0 진입");
	 		$('#voted-not_attend-'+matches[i].match_num).css('background-color','transparent');
	 	}
	 	if(not_fixed==0){
	 		console.log("undefined==0 진입");
	 		$('#voted-not_fixed-'+matches[i].match_num).css('background-color','transparent');
	 	}
	  }
	 
	 
	 
	 
 });
	

</script>







