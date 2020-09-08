<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row" id="top_wrap">
	<div class="fixed_top">
		<a href="#" onclick="location.href='main.do'">
		<span class="material-icons" id="cancel" onclick="goBack();">close</span>
		</a>
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
						background-color:#66bb6a;">
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
						background-color:#66bb6a;">
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
						background-color:#66bb6a;">
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
	</li>
</ul>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function(){
		
		if( ${myVote ==  1}){
			$('#attend_sign').css('display','inline-block');
			$('#not_attend_sign').css('display','none');
			$('#undefined_sign').css('display','none');
		} else if(${myVote == 2}){
			$('#attend_sign').css('display','none');
			$('#not_attend_sign').css('display','inline-block');
			$('#undefined_sign').css('display','none');
		} else if(${myVote == 3}){
			$('#attend_sign').css('display','none');
			$('#not_attend_sign').css('display','none');
			$('#undefined_sign').css('display','inline-block');
		} else if (${empty myVote}){
			$('#attend_sign').css('display','none');
			$('#not_attend_sign').css('display','none');
			$('#undefined_sign').css('display','none');
		}
		$('.vote').click(function(){
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
						console.log("참석자"+data.attend);
						console.log("불참자"+data.not_attend);
						console.log("미정"+data.undefined);
						
						var total=data.attend+data.not_attend+data.undefined;
						console.log("총합"+total);
						
						$('#attend').css('width',(data.attend/total)*100+'%');
						$('#not_attend').css('width',(data.not_attend/total)*100+'%');
						$('#undefined').css('width',(data.undefined/total)*100+'%');
						$('#num_attend').text(data.attend);
						$('#num_nattend').text(data.not_attend);
						$('#num_undefined').text(data.undefined);
						var max=Math.max(data.attend,data.not_attend,data.undefined);
						if (max==data.attend){
							$('#attend').css('background-color','#66bb6a');
							$('#not_attend').css('background-color','#bfbfbf');
							$('#undefined').css('background-color','#bfbfbf');
						}else if(max==data.not_attend){
							$('#attend').css('background-color','#bfbfbf');
							$('#not_attend').css('background-color','#66bb6a');
							$('#undefined').css('background-color','#bfbfbf')
						}else if(max==data.undefined){
							$('#attend').css('background-color','#bfbfbf');
							$('#not_attend').css('background-color','#bfbfbf');
							$('#undefined').css('background-color','#66bb6a');
						}
					},
					error:function(){
						alert('네트워크 오류 발생');
					}
			});
		});
	});

</script>