<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<ul class="match-list">
	<li class="match">	
		<div class="match-info" id="write_body">
			<div class="match-info invote">
				<span class="match-item">${match.match_date}</span>
				<span class="match-item">${match.start_time }~${match.end_time }</span>
				<span class="match-item">${match.address}</span>
				<span class="match-item">
					<c:if test="${match.type==1 }">축구</c:if>
					<c:if test="${match.type==2 }">풋살</c:if>
				</span>
			</div>
			<hr>
			<div class="row">
				<div class="team-info col">
					${match.home_name}<br>
					매너  
					<span class="star-rating">
						<span style="width:${match.home_manner*20}%"></span>
					</span>
					${match.home_manner*2}
					<br>
					실력  
					<span class="star-rating">
						<span style="width:${match.home_perform*20}%"></span>
					</span>
					${match.home_perform*2}
				</div>
				<span class="from-to">VS</span>
				<div class="team-info col">
					${match.away_name}<br>
					매너  
					<span class="star-rating">
						<span style="width:${match.away_manner*20}%"></span>
					</span>
					${match.away_manner*2}<br>
					실력 
					<span class="star-rating">
						<span style="width:${match.away_perform*20}%"></span>
					</span>
					${match.away_perform*2}
				</div>
			</div>
		</div>
		<input type="hidden" id="id" value="${user_id }">
		<input type="hidden" id="match_num" value="${match.match_num }">
		<c:if test="${match.home!=match.away && match.home==match.club_num}">
		<input type="hidden" id="club_num" value="${match.home }">
		</c:if>
		<c:if test="${match.home!=match.away && match.away==match.club_num}">
		<input type="hidden" id="club_num" value="${match.away }">
		</c:if>
		<c:if test="${match.home==match.away}">
		<input type="hidden" id="club_num" value="${match.home }">
		</c:if>
		<div class="row">
			<span class="vote-rating">
				<c:if test="${match.attend==0 }">
				<span class="voted" id="attend" style="background-color:transparent">
					<span class="vote-label">참석
						<span class="material-icons sign" id="attend_sign">done</span>
					</span>
				</span>
				</c:if>
				<c:if test="${match.attend!=0 && match.max==match.attend }">
				<span class="voted" id="attend"
					style=
						"width:${match.attend/(match.attend+match.not_attend+match.undefined)*100}%;
						background-color:#a4d3a6;">
					<span class="vote-label">참석
						<span class="material-icons sign" id="attend_sign">done</span>
					</span>
				</span>
				</c:if>
				<c:if test="${match.attend!=0 && match.max!=match.attend }">
				<span class="voted" id="attend"
					style=
						"width:${match.attend/(match.attend+match.not_attend+match.undefined)*100}%;
						background-color:#bfbfbf;">
					<span class="vote-label">참석
						<span class="material-icons sign" id="attend_sign">done</span>
					</span>
				</span>
				</c:if>
				<span id="num_attend" class="vote_num">${match.attend}</span>
				<span class="person material-icons">person</span>
			</span>
		</div>
		<div class="row">
			<span class="vote-rating">
				<c:if test="${match.not_attend==0 }">
				<span class="voted" id="not_attend" style="background-color:transparent;">
					<span class="vote-label">불참
						<span class="material-icons sign" id="not_attend_sign">done</span>
					</span>
				</span>
				</c:if>
				<c:if test="${match.not_attend!=0 && match.max==match.not_attend }">
				<span class="voted" id="not_attend"
					style=
						"width:${match.not_attend/(match.attend+match.not_attend+match.undefined)*100}%;
						background-color:#a4d3a6;">
					<span class="vote-label">불참
						<span class="material-icons sign" id="not_attend_sign">done</span>
					</span>
				</span>
				</c:if>
				<c:if test="${match.not_attend!=0 && match.max!=match.not_attend }">
				<span class="voted" id="not_attend"
					style=
						"width:${match.not_attend/(match.attend+match.not_attend+match.undefined)*100}%;
						background-color:#bfbfbf;">
					<span class="vote-label">불참
						<span class="material-icons sign" id="not_attend_sign">done</span>
					</span>
				</span>
				</c:if>
				<span id="num_nattend" class="vote_num">${match.not_attend}</span>
				<span class="person material-icons">person</span>
			</span>
		</div>	
		<div class="row">
			<span class="vote-rating">
				<c:if test="${match.undefined==0 }">
				<span class="voted" id="undefined" style="background-color:transparent;">
					<span class="vote-label">미정
						<span class="material-icons sign" id="undefined_sign">done</span>
					</span>
				</span>
				</c:if>
				<c:if test="${match.undefined!=0 && match.max==match.undefined }">
				<span class="voted" id="undefined"
					style=
						"width:${match.undefined/(match.attend+match.not_attend+match.undefined)*100}%;
						background-color:#a4d3a6;">
					<span class="vote-label">미정
						<span class="material-icons sign" id="undefined_sign">done</span>
					</span>
				</span>
				</c:if>
				<c:if test="${match.undefined!=0 && match.max!=match.undefined }">
				<span class="voted" id="undefined"
					style=
						"width:${match.undefined/(match.attend+match.not_attend+match.undefined)*100}%;
						background-color:#bfbfbf;">
					<span class="vote-label">미정
						<span class="material-icons sign" id="undefined_sign">done</span>
					</span>
				</span>
				</c:if>
				<span id="num_undefined" class="vote_num">${match.undefined}</span>
				<span class="person material-icons">person</span>
			</span>
		</div>
		<div class="btn-group btn-group-toggle col-sm-12" id="btn-group" data-toggle="buttons">
			<label class="radio btn" id="attend_btn">
				<input class="vote" type="radio" id="attend" value="1"> 참석
			</label>
			<label class="radio btn" id="not_attend_btn">
				<input class="vote" type="radio" name="vote" id="absent" value="2"> 불참
			</label>
			<label class="radio btn" id="undefined_btn">
				<input class="vote" type="radio" name="vote" id="undefined" value="3"> 미정
			</label>
		</div>
		<div class="total_wrapper">
			<a href="vote_detail.do?
				club_num=${match.club_num }&match_num=${match.match_num}&home_name=${match.home_name}&away_name=${match.away_name}"
				onclick="location.reload(true)">
			<span class="total_person material-icons">person</span>
			<span id="total" class="total">${match.attend+match.not_attend+match.undefined}</span><span class="unit"> 명 투표 </span>
			<i class="total fas fa-chevron-right"></i>
			</a>
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
<ul class="ul-list">
<c:forEach items="${answers }" var="answer">
<li class="li-list">
	<div class="main-row">
		<div class="x-smaller">
			<img src="${answer.thumbnail_image }" alt="Avatar" class="avatar">
		</div>
		<div class="x-bigger">
			<div class="main-row">
			<span class="nickname">${answer.nickname }</span>
			<span class="small-font bold gray">${answer.register_date }</span>
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
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
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
	$(function(){
		$('#more').click(function(){
			
			$('#more_modal').css('display','block');
		});
		$('#more-cancel-btn').click(function(){
			$('#more_modal').css('display','none');
		});
		
		$('.radio').removeClass(' focus');
		$('.radio').removeClass(' active');
		if( ${myVote == 1}){
			$('#attend_sign').css('display','inline-block');
			$('#not_attend_sign').css('display','none');
			$('#undefined_sign').css('display','none');
			$('#attend_btn').addClass(' focus active');
		} else if(${myVote == 2}){
			$('#attend_sign').css('display','none');
			$('#not_attend_sign').css('display','inline-block');
			$('#undefined_sign').css('display','none');
			$('#not_attend_btn').addClass(' focus active');
		} else if(${myVote == 3}){
			$('#attend_sign').css('display','none');
			$('#not_attend_sign').css('display','none');
			$('#undefined_sign').css('display','inline-block');
			$('#undefined_btn').addClass(' focus active');
		} else if (${empty myVote}){
			$('#attend_sign').css('display','none');
			$('#not_attend_sign').css('display','none');
			$('#undefined_sign').css('display','none');
		}
		$('.vote').click(function(){
			$('.radio').removeClass(' focus');
			$('.radio').removeClass(' active');
			
			if( $(this).val() ==  1){
				$('#attend_sign').css('display','inline-block');
				$('#not_attend_sign').css('display','none');
				$('#undefined_sign').css('display','none');
			}else if($(this).val() == 2){
				$('#attend_sign').css('display','none');
				$('#not_attend_sign').css('display','inline-block');
				$('#undefined_sign').css('display','none');
			}else if($(this).val() == 3){
				$('#attend_sign').css('display','none');
				$('#not_attend_sign').css('display','none');
				$('#undefined_sign').css('display','inline-block');
			}
			
			$.ajax({
				url:'vote.do',
				type:'post',
				data:{id:$('#id').val(),
					match_num:$('#match_num').val(),
					club_num:$('#club_num').val(),
					status:$(this).val()},
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
						if (max==data.attend){
							$('#attend').css('background-color','#a4d3a6');
							$('#not_attend').css('background-color','#bfbfbf');
							$('#undefined').css('background-color','#bfbfbf');
						}
						if(max==data.not_attend){
							$('#attend').css('background-color','#bfbfbf');
							$('#not_attend').css('background-color','#a4d3a6');
							$('#undefined').css('background-color','#bfbfbf')
						}
						if(max==data.undefined){
							$('#attend').css('background-color','#bfbfbf');
							$('#not_attend').css('background-color','#bfbfbf');
							$('#undefined').css('background-color','#a4d3a6');
						}
					},
					error:function(){
						alert('네트워크 오류 발생');
					}
			});
		});
	});

</script>