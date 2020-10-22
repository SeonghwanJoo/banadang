<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="row" id="top_wrap">
	<div class="fixed_top">
		<a href="javascript:location.href=document.referrer" >
		<span class="material-icons" id="cancel">close</span>
		</a>
		<div class="topnav-centered">
			<a href="javascript:location.reload()" class="active cursor">${title }</a>
		</div>
	</div>
</div>
<div class="blank_div"></div>
<ul class="ul-list">
	<c:if test="${not empty matches }">
	<c:forEach items="${matches }" var="match">
	<li class="li-list">
		<div class="main-row margin-btm">
			<span class="match-item small-font">주 활동 요일 ${match.act_day } | </span>
			<span class="match-item small-font">시간대 ${match.act_time} | </span>
			<span class="match-item small-font">지역 ${match.club_address }</span>
			<c:if test="${match.type==1 }">
			<span class="match-item small-font">축구</span>
			</c:if>
			<c:if test="${match.type==2 }">
			<span class="match-item small-font">풋살</span>
			</c:if>
			<c:if test="${match.clubRecruit_accept==1 }">
			<span class="status neutral">대기 중</span>
			</c:if>
			<c:if test="${match.clubRecruit_accept==2 }">
			<span class="status positive">수락 완료</span>
			</c:if>
			<c:if test="${match.clubRecruit_accept==3 }">
			<span class="status negative">거절 완료</span>
			</c:if>
			<span class="material-icons more cursor xl-font" id="more" onclick="openMore(${match.clubRecruit_req_num})">more_vert</span>
			<span class="status negative full" id="recruit-cancel-${match.clubRecruit_req_num }" style="display:none">팀 가입 신청 취소 완료</span>
		</div>
		<div class="row">
			<div class="col club_main">
				<c:if test="${empty match.club_img }">
				<img src="${pageContext.request.contextPath }/resources//resources/images/blank_emblem.png" class="avatar emblem">
				</c:if>
				<c:if test="${not empty match.club_img}">
				<img src="${pageContext.request.contextPath }/club/imageView.do?club_num=${match.club_num}" class="avatar emblem">
				</c:if>
				<span class="club_name">${match.club_name } | ${fn:toUpperCase(match.recruit_position)}</span>
				<br>
				<span class="uniform">
					유니폼
					<c:if test="${not empty match.club_color }">
						<span class="color" style="background-color:${match.club_color}"></span>
					</c:if>
					<c:if test="${empty match.club_color }">
						&nbsp;미정
					</c:if>
				</span>
			</div>
			<div class="col">
				<span class='rating'>매너</span>
					<span class='star-wrap'>
						<span class='star-rating'>
							<span style='width:${match.manner*20 }%'></span>
						</span><fmt:formatNumber value="${match.manner*2}" pattern="0.0"/><br>
				<span class='rating'>실력</span>
					<span class='star-rating'>
						<span style='width:${match.perform*20 }%'></span>
					</span><fmt:formatNumber value="${match.perform*2}" pattern="0.0"/><br>
				</span>
				<span class="age small-font">연령대 ${match.club_age }</span>
			</div>
		</div>
	</li>
	</c:forEach>
	</c:if>
</ul>
<div id="recruit_modal" class="confirm-modals">
	<!-- Modal content -->
	<div class="confirm-modal-content">
		<div class="sub-content">
			<span id="recruit_msg">팀 가입 신청을 취소/삭제하시겠습니까?<br>
			이미 가입 신청이 수락되었다면 해당 클럽에서 탈퇴하셔야 합니다.</span>
			<hr>
			<button id="recruit-delete-btn" class="pos-btn red">삭제</button>
		</div>
		<div class="sub-content">
			<button id="recruit-cancel-btn" class="neg-btn">닫기</button>
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function deleteRecruitReq(clubRecruit_req_num){
		$.ajax({
			url:'deleteClubRecruitReq.do',
			type:'post',
			data:{clubRecruit_req_num:clubRecruit_req_num},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(data){
				if(data.result=='success'){
					$('#recruit-cancel-'+clubRecruit_req_num).css('display','block');
					$('#recruit_modal').css('display','none');
				}
				if(data.result=='errors'){
					
					alert('오류 발생');
					$(window).click(function(){
						$('#recruit_modal').css('display','none');
					});
				}
				
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
	}
	
	function openMore(recruit_req_num,recruit_accept){
		$('#recruit_modal').css('display','block');
		$('#recruit-delete-btn').click(function(){
			deleteRecruitReq(recruit_req_num,recruit_accept)
		})
		
	}
	$('#recruit-cancel-btn').click(function(){
		$('#recruit_modal').css('display','none');
	});

</script>
