<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${not empty match }">
<div class="row" id="top_wrap">
	<div class="fixed_top">
		<c:if test="${isMain==true }">
		<a href="${pageContext.request.contextPath}/main/main.do" >
		<span class="material-icons" id="cancel">close</span>
		</a>
		</c:if>
		<c:if test="${isMain==false }">
		<a href="${pageContext.request.contextPath}/club/manageClub.do?club_num=${myClub.club_num}&clubManageFrom=3" >
		<span class="material-icons" id="chevron_left">chevron_left</span>
		</a>
		</c:if>
		<div class="topnav-centered">
			<span class="active">${title }</span>
		</div>
	</div>
</div>
<div class="blank_div"></div>
<ul class="ul-list non-border-btm">
	<li class="li-list non-border-btm">
		<div class="gray-border">	
			<div class="match-info-wrapper">
				<div class="row">
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
				<div class="row">
					<span class="match-item"><i class="far fa-calendar-alt margin-right"></i><fmt:formatDate value="${match.match_date}" pattern="MM월 dd일"/></span>
					<span class="match-item"><i class="far fa-clock margin-right"></i>${match.start_time }~${match.end_time }</span>
				</div>
			</div>
			<div class="row small-font margin-top margin-btm">
				<c:if test="${empty match.home_name }">
				<div class="team-info col margin-top">
					<div class="centered margin-top">
						<span class="material-icons">
						error
						</span>
						삭제된 팀
					</div>
				</div>
				</c:if>
				<c:if test="${not empty match.home_name }">
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
			<input type="hidden" id="id" value="${user_id }">
			<input type="hidden" id="match_num" value="${match.match_num }">
			<input type="hidden" id="club_num" value="${myClub.club_num }">
			<div class="cursor">
				<div class="row">
					<label class="vote_label">
						<span class="vote-rating">
							<span class="voted relative" id="attend" style="width:${match.attend/(match.attend+match.not_attend+match.undefined)*100}%">
								<span class="vote_txt">참석</span>
								<input type="radio" name="vote" value="1" id="attend_radio" class="vote">
								<span class="vote_checkmark"></span>
							</span>
						</span>
					</label>
					<span class="vote-wrapper">
						<span class="person material-icons">person</span>
						<span id="num_attend" class="vote_num">${match.attend}</span>
					</span>
				</div>
				<div class="row">
					<label class="vote_label">
						<span class="vote-rating">
							<span class="voted relative" id="not_attend" style="width:${match.not_attend/(match.attend+match.not_attend+match.undefined)*100}%">
									<span class="vote_txt">불참</span>
									<input type="radio" name="vote" value="2" id="not_attend_radio" class="vote">
									<span class="vote_checkmark"></span>
							</span>
						</span>
					</label>
					<span class="vote-wrapper">
						<span class="person material-icons">person</span>
						<span id="num_nattend" class="vote_num">${match.not_attend}</span>
					</span>
				</div>	
				<div class="row">
					<label class="vote_label">
						<span class="vote-rating">
							<span class="voted relative" id="undefined" style="width:${match.undefined/(match.attend+match.not_attend+match.undefined)*100}%">
									<span class="vote_txt">미정</span>
									<input type="radio" name="vote" value="3" id="undefined_radio" class="vote">
									<span class="vote_checkmark"></span>
							</span>
						</span>
					</label>
					<span class="vote-wrapper">
						<span class="person material-icons">person</span>
						<span id="num_undefined" class="vote_num">${match.undefined}</span>
					</span>
				</div>
			</div>
			<button class="block white-bg margin-top" id="vote_btn" onclick="toggleVote()">투표하기</button>
			<div class="total_wrapper margin-btm">
				<span class="cursor" onclick="location.href='vote_detail.do?club_num=${match.club_num }&match_num=${match.match_num}&home_name=${match.home_name}&away_name=${match.away_name}&isMain=${isMain }'">
				<span class="total_person material-icons">person</span>
				<span id="total" class="total blue">${match.attend+match.not_attend+match.undefined}</span><span class="unit"> 명 투표 </span>
				<i class="total fas fa-chevron-right"></i>
				</span>
				<span class="share cursor" onclick="sendLink('${match.match_num}','${match.club_num}','${match.match_date}','${match.address}','${match.start_time}')">
				투표 공유하기
				<img class="kakaolink-share" src="${pageContext.request.contextPath }/resources/images/kakaolink_btn.png">
				</span>
			</div>
		</div>
	</li>
	
