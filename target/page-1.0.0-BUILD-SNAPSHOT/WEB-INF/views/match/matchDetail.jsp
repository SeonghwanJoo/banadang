<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<span class="active">${title }</span>
		</div>
	</div>
</div>
<div class="blank_div"></div>
<div class="invite-wrapper" id="invite-wrapper">
 	<ul class="ul-list">
		<li class="li-list">
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
					<span class="match-item"><i class="far fa-calendar-alt margin-right"></i>${match.match_date}</span>
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
						<c:if test="${ match.home_filename eq 'undefined'   }">
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
			<div class="team-info col margin-top">
				<div class="centered margin-top">
					<c:if test="${match.away>0 }">
					<span class="material-icons">
					error
					</span>
					</c:if>
					<c:if test="${match.away==0 }">
					<span class="material-icons">
						campaign
						</span>
					</c:if>
					<c:if test="${ match.away==-1}">
					<img src="${pageContext.request.contextPath }/resources/images/blank_emblem.png" alt="Avatar" class="avatar emblem">
					</c:if>
					${match.away_name }
				</div>
			</div>
			</c:if>
		</div>
		</li>
		<li class="li-list">
			<span>${match.address}</span>
			<span class="cost">(구장 비용 : ${match.cost })</span>
			<div id="map" style="width:100%;height:300px;"></div>
		</li>
		<c:if test="${!empty match.match_detail }">
		<li class="li-list">
			<textarea class="detail" readonly="readonly">${match.match_detail }</textarea>
		</li>
		</c:if>
	</ul>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

	$(function(){
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
	});
  	
</script>