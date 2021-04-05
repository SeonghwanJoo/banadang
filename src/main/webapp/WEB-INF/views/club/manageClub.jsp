<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="fixed_top">
	<a href="club.do" >
	<span class="material-icons" id="cancel">close</span>
	</a>
	<div class="topnav-centered">
		<span class="active cursor">${title }</span>
	</div>
	<c:if test="${myClub.club_auth>4 }">
	<div class="topnav-right">
		<a id="write" href="${pageContext.request.contextPath }/club/modifyClub.do">
			<i class="fas fa-pen down"></i>
		</a>
	</div>
	</c:if>
</div>
<div class="blank_div"></div>
<div class="invite-wrapper" id="invite-wrapper">
 	<ul class="ul-list small-font">
		<li class="li-list cursor non-border-btm" onclick="location.href='club_details.do?club_num=${myClub.club_num}'">
			<div class="row">
				<div class="col club_main nowrap">
					<c:if test="${myClub.filename ne 'undefined' }">
					<img src="imageView.do?club_num=${myClub.club_num}" alt="Avatar" class="avatar emblem">
					</c:if>
					<c:if test="${myClub.filename eq 'undefined' }">
					<img src="${pageContext.request.contextPath }/resources/images/blank_emblem.png" alt="Avatar" class="avatar emblem">
					</c:if>
					<span class="club_name">${myClub.club_name }</span><br>
					<span>${myClub.club_address }</span>
				</div>
				<div class="col nowrap">
					<span class="age">
						연령대<span class="xs-font margin-left">${myClub.club_age }</span>
					</span><br>
					<span class="uniform">
						유니폼
						<c:if test="${myClub.club_color eq 'rgb(0, 0, 0)'}">
							<span class="color" style="background-color:${myClub.club_color}; border:1px solid #fff"></span>
						</c:if>
						<c:if test="${not empty myClub.club_color && myClub.club_color ne 'rgb(0, 0, 0)'}">
							<span class="color" style="background-color:${myClub.club_color}"></span>
						</c:if>
						<c:if test="${empty myClub.club_color }">
							&nbsp;미정
						</c:if>
					</span>
				</div>
			</div>
			<div class="row">
				총 <span class="point margin-left margin-right"> ${myClub.rating_count } </span>명의 평가
				<i class="rating_icon fas fa-chevron-right"></i>
			</div>
			<div class="row">
				<div class="col flex-start">
					매너 
					<span class="star-rating">
						<span style="width:${myClub.manner*20}%"></span>
					</span><fmt:formatNumber value="${myClub.manner*2}" pattern="0.0"/>
				</div>
				<div class="col flex-start">
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
			<button class="tab-btn small-font bold " id="manageSchedule-btn" onclick="openTap(event,'manageSchedule')">경기 일정</button>
		</div>
		<div class="tab-col">
			<button class="tab-btn small-font bold " id="manageMember-btn" onclick="openTap(event,'manageMember')">회원 관리</button>
		</div>
		<c:if test="${myClub.club_auth>4}">
		<div class="tab-col">
			<button class="tab-btn small-font bold " id="manageMatch-btn" onclick="openTap(event,'manageMatch')">매칭 현황</button>
		</div>
		</c:if>
	</div>
	<c:if test="${myClub.club_auth>4 }">
	<div class="tab_detail" id="manageMatch" >
		<c:if test="${empty away_club && empty home_club && empty recruits && empty clubRecruits }">
		<div class="row centered-padding">
			<div class="empty-wrapper margin-btm">
				<i class="far fa-grimace empty">
				</i>
				<span class=" small-font">접수/신청된 매칭이 없습니다.</span>
			</div>
		</div>
		</c:if>
		<c:if test="${!empty away_club }">
		<h6>초청한 경기(상대팀 선택)</h6>
		<ul class="ul-list border-top">
			<c:forEach items="${away_club }" var="away">
			<li class="li-list">
				<div class="match-info-wrapper">
				<div class="main-row ">
					<c:if test="${away.type==1 }">
					<span class="match-item s-chip white-bg">
					축구
					</span>	
					</c:if>
					<c:if test="${away.type==2 }">
					<span class="match-item s-chip black-bg">
					풋살
					</span>	
					</c:if>
					<span class="match-item">${away.address}</span>
					<c:if test="${away.acceptance==1 }">
					<span id="status-${away.request_num}"class="status neutral">대기 중</span>
					</c:if>
					<c:if test="${away.acceptance==2 }">
					<span id="status-${away.request_num}"class="status positive">수락 완료</span>
					</c:if>
					<c:if test="${away.acceptance==3 }">
					<span id="status-${away.request_num}"class="status negative">거절 완료</span>
					</c:if>
					<c:if test="${not empty away.cancel }">
					<span class="cancel negative full">${away.cancel}팀에 의해 취소됨</span>
					</c:if>
					<c:if test="${not empty away.match_req_cancel }">
					<span class="cancel negative full" id="${away.request_num }">${away.club_name }팀에 의해 경기 신청 취소됨</span>
					</c:if>
					<c:if test="${empty away.match_req_cancel }">
					<span class="cancel negative full" id="${away.request_num }" style="display:none">${away.club_name }팀에 의해 경기 신청 취소됨</span>
					</c:if>
				</div>
				<div class="row ">
					<span class="match-item"><i class="far fa-calendar-alt margin-right"></i><fmt:formatDate value="${away.match_date}" pattern="MM월 dd일"/></span>
					<span class="match-item"><i class="far fa-clock margin-right"></i>${away.start_time }~${away.end_time }</span>
				</div>
				</div>
				<div class="row small-font  margin-top margin-btm">
					<div class="col club_main">
						<c:if test="${ away.filename ne 'undefined' }">
							<img src="imageView.do?club_num=${away.club_num }" class="emblem">
						</c:if>
						<c:if test="${away.filename eq 'undefined' }">
							<img src="${pageContext.request.contextPath}/resources/images/blank_emblem.png" class="emblem">
						</c:if>
						<span class="club_name">${away.club_name }</span><br>
						<span class="uniform">
							유니폼
							<c:if test="${away.club_color eq 'rgb(0, 0, 0)'}">
								<span class="color" style="background-color:${away.club_color}; border:1px solid #fff"></span>
							</c:if>
							<c:if test="${not empty away.club_color && away.club_color ne 'rgb(0, 0, 0)'}">
								<span class="color" style="background-color:${away.club_color}"></span>
							</c:if>
							<c:if test="${empty away.club_color }">
								&nbsp;미정
							</c:if>
						</span><br>
						<span class="xs-chip cursor" onclick="location.href='club_details.do?club_num=${away.club_num}'">팀 평가 조회</span>
					</div>
					<div class="col">
						<div class="row">
							<span class='rating'>매너</span>
								<span class='star-rating'>
									<span style='width:${away.manner*20 }%'></span>
							</span><fmt:formatNumber value="${away.manner*2}" pattern="0.0"/>
						</div>
						<div class="row">
							<span class='rating'>실력</span>
								<span class='star-rating'>
									<span style='width:${away.perform*20 }%'></span>
								</span><fmt:formatNumber value="${away.perform*2}" pattern="0.0"/>
						</div>
						<span>연령대 <span class="xs-font margin-left">${away.club_age }</span></span>
					</div>
				</div>
				<span class="material-icons collapsible">add_circle_outline</span>
				<div class="collapsible-content"><p class="detail" >${away.request_detail}</p><c:if test="${away.acceptance==1 && empty away.cancel }"><div class="row" id="match-btn-${away.request_num }"><div class="col"><button class="first-btn" onclick="answerForMatchReq(${away.request_num},'${away.club_name }',3,${away.club_num },${away.match_num })">거절</button></div><div class="col"><button class="second-btn" onclick="answerForMatchReq(${away.request_num},'${away.club_name }',2,${away.club_num },${away.match_num })">수락</button></div></div></c:if></div>
			</li>
			</c:forEach>
		</ul>
		</c:if>
		<c:if test="${!empty home_club}">
		<h6>신청한 경기</h6>
		<ul class="ul-list border-top">
			<c:forEach items="${home_club }" var="home">
			<c:if test="${home.club_num != myClub.club_num }">
			<li class="li-list">
				<div class="match-info-wrapper">
					<div class="main-row">
						<c:if test="${home.type==1 }">
						<span class="match-item s-chip white-bg">
						축구
						</span>	
						</c:if>
						<c:if test="${home.type==2 }">
						<span class="match-item s-chip black-bg">
						풋살
						</span>	
						</c:if>
						<span class="match-item">${home.address}</span>
						<c:if test="${home.acceptance==1 }">
						<span class="status neutral">대기 중</span>
						</c:if>
						<c:if test="${home.acceptance==2 }">
						<span class="status positive">수락 완료</span>
						</c:if>
						<c:if test="${home.acceptance==3 }">
						<span class="status negative">거절 완료</span>
						</c:if>
						<c:if test="${not empty home.cancel }">
						<span class="cancel negative full">${home.cancel}팀에 의해 취소됨</span>
						</c:if>
						<c:if test="${not empty home.match_req_cancel }">
						<span class="cancel negative full" id="${home.request_num }">경기 신청 취소됨</span>
						</c:if>
						<c:if test="${empty home.match_req_cancel }">
						<span class="cancel negative full" id="${home.request_num }" style="display:none">경기 신청 취소됨</span>
						</c:if>
					</div>
					<div class="row ">
						<span class="match-item"><i class="far fa-calendar-alt margin-right"></i><fmt:formatDate value="${home.match_date}" pattern="MM월 dd일"/></span>
						<span class="match-item"><i class="far fa-calendar-alt margin-right"></i>${home.start_time }~${home.end_time }</span>
					</div>
				</div>
				<div class="row small-font  margin-top margin-btm">
					<div class="col club_main">
						<c:if test="${home.filename ne 'undefined'}">
							<img src="imageView.do?club_num=${home.club_num}"  class="avatar emblem">
						</c:if>
						<c:if test="${home.filename eq 'undefined' }">
							<img src="${pageContext.request.contextPath}/resources/images/blank_emblem.png" class="avatar emblem">
						</c:if>
						<span class="club_name">${home.club_name }</span><br>
						<span class="uniform">
							유니폼
							<c:if test="${home.club_color eq 'rgb(0, 0, 0)'}">
								<span class="color" style="background-color:${home.club_color}; border:1px solid #fff"></span>
							</c:if>
							<c:if test="${not empty home.club_color && home.club_color ne 'rgb(0, 0, 0)'}">
								<span class="color" style="background-color:${home.club_color}"></span>
							</c:if>
							<c:if test="${empty home.club_color }">
								&nbsp;미정
							</c:if>
						</span><br>
						<span class="xs-chip cursor" onclick="location.href='club_details.do?club_num=${home.club_num}'">팀 평가 조회</span>
					</div>
					<div class="col">
						<div class="row">
							<span class='rating'>매너</span>
								<span class='star-rating'>
									<span style='width:${home.manner*20 }%'></span>
							</span><fmt:formatNumber value="${home.manner*2}" pattern="0.0"/>
						</div>
						<div class="row">
							<span class='rating'>실력</span>
								<span class='star-rating'>
									<span style='width:${home.perform*20 }%'></span>
								</span><fmt:formatNumber value="${home.perform*2}" pattern="0.0"/>
						</div>
						<span class="age">연령대 <span class="xs-font margin-left">${home.club_age }</span></span>
					</div>
				</div>
				<span class="material-icons collapsible">add_circle_outline</span>
				<div class="collapsible-content"><p class="detail">${home.match_detail}</p><c:if test="${empty home.cancel}"><div class="row"><c:if test="${empty home.match_req_cancel }"><button class="block white-bg" id="${home.request_num }-btn" onclick="cancelMatchReq(${home.request_num},${home.acceptance},${home.match_num },${home.club_num },'${myClub.club_name }')">경기 신청 취소</button></c:if></div></c:if></div>
			</li>
			</c:if>
			</c:forEach>
		</ul>
		</c:if>
		<c:if test="${not empty recruits }">
		<h6>용병 신청자 선택</h6>
		<ul class="ul-list border-top">
			<c:forEach items="${recruits }" var="recruit">
			<li class="li-list">
				<div class="match-info-wrapper">
					<div class="main-row ">
						<c:if test="${recruit.type==1 }">
						<span class="match-item s-chip white-bg">
						축구
						</span>	
						</c:if>
						<c:if test="${recruit.type==2 }">
						<span class="match-item s-chip black-bg">
						풋살
						</span>	
						</c:if>
						<span class="match-item">${recruit.address}</span>
						<c:if test="${recruit.recruit_accept==1 }">
						<span id="recruit-status-${recruit.recruit_req_num}"class="status neutral">대기 중</span>
						</c:if>
						<c:if test="${recruit.recruit_accept==2 }">
						<span id="recruit-status-${recruit.recruit_req_num}"class="status positive">수락 완료</span>
						</c:if>
						<c:if test="${recruit.recruit_accept==3 }">
						<span id="recruit-status-${recruit.recruit_req_num}"class="status negative">거절 완료</span>
						</c:if>
						<c:if test="${not empty recruit.isCanceled }">
						<span class="cancel negative full" >${recruit.nickname }님이 용병 신청을 취소하셨습니다.</span>
						</c:if>
					</div>
					<div class="row ">
						<span class="match-item"><i class="far fa-calendar-alt margin-right"></i><fmt:formatDate value="${recruit.match_date}" pattern="MM월 dd일"/></span>
						<span class="match-item"><i class="far fa-clock margin-right"></i>${recruit.start_time }~${recruit.end_time }</span>
					</div>
				</div>
				<div class="row margin-top">
					<div class="x-smaller">
						<c:if test="${empty recruit.thumbnail_image }">
						<img src="${pageContext.request.contextPath }/resources/images/profile.png" alt="Avatar" class="avatar">
						</c:if>
						<c:if test="${not empty recruit.thumbnail_image }">
						<img src="${recruit.thumbnail_image }" alt="Avatar" class="avatar">
					</c:if>
					</div>
					<div class="x-bigger">
						<div class="col">
						<span>${recruit.nickname }</span>
						<span>${fn:substring(recruit.age_range,0,1)}0대 |</span>
						<span class="small-chip">
						<c:if test="${fn:contains(recruit.recruit_position,'g') }">
							<span>GK</span>
						</c:if>
						<c:if test="${fn:contains(recruit.recruit_position,'d') }">
							<span>DF</span>
						</c:if>
						<c:if test="${fn:contains(recruit.recruit_position,'m') }">
							<span>MF</span>
						</c:if>
						<c:if test="${fn:contains(recruit.recruit_position,'w') }">
							<span>FW</span>
						</c:if>
						</span>
						</div>
						<p>${recruit.recruit_req_detail }</p>
					</div>
				</div>
				<c:if test="${recruit.recruit_accept==1 }">
				<div class="row" id="btn-${recruit.recruit_req_num }">
					<div class="col">
						<button class="first-btn" onclick="answerForRecruitReq(${recruit.recruit_req_num},'${recruit.nickname }',3,'${recruit.id }','${recruit.club_name }')">거절</button>
					</div>
					<div class="col">
						<button class="second-btn" onclick="answerForRecruitReq(${recruit.recruit_req_num},'${recruit.nickname }',2,'${recruit.id }','${recruit.club_name }')">수락</button>
					</div>
				</div>
				</c:if>
			</li>
			</c:forEach>
		</ul>			
		</c:if>
		<c:if test="${not empty clubRecruits }">
		<h6>팀원 가입 신청 수락/거절</h6>
		<ul class="ul-list border-top">
			<c:forEach items="${clubRecruits }" var="recruit">
			<li class="li-list">
				<div class="match-info-wrapper  margin-btm v-padding">
					<div class="main-row">
						<span class="match-item margin-left"><span class=" margin-right"><i class="far fa-calendar-alt margin-right"></i>모집 마감일</span><fmt:formatDate value="${recruit.recruit_due}" pattern="yy.MM.dd"/></span>
						<c:if test="${recruit.clubRecruit_accept==1 }">
						<span id="club-status-${recruit.clubRecruit_req_num}"class="status neutral">대기 중</span>
						</c:if>
						<c:if test="${recruit.clubRecruit_accept==2 }">
						<span id="club-status-${recruit.clubRecruit_req_num}"class="status positive">수락 완료</span>
						</c:if>
						<c:if test="${recruit.clubRecruit_accept==3 }">
						<span id="club-status-${recruit.clubRecruit_req_num}"class="status negative">거절 완료</span>
						</c:if>
					</div>
				</div>
				<div class="row">
					<div class="x-smaller">
						<c:if test="${empty recruit.thumbnail_image }">
						<img src="${pageContext.request.contextPath }/resources/images/profile.png" alt="Avatar" class="avatar">
						</c:if>
						<c:if test="${not empty recruit.thumbnail_image }">
						<img src="${recruit.thumbnail_image }" alt="Avatar" class="avatar">
						</c:if>
					</div>
					<div class="x-bigger">
						<div class="col">
						<span>${recruit.nickname }</span>
						<span>${fn:substring(recruit.age_range,0,1)}0대 |</span>
						<span class="small-chip">
						<c:if test="${fn:contains(recruit.recruit_position,'g') }">
							<span>GK</span>
						</c:if>
						<c:if test="${fn:contains(recruit.recruit_position,'d') }">
							<span>DF</span>
						</c:if>
						<c:if test="${fn:contains(recruit.recruit_position,'m') }">
							<span>MF</span>
						</c:if>
						<c:if test="${fn:contains(recruit.recruit_position,'w') }">
							<span>FW</span>
						</c:if>
						</span>
						</div>
						<p>${recruit.clubRecruit_req_detail }</p>
					</div>
				</div>
				<c:if test="${recruit.clubRecruit_accept==1 }">
				<div class="row" id="club-btn-${recruit.clubRecruit_req_num }">
					<div class="col">
						<button class="first-btn" onclick="answerForClubRecruitReq(${recruit.clubRecruit_req_num},'${recruit.nickname }',3,'${recruit.id }')">거절</button>
					</div>
					<div class="col">
						<button class="second-btn" onclick="answerForClubRecruitReq(${recruit.clubRecruit_req_num},'${recruit.nickname }',2,'${recruit.id }')">수락</button>
					</div>
				</div>
				</c:if>
			</li>
			</c:forEach>
		</ul>			
		</c:if>
	</div>
	</c:if>
	<div class="tab_detail" id="manageSchedule">
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
					<span class="cursor" onclick="location.href='${pageContext.request.contextPath }/main/vote_detail.do?club_num=${match.club_num }&match_num=${match.match_num}&home_name=${match.home_name}&away_name=${match.away_name}&isMain=false'">
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
					<button class="black-bg block no-border" onclick="location.href='${pageContext.request.contextPath }/main/voteForm.do?match_num=${match.match_num}&club_num=${myClub.club_num }&isMain=false'">
						<i class="fas fa-comment-dots m-margin-right"></i>댓글 보기
					</button>
				</div>
				<span class="border-btw"></span>
				<div class="col centered">
					<button class="black-bg block no-border" onclick="location.href='${pageContext.request.contextPath }/main/replyToVote.do?match_num=${match.match_num}&club_num=${match.club_num }'">
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
				<button class="block white-bg margin-top" onclick="location.href='ratingForm.do?match_num=${match.match_num}&club_num=${match.away }&isMain=false'">${match.away_name } 평점 작성 하기</button>
				</c:if>
				<c:if test="${match.away==match.club_num }">
				<button class="block white-bg margin-top" onclick="location.href='ratingForm.do?match_num=${match.match_num}&club_num=${match.home }&isMain=false'">${match.home_name } 평점 작성 하기</button>
				</c:if>
			</div>
		</div>
	</li>
	</c:forEach>
	</c:if>
	</ul>
	</div>
	<div class="tab_detail" id="manageMember" style="display: block">
		<div class="main-row">
		<h6 class="margin-left margin-right" id="total">
			총 회원 ${fn:length(members)}명
		</h6>
		</div>
		<div class="col-sm-12 one-col">
			<div class="col">
				<a href="javascript:sendLink()">
					<span class="material-icons person_add">person_add</span>
					<span class="text-by-icon">카카오톡으로 팀원 초대하기
					<img class="kakaolink-share" src="${pageContext.request.contextPath }/resources/images/kakaolink_btn.png">
					</span>
				</a>
			</div>    
		</div>
		<div class="row">
		<c:forEach items="${members }" var="member">
			<div class="detail-item col-12 col-lg-6" id="${member.id }-row">
				<div class="half_col bigger nowrap">
					<div class="relative disp-inbl float-left">
						<c:if test="${empty member.thumbnail_image }">
						<img src="${pageContext.request.contextPath }/resources/images/profile.png" alt="Avatar" class="avatar">
						</c:if>
						<c:if test="${not empty member.thumbnail_image }">
						<img src="${member.thumbnail_image }" alt="Avatar" class="avatar">
						</c:if>
						<c:if test="${ member.club_auth>4}">
						<i class="fas fa-crown admin visible" id="${member.id}">
						</i>
						</c:if>
						<c:if test="${ member.club_auth<5}">
						<i class="fas fa-crown admin" id="${member.id}">
						</i>
					</c:if>
					</div>
					<span>
					${member.nickname} | <span class="gray small-font">가입일 <fmt:formatDate value="${member.join_date}" pattern="yy.MM.dd"/> </span>
					</span>
					<br>
					<c:if test="${not empty member.age_range }">
					<span class="gray small-font">${fn:substring(member.age_range,0,1)}0대 |</span>
					</c:if>
					<c:if test="${empty member.age_range }">
					<span class="gray small-font">비공개 |</span>
					</c:if>
					<span class="gray small-font">참석 투표율<fmt:formatNumber value="${member.attendance_rate*100}" pattern="0"/>%</span>
				</div>
				<div class="half_col smaller">
					<c:if test="${user_id == member.id }">
					<input type="hidden" value="${member.nickname }" id="nickname">
					<i class="fas fa-cog" id="${member.id }-i" data-auth="${member.club_auth }" onclick="manageMember('${member.id}','${member.nickname}',${member.club_num })"></i>
					</c:if>
					<c:if test="${myClub.club_auth>4 && user_id != member.id }">
					<i class="fas fa-users-cog" id="${member.id }-i" data-auth="${member.club_auth }" onclick="manageMember('${member.id}','${member.nickname}','${member.club_num }')"></i>
					</c:if>
				</div>
			</div>
		</c:forEach>
		</div>
		<div class="mid-banner">
			<ins class="kakao_ad_area" style="display:none;" 
			 data-ad-unit    = "DAN-gCSwQUEFuriXnEOA" 
			 data-ad-width   = "320" 
			 data-ad-height  = "100"></ins>
		</div>
		<script type="text/javascript" src="//t1.daumcdn.net/kas/static/ba.min.js" async></script>
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
<div id="recruit_modal" class="confirm-modals">
	<!-- Modal content -->
	<div class="confirm-modal-content">
		<div class="sub-content">
			<span id="recruit_msg"></span>
			<hr>
			<button id="recruit-btn" class="pos-btn"></button>
		</div>
		<div class="sub-content">
			<button id="recruit-cancel-btn" class="neg-btn">취소</button>
		</div>
	</div>