</ul>
<div class="dark-bg padding-top padding-btm">
	<button class="reply-btn margin-btm" onclick="location.href='replyToVote.do?match_num=${match.match_num}&club_num=${match.club_num }'">
			<span class="material-icons icon-margin">
			account_circle
			</span>
			<span class="small-font reply-txt">댓글 입력</span>
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
				<span class="xs-font gray right-date">${answer.register_date }</span>
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
</div>
<div class="mid-banner">
	<ins class="kakao_ad_area" style="display:none;" 
	 data-ad-unit    = "DAN-gCSwQUEFuriXnEOA" 
	 data-ad-width   = "320" 
	 data-ad-height  = "100"></ins>
</div>
<script type="text/javascript" src="//t1.daumcdn.net/kas/static/ba.min.js" async></script>
<div id="more_modal" class="confirm-modals">
	<!-- Modal content -->
	<div class="confirm-modal-content">
		<div class="sub-content">
			<button id="modify" class="pos-btn">수정</button>
			<hr>
			<button id="delete" class="pos-btn red">삭제</button>
		</div>
		<div class="sub-content">
			<button id="more-cancel-btn" class="neg-btn">닫기</button>
		</div>
	</div>
</div>

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
</c:if>
<c:if test="${empty match }">
<!-- The Modal -->
<div id="toast" class="submit_toast" style="display:flex">
  <!-- Modal content -->
    <div id="submit_toast_content" class="submit_toast_content">
		<div class="row centered margin-btm centered-padding">
			<span id="club_msg">삭제된 경기입니다.</span>
		</div>
		<div class="row margin-top centered">
			<div class="col">
				<button class="alert-btn" id="confirm" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">닫기</button>
			</div>
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
    });
}
  

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

let isVoted = ${match.status !=0};

function toggleVote(){
	
	//투표를 한 상태 일때  누르면 text 변경(다시 투표하기>투표하기), input enable, 
	if(isVoted){
		$('#vote_btn').text('투표하기');
		$('input[type=radio]').removeAttr('disabled');
		isVoted=false;
	} else {
		
		console.log('right before hasVoted');
		
		var hasVoted=$('input[type=radio]').is(':checked');
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
				match_num:${match.match_num},
				club_num:${match.club_num},
				status:$('input[type=radio]:checked').val()
				},
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
					
					$('#vote_btn').text('다시 투표하기');
					$('input[type=radio]').attr('disabled', 'true');
					isVoted = true;
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

function setVoteStyle(max,attend,not_attend,undefined){
	
	if (max==attend){
		$('#attend').css('background-color','#00643c');
		$('#not_attend').css('background-color','#888');
		$('#undefined').css('background-color','#888');
	}else if(max==not_attend){
		$('#attend').css('background-color','#888');
		$('#not_attend').css('background-color','#00643c');
		$('#undefined').css('background-color','#888')
	}else if(max==undefined){
		$('#attend').css('background-color','#888');
		$('#not_attend').css('background-color','#888');
		$('#undefined').css('background-color','#00643c');
	}

}

	$(function(){
		
		
		$('.vote-wrapper').click(function(){
			
			location.href='${pageContext.request.contextPath}/main/vote_detail.do?club_num=${match.club_num }&match_num=${match.match_num }&home_name=${match.home_name }&away_name=${match.away_name }&isMain=${isMain }';
			
		});
		
		
		
		$('#more').click(function(){
			
			$('#more_modal').css('display','block');
		});
		$('#more-cancel-btn').click(function(){
			$('#more_modal').css('display','none');
		});
		$('#vote-alert').click(function(){
			$('#toast').css('display','none');
		});
		
		setVoteStyle(${match.max},${match.attend},${match.not_attend},${match.undefined});
		//투표를 한 상태 일때
		if(isVoted){
			
			$('input[type=radio]').attr('disabled','true');
			$('#vote_btn').text('다시 투표하기');
			
			if(${match.status}==1){
				$('#attend_radio').prop('checked',true);
			}else if(${match.status}==2){
				$('#not_attend_radio').prop('checked',true);
			}else if(${match.status}==3){
				$('#undefined_radio').prop('checked',true);
			}
			
		}else{
			$('#attend').css('background-color','#888');
			$('#not_attend').css('background-color','#888');
			$('#undefined').css('background-color','#888');
			
		}
		
		
		
		
	});

</script>