</div>
<div id="clubRecruit_modal" class="confirm-modals">
	<!-- Modal content -->
	<div class="confirm-modal-content">
		<div class="sub-content">
			<span id="clubRecruit_msg"></span>
			<hr>
			<button id="clubRecruit-btn" class="pos-btn"></button>
		</div>
		<div class="sub-content">
			<button id="clubRecruit-cancel-btn" class="neg-btn">취소</button>
		</div>
	</div>
</div>
<div id="delete_modal" class="confirm-modals">
	<!-- Modal content -->
	<div class="confirm-modal-content">
		<div class="sub-content">
			<span id="delete_msg">탈퇴 후 남은 회원이 없으면 팀을 삭제합니다.<br> 탈퇴하시겠습니까?</span>
			<hr>
			<button id="delete-btn" class="pos-btn">탈퇴</button>
		</div>
		<div class="sub-content">
			<button id="delete-cancel-btn" class="neg-btn">취소</button>
		</div>
	</div>
</div>
<div id="match_modal" class="confirm-modals">
	<!-- Modal content -->
	<div class="confirm-modal-content">
		<div class="sub-content">
			<span id="match_msg">경기 신청을 취소하시겠습니까?</span>
			<hr>
			<button id="match-btn" class="pos-btn">경기 신청 취소</button>
		</div>
		<div class="sub-content">
			<button id="match-cancel-btn" class="neg-btn">닫기</button>
		</div>
	</div>
</div>
<div id="manage_modal" class="confirm-modals">
	<!-- Modal content -->
	<div class="confirm-modal-content">
		<!-- 기존회원 관리 옵션(강제탈퇴,운영진 권한부여,일반회원 권한 부여 )-->
		<div class="sub-content">
			<span id="manage_msg"></span>
			<hr>
			<button id="out-manage-btn" class="pos-btn">팀 탈퇴</button>
			<hr id="auth-manage-btn-hr">
			<button id="auth-manage-btn" class="pos-btn" style="display:block"></button>
		</div>
		<div class="sub-content">
			<button id="manage-cancel-btn" class="neg-btn">취소</button>
		</div>
	</div>
</div>
<div id="more_modal" class="confirm-modals">
	<!-- Modal content -->
	<div class="confirm-modal-content">
		<div class="sub-content" id="option">
			<button id="share" class="pos-btn">투표 링크 공유
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
<!-- The Modal -->
<div id="toast" class="submit_toast">
  <!-- Modal content -->
  	<div id="submit_toast_content" class="submit_toast_content">
		<div class="row centered margin-btm centered-padding">
			<span id="club_msg"></span>
		</div>
		<div class="row margin-top centered">
			<button class="alert-btn">확인</button>
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
Kakao.init('32776969383e4a77d92f6e18dd233bc5');
var nickname=$('#nickname').val();
function sendLink() {
    Kakao.Link.sendCustom({
    	templateId: 34560,
    	templateArgs: {
    		'msg_title': '${myClub.club_name} 팀으로 당신을 초대합니다',
    		'msg_description': '아래 링크를 눌러 들어오세요.',
    		'club_num': '${myClub.club_num}',
    		'nickname': nickname
    	}
    })
  }
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
function goToVoteDetail(club_num, match_num, home_name, away_name){
	
	location.href='${pageContext.request.contextPath}/main/vote_detail.do?club_num='+club_num+'&match_num='+match_num+'&home_name='+home_name+'&away_name='+away_name+'&isMain=false';
	
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
		 location.href='${pageContext.request.contextPath}/match/modifyMatch.do?match_num='+match_num+'&club_num='+club_num+'&isFromClub=true';
	});
	$('#delete').click(function(){
		location.href='${pageContext.request.contextPath}/match/deleteMatch.do?match_num='+match_num+'&club_name='+club_name+'&club_num='+club_num+'&isFromClub=true';
	});
	$('#share').click(function(){
		sendLinkForVote(match_num,club_num,match_date,address,start_time);
		$('#more_modal').css('display','none');
	});
	$('#detail').click(function(){
		location.href='${pageContext.request.contextPath}/match/matchDetail.do?match_num='+match_num+'&isMain=false';
	});
	$('#more-cancel-btn').click(function(){
		$('#more_modal').css('display','none');
		
	});
}
function cancelMatchReq(request_num, acceptance, match_num, club_num, club_name){
	$('#match_modal').css('display','block');
	$('#match-btn').click(function(){
		$.ajax({
			url:'cancelMatchReq.do',
			type:'post',
			data:{request_num:request_num, acceptance:acceptance,match_num:match_num,club_num:club_num,club_name:club_name},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(data){
				if(data.result=='success'){
					$('#match_modal').css('display','none');
					$('#'+request_num).css('display','block');
					$('#'+request_num+'-btn').css('display','none');
				}
				if(data.result=='errors'){
					
					alert('오류 발생');
					$(window).click(function(){
						$('#cancel_modal').css('display','none');
					});
				}
				
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
	});
	$('#match-cancel-btn').click(function(){
		$('#match_modal').css('display','none');
	});
}
function answerForClubRecruitReq(clubRecruit_req_num,nickname,clubRecruit_accept,id){
	if(clubRecruit_accept==2){
		$('#clubRecruit_msg').text(nickname+'님의 가입 신청을 수락하겠습니까?');
		$('#clubRecruit-btn').text('수락');
	}else if(clubRecruit_accept==3){
		$('#clubRecruit_msg').text(nickname+'님의 가입 신청을 거절하겠습니까?');
		$('#clubRecruit-btn').text('거절');
	}
	$('#clubRecruit_modal').css('display','block');
	$('#clubRecruit-btn').click(function(){
		$.ajax({
			url:'answerForClubRecruit.do',
			type:'post',
			data:{clubRecruit_req_num:clubRecruit_req_num, 
				  clubRecruit_accept:clubRecruit_accept,
				  id:id,
				  club_num:${myClub.club_num},
				  club_name:'${myClub.club_name}'
			},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(data){
				if(data.result=='success'){
					var status=document.getElementById('club-status-'+clubRecruit_req_num);
					status.className = status.className.replace(/\bneutral\b/g, "");
					if(clubRecruit_accept==2){
						status.classList.add('positive');
						status.innerText='수락 완료';
					}else if(clubRecruit_accept==3){
						status.classList.add('negative');
						status.innerText='거절 완료';
					}
					$('#clubRecruit_modal').css('display','none');
					document.getElementById('club-btn-'+clubRecruit_req_num).style.display="none";
				}
				if(data.result=='errors'){
					
					alert('오류 발생');
					$(window).click(function(){
						$('#clubRecruit_modal').css('display','none');
					});
				}
				
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
		
	});
	
	$('#clubRecruit-cancel-btn').click(function(){
		$('#clubRecruit_modal').css('display','none');
	});
}
function answerForRecruitReq(recruit_req_num,nickname,recruit_accept,id,club_name){
	if(recruit_accept==2){
		$('#recruit_msg').text(nickname+'님의 용병 신청을 수락하겠습니까?');
		$('#recruit-btn').text('수락');
	}else if(recruit_accept==3){
		$('#recruit_msg').text(nickname+'님의 용병 신청을 거절하겠습니까?');
		$('#recruit-btn').text('거절');
	}
	console.log('clubName in answerForRecruitReq'+club_name);
	$('#recruit_modal').css('display','block');
	$('#recruit-btn').click(function(){
		$.ajax({
			url:'answerForRecruit.do',
			type:'post',
			data:{
				recruit_req_num:recruit_req_num, 
				recruit_accept:recruit_accept,
				id:id,
				club_name:club_name
			},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(data){
				if(data.result=='success'){
					var status=document.getElementById('recruit-status-'+recruit_req_num);
					status.className = status.className.replace(/\bneutral\b/g, "");
					if(recruit_accept==2){
						status.classList.add('positive');
						status.innerText='수락 완료';
					}else if(recruit_accept==3){
						status.classList.add('negative');
						status.innerText='거절 완료';
					}
					$('#recruit_modal').css('display','none');
					document.getElementById('btn-'+recruit_req_num).style.display="none";
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
		
	});
	
	$('#recruit-cancel-btn').click(function(){
		$('#recruit_modal').css('display','none');
	});
}
function manageMember(id,nickname,club_num){
	//modal창 표시 (현재 멤버 권한이 운영진이면 강제탈퇴와 운영진 제외, 운영진 추가)
	let set=document.getElementById(id+'-i');
	let auth=set.getAttribute('data-auth');
	
	if(${ myClub.club_auth}<5){
		$('#auth-manage-btn-hr').css('display','none');
		$('#auth-manage-btn').css('display','none');
	}
	$('#manage_msg').text(nickname+'님 회원 관리');
	
	$('#manage_modal').css('display','block');
	if(auth>4){
		$('#auth-manage-btn').text('운영진 제외');
			auth=4;
	}else if (auth==4 && ${myClub.club_auth}==5){
		$('#auth-manage-btn').text('운영진 추가');
			auth=5;
	}
	$('#auth-manage-btn').unbind('click').bind('click',function(){
		if(auth==4){
			checkNumOfMember(club_num,false,id,auth);
			
		}else if (auth==5){
			updateMember(id,auth,club_num);
		}
		 
		
		
	});
	$('#out-manage-btn').unbind('click').bind('click',function(){
		auth=0;
		checkNumOfMember(club_num,true,id,auth);
		
		
	});
	$('#manage-cancel-btn').click(function(){
		$('#manage_modal').css('display','none');
	});
}
function checkNumOfMember(club_num,memberDeleted,id,auth){
	$.ajax({
		url:'checkNumOfMembers.do',
		type:'post',
		data:{
			club_num:club_num,
			memberDeleted:memberDeleted
		},
		dataType:'json',
		cache:false,
		timeout:30000,
		success:function(data){
			
			if(data.existingNumber==1 && !data.memberDeleted){
				//modal 메시지 띄우고 프로세스 빠져나감
				$('#manage_modal').css('display','none');
				$('#club_msg').text('적어도 한명 이상은 운영진으로 지정되어야 합니다.');
				$('#toast').css('display','flex');
				$(window).click(function(){
					$('#toast').css('display','none');
					return;
				});
			}else if(data.existingNumber==1 && data.memberDeleted){
				$('#manage_modal').css('display','none');
				$('#delete_modal').css('display','block');
				$('#delete-btn').click(function(){
					//팀 삭제 처리 후 club.do로 location
					deleteClub(club_num);
				});
				$('#delete-cancel-btn').click(function(){
					$('#delete_modal').css('display','none');
				});
				
			}else if(data.existingNumber>1){
				updateMember(id,auth,club_num);
			}
			if(data.result=="errors"){
				alert("오류 발생");
			}
			
		},
		error:function(){
			alert('네트워크 오류 발생');
		}
	});
	$('#manage-cancel-btn').click(function(){
		$('#manage_modal').css('display','none');
	});
}
function deleteClub(club_num){
	$.ajax({
		url:'deleteClub.do',
		type:'post',
		data:{
			club_num:club_num
		},
		dataType:'json',
		cache:false,
		timeout:30000,
		success:function(data){
			if(data.result=="success"){
				location.href="${pageContext.request.contextPath}/club/club.do";
			}
			if(data.result=="errors"){
				
				alert('오류 발생');
				$(window).click(function(){
					$("#delete_modal").css("display","none");
				});
			}
			
		},
		error:function(){
			alert('네트워크 오류 발생');
		}
	});
	$('#delete-cancel-btn').click(function(){
		$('#delete_modal').css('display','none');
	});
}
function updateMember(id,auth,club_num){
	$.ajax({
		url:'manageMember.do',
		type:'post',
		data:{
			id:id,
			auth:auth,
			club_num:club_num
		},
		dataType:'json',
		cache:false,
		timeout:30000,
		success:function(data){
			if(data.result=="member_auth_updated"){
				if(id=="${user_id}"){
					location.href='${pageContext.request.contextPath}/club/club.do';
				}
				var crown=document.getElementById(id);
				//왕관표시 업데이트
				toggleClass(crown,"visible");
				//총 회원 및 나이별 회원수 업데이트
				//data-auth 업데이트
				var data_auth=document.getElementById(id+"-i");
				data_auth.setAttribute('data-auth',auth);
				
				$('#manage_modal').css('display','none');
				
			}else if(data.result=='member_deleted'){
				if(id=='${user_id}'){
					location.href='${pageContext.request.contextPath}/club/club.do';
				}
				$('#manage_modal').css('display','none');
				var member_row=document.getElementById(id+'-row');
				member_row.remove();
			}
			if(data.result=="errors"){
				
				alert('오류 발생');
				$(window).click(function(){
					$("#manage_modal").css("display","none");
				});
				
			}
			
		},
		error:function(){
			alert('네트워크 오류 발생');
		}
	});
	$('#manage-cancel-btn').click(function(){
		$('#manage_modal').css('display','none');
	});
}
function toggleClass(element, className) {
	var check = new RegExp("(\\s|^)" + className + "(\\s|$)"); 
	if (check.test(element.className)) {
		element.className = element.className.replace(check, " ").trim();
	} else {
		element.className += " " + className;
	}
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
			url:'${pageContext.request.contextPath}/main/vote.do',
			type:'post',
			data:{
				id:'${user_id}',
				match_num:match_num,
				club_num:'${myClub.club_num}',
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
/* function updateMembers_num(ten,twent,thirt,fourt,fift,sixt,sevent,others){
	var total=ten+twent+thirt+fourt+fift+sixt+sevent+others;
	var num=" ( ";
	if(ten!=0){num+="10대:"+ten+"명 "}
	if(twent!=0){num+="20대:"+twent+"명 "}
	if(thirt!=0){num+="30대:"+thirt+"명 "}
	if(fourt!=0){num+="40대:"+fourt+"명 "}
	if(fift!=0){num+="50대:"+fift+"명 "}
	if(sixt!=0){num+="60대:"+sixt+"명 "}
	if(sevent!=0){num+="70대:"+sevent+"명 "}
	if(others!=0){num+="기타:"+sevent+"명 "}
	num+=")"
	$('#ages').text(num);
	$('#total').text("총 회원 "+total+"명");
} */

function answerForMatchReq(request_num,club_name,acceptance,club_num,match_num){
	if(acceptance==2){
		$('#answer_msg').text(club_name+'의 경기 신청을 수락하겠습니까?');
		var info='<br>(해당 경기에 '+club_name+'외 나머지 팀의 신청은 거절합니다)'
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
				club_name:club_name,
				match_num:match_num,
				home_name:'${myClub.club_name}',
				home:${myClub.club_num}
				},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(data){
				if(data.result=="updated"){
					var status=document.getElementById('status-'+request_num);
					status.className = status.className.replace(/\bneutral\b/g, "");
					if(acceptance==2){
						location.href='manageClub.do?club_num=${myClub.club_num}&clubManageFrom=3'
					}else if(acceptance==3){
						status.classList.add('negative');
						status.innerText='거절 완료';
					}
					$('#answer_modal').css('display','none');
					document.getElementById('match-btn-'+request_num).style.display="none";
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
	
	$('#cancel-btn').click(function(){
		$('#answer_modal').css('display','none');
	});
	
}
var manage_modal=document.getElementById('manage_modal');
var answer_modal=document.getElementById('answer_modal');
window.onclick = function(event) {
	if (event.target == answer_modal) {
		answer_modal.style.display = "none";
	}else if(event.target==manage_modal){
		manage_modal.style.display = "none";
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

function blockTap(blockedTap) {
	$('.tab_detail').css('display','none');
	$('.tab-btn').removeClass(' tab-active');
	var tap=document.getElementById(blockedTap);
	tap.style.display="block";
	document.getElementById(blockedTap+'-btn').className +=' '+ 'tab-active';
	
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
	
		
	var clubManageFrom='${clubManageFrom}';
	if(clubManageFrom==2){
		blockTap('manageMatch');
	}else if(clubManageFrom == 3){
		blockTap('manageSchedule');
	}else {
		blockTap('manageMember');
	};
	
	
	var collap = document.getElementsByClassName("collapsible");
	var i;

	for (i = 0; i < collap.length; i++) {
		collap[i].addEventListener("click", function() {
	    var panel = this.nextElementSibling;
	    var detail = panel.firstChild;
	    if (panel.style.maxHeight) {
	    	panel.style.maxHeight = null;
	    	$(this).text("add_circle_outline");
	    } else {
	    	$(this).text("remove_circle_outline");
	      	if (detail.firstChild!=null){
	      		detail.style.padding = "5px";
	      	}
	    	panel.style.maxHeight = (panel.scrollHeight+1000 )+ "px";

	      	
	    } 
	  });
	}
	 let matches=new Array();
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
	  $('.alert-btn').click(function(){
		 
		  $('#toast').css('display','none');
		  
	  });
	
});

	


</script>