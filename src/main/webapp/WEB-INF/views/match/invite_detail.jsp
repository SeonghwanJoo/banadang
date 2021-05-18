<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="row" id="top_wrap">
	<div class="fixed_top">
		<a href="javascript:location.href='match_toInvite.do'">
		<span class="material-icons" id="cancel">close</span>
		</a>
		<div class="topnav-centered">
			<span class="active">${title }</span>
		</div>
		<c:if test="${match.club_num!=myClub.club_num }">
		<input type="submit" id="submit" value="신청">
		</c:if>
		<c:if test="${match.club_num==myClub.club_num && myClub.club_auth>4 }">
		<span class="material-icons more cursor xl-font" id="more">more_horiz</span>
		</c:if>
	</div>
</div>
<div class="blank_div"></div>
<c:if test="${empty user_id }">
<div class="confirm-modals" style="display:block">
	<div class="confirm-modal-content">
		<div class="login">
			<div class="login-wrapper">
				<p class="black-bg-op bold">로그인이 필요한 페이지 입니다</p>
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
</div>
</c:if>
<c:if test="${not empty user_id && empty myClub }">
<!-- The Modal -->
<div id="emptyClub_toast" class="submit_toast" style="display:flex">
  <!-- Modal content -->
    <div id="emptyClub_submit_toast_content" class="submit_toast_content">
		<div class="row centered margin-btm centered-padding">
			<span id="club_msg">
				소속팀이 없습니다.<br><br>
				<b>팀을 만들고 <br>
				매치 신청해주세요.</b>
			</span>
		</div>
		<div class="row margin-top centered">
			<div class="col">
				<button class="alert-btn border-right-gray" id="emptyClub_confirm">목록</button>
			</div>
			<div class="col">
				<button class="alert-btn" id="create">팀 만들기</button>
			</div>
		</div>
	</div>
</div>
</c:if>
<div class="invite-wrapper" id="invite-wrapper">
 	<ul class="ul-list non-border-btm">
		<li class="li-list">
			<div class="main-row margin-btm">
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
				<span class="material-icons float-right cursor" id="report_more">more_vert</span>
			</div>
			<div class="row small-font gray">
				<div class="col club_main">
					<c:if test="${match.filename ne 'undefined'}">
					<img src="${pageContext.request.contextPath }/club/imageView.do?club_num=${match.club_num}" alt="Avatar" class="avatar emblem">
					</c:if>
					<c:if test="${match.filename eq 'undefined'}">
					<img src="${pageContext.request.contextPath }/resources/images/blank_emblem.png" alt="Avatar" class="avatar emblem">
					</c:if>
					<span class="club_name">${match.club_name }</span><br>
					<span class="uniform">
						유니폼
						<c:if test="${!empty match.club_color }">
						<span class="color" style="background-color:${match.club_color}"></span>
						</c:if>
						<c:if test="${empty match.club_color }">
						미정
						</c:if>
					</span>
				</div>
				<div class="col">
					<span class="age">연령대 <span class="xs-font margin-left">${match.club_age }</span></span><br>
					<span class="send-msg cursor" onclick="location.href='${pageContext.request.contextPath}/member/writeMsg.do?match_num=${match.match_num }&club_num=${match.club_num }&id=${match.id }'" >
						<b>메시지 보내기</b>
						<i class="fas fa-comment"></i>
					</span>
				</div>
			</div>
		</li>
		<li class="li-list cursor" onclick="location.href='${pageContext.request.contextPath}/club/club_details.do?club_num=${match.club_num }'">
			<span class="rating_count">총 ${match.count }명의 평가 <i class="fas fa-chevron-right"></i></span>
			<div class="row small-font gray">
				<div class="col flex-start">
					매너 
					<span class="star-rating">
						<span style="width:${match.manner*20}%"></span>
					</span>${match.manner*2}
				</div>
				<div class="col flex-start">
					실력  
					<span class="star-rating">
						<span style="width:${match.perform*20}%"></span>
					</span>${match.perform*2}
				</div>			
			</div>
		</li>
		<li class="li-list">
			<span>${match.address} 
				<c:if test="${match.away == 0 }">
				(으)로 초청합니다
				</c:if>
				<c:if test="${match.away == -2 }">
				 주변 지역으로 초청해주세요
				</c:if>
			</span><br>
			<span>구장 비용 : ${match.cost }</span><br>
			<span>연락처 : ${match.phone }</span>
			<div id="map"></div>
		</li>
		<c:if test="${!empty match.match_detail }">
		<li class="li-list">
			<p class="detail readonly" id="match_detail">${match.match_detail }</p>
		</li>
		</c:if>
		<li class="li-list non-border-btm">
			<textarea class="detail input-field" id="request_detail" name="request_detail" placeholder="매치 신청 시 ${match.club_name } 팀에 추가적으로 전달할 내용 입력"></textarea>
		</li>
	</ul>
</div>
<div class="mid-banner">
	<ins class="kakao_ad_area" style="display:none;" 
	 data-ad-unit    = "DAN-gCSwQUEFuriXnEOA" 
	 data-ad-width   = "320" 
	 data-ad-height  = "100"></ins>
</div>
<script type="text/javascript" src="//t1.daumcdn.net/kas/static/ba.min.js" async></script>
<!-- The Modal -->
<div id="toast" class="submit_toast">
	<!-- Modal content -->
	<div id="toast-content" class="submit_toast_content">
		<div class="row centered margin-btm centered-padding">
			<span id="matchRequest_msg">경기 신청 완료</span>
		</div>
		<div class="row margin-top centered">
			<button class="alert-btn" id="confirm">확인</button>
		</div>
	</div>
</div>
<!-- The Modal -->
<div id="myClub-toast" class="submit_toast">
	<!-- Modal content -->
	<div id="myClub-toast-content" class="submit_toast_content">
		<div class="row centered margin-btm centered-padding">
			<span>소속팀의 운영진만 경기 신청 가능합니다</span>
		</div>
		<div class="row margin-top centered">
			<button class="alert-btn">확인</button>
		</div>
	</div>
</div>
<div id="more_modal" class="confirm-modals">
	<!-- Modal content -->
	<div class="confirm-modal-content">
		<div class="sub-content">
			<button id="modify" class="pos-btn" onclick="location.href='modifyMatch.do?match_num=${match.match_num}&club_num=${myClub.club_num }'">수정</button>
			<hr>
			<button id="delete" class="pos-btn red" onclick="location.href='deleteMatch.do?match_num=${match.match_num}&club_name=${myClub.club_name }&club_num=${myClub.club_num }'">삭제</button>
		</div>
		<div class="sub-content">
			<button id="more-cancel-btn" class="neg-btn">닫기</button>
		</div>
	</div>
</div>
<div id="report_more_modal" class="confirm-modals">
	<!-- Modal content -->
	<div class="confirm-modal-content">
		<div class="sub-content">
			<button id="report" class="pos-btn" onclick="location.href='${pageContext.request.contextPath }/member/writeReport.do?source=1&reported_id=${match.id}&reporting_id=${user_id}&write_num=${match.match_num}&content=${match.match_detail }&name=${match.club_name }'">신고하기</button>
		</div>
		<div class="sub-content">
			<button id="report-more-cancel-btn" class="neg-btn">닫기</button>
		</div>
	</div>
</div>
<!-- The Modal -->
<div id="myModals" class="modals middle">
	<!-- Modal content -->
	<div class="modals-content">
		<span id="close_mod" class="close_mod">&times;</span>
		<span class="input-label">초청 경기 일자</span>
		<div class="row margin-top">
			<div class="input-container col">
				<i class="fas fa-calendar-alt icon"></i> 
				<span class="margin-top gray">${match.match_date }</span>
			</div>
		</div>
		<hr class="hr">
		<span class="input-label">경기 제안 장소 지도 검색</span>
		<div class="row margin-m-top">
			<div class="autocomplete input-container col">
				<i class="fas fa-map-marked-alt icon"></i> <input class="input-field radius"
					type="text" name="address" id="address" placeholder="경기 제안 장소 지도 검색" readonly="readonly">
			</div>
			<input type="hidden" name="address_x" id="address_x">
			<input type="hidden" name="address_y" id="address_y">
		</div>
		<div class="row"><div class="col"><span class="msg" id="address_msg"></span></div></div>
		<hr class="hr">
		<span class="input-label">경기 제안 시간 선택</span>
		<div class="row centered-padding margin">
			<div class="input-container col selectbox">
				<label for="start_time">시작 시간 선택</label>
				<select class="time input-field" id="start_time" name="start_time">
					<option value="" selected>시작 시간 선택</option>
					<option value="06:00">06:00</option>
					<option value="06:30">06:30</option>
					<option value="07:00">07:00</option>
					<option value="07:30">07:30</option>
					<option value="08:00">08:00</option>
					<option value="08:30">08:30</option>
					<option value="09:00">09:00</option>
					<option value="09:30">09:30</option>
					<option value="10:00">10:00</option>
					<option value="10:30">10:30</option>
					<option value="11:00">11:00</option>
					<option value="11:30">11:30</option>
					<option value="12:00">12:00</option>
					<option value="12:30">12:30</option>
					<option value="13:00">13:00</option>
					<option value="13:30">13:30</option>
					<option value="14:00">14:00</option>
					<option value="14:30">14:30</option>
					<option value="15:00">15:00</option>
					<option value="15:30">15:30</option>
					<option value="16:00">16:00</option>
					<option value="16:30">16:30</option>
					<option value="17:00">17:00</option>
					<option value="17:30">17:30</option>
					<option value="18:00">18:00</option>
					<option value="18:30">18:30</option>
					<option value="19:00">19:00</option>
					<option value="19:30">19:30</option>
					<option value="20:00">20:00</option>
					<option value="20:30">20:30</option>
					<option value="21:00">21:00</option>
					<option value="21:30">21:30</option>
					<option value="22:00">22:00</option>
					<option value="22:30">22:30</option>
					<option value="23:00">23:00</option>
					<option value="23:30">23:30</option>
					<option value="24:00">00:00</option>
					<option value="24:30">00:30</option>
					<option value="01:00">01:00</option>
					<option value="01:30">01:30</option>
					<option value="02:00">02:00</option>
					<option value="02:30">02:30</option>
					<option value="03:00">03:00</option>
					<option value="03:30">03:30</option>
					<option value="04:00">04:00</option>
					<option value="04:30">04:30</option>
					<option value="05:00">05:00</option>
					<option value="05:30">05:30</option>
				</select>
			</div>
			<span class="from-to">~</span>
			<div class="input-container col selectbox">
				<label for="end_time">종료 시간 선택</label>
				<select class="time input-field" id="end_time" name="end_time">
					<option class="placeholder" value="">종료 시간 선택</option>
					<option value="06:00">06:00</option>
					<option value="06:30">06:30</option>
					<option value="07:00">07:00</option>
					<option value="07:30">07:30</option>
					<option value="08:00">08:00</option>
					<option value="08:30">08:30</option>
					<option value="09:00">09:00</option>
					<option value="09:30">09:30</option>
					<option value="10:00">10:00</option>
					<option value="10:30">10:30</option>
					<option value="11:00">11:00</option>
					<option value="11:30">11:30</option>
					<option value="12:00">12:00</option>
					<option value="12:30">12:30</option>
					<option value="13:00">13:00</option>
					<option value="13:30">13:30</option>
					<option value="14:00">14:00</option>
					<option value="14:30">14:30</option>
					<option value="15:00">15:00</option>
					<option value="15:30">15:30</option>
					<option value="16:00">16:00</option>
					<option value="16:30">16:30</option>
					<option value="17:00">17:00</option>
					<option value="17:30">17:30</option>
					<option value="18:00">18:00</option>
					<option value="18:30">18:30</option>
					<option value="19:00">19:00</option>
					<option value="19:30">19:30</option>
					<option value="20:00">20:00</option>
					<option value="20:30">20:30</option>
					<option value="21:00">21:00</option>
					<option value="21:30">21:30</option>
					<option value="22:00">22:00</option>
					<option value="22:30">22:30</option>
					<option value="23:00">23:00</option>
					<option value="23:30">23:30</option>
					<option value="24:00">00:00</option>
					<option value="24:30">00:30</option>
					<option value="01:00">01:00</option>
					<option value="01:30">01:30</option>
					<option value="02:00">02:00</option>
					<option value="02:30">02:30</option>
					<option value="03:00">03:00</option>
					<option value="03:30">03:30</option>
					<option value="04:00">04:00</option>
					<option value="04:30">04:30</option>
					<option value="05:00">05:00</option>
					<option value="05:30">05:30</option>
				</select>
			</div>
		</div>
		<div class="row padding-left">
			<div class="col"><span class="msg no-margin" id="start_msg"></span></div>
			<div class="col"><span class="msg no-margin  padding-left" id="end_msg"></span></div>
		</div>
		<hr class="hr">
		<div class="row margin-top">
			<input type="button" class="block black-bg" id="submit_invite" value="초청 제안하기">
		</div>
	</div>
</div>
<!-- The Modal -->
<div id="myModals_map" class="modals top">
	<!-- Modal content -->
	<div class="modals-content">
	    <span id="close_map" class="close_mod">&times;</span>
		<div class="row margin-top centered-padding">
			<div class="input-container col" id="search_modal">
				<input type="text" placeholder="장소 키워드 입력" name="search" class="searchBar" id="keyword" autofocus="autofocus">
		  		<button class="search_btn" id="search_btn"><i class="fa fa-search"></i></button>
	  		</div>
  		</div>
  		<div class="row centered-padding">
  			<div id="map_modal" style="width:100%;height:10rem;"></div>
  		</div>
        <div id="menu_wrap" class="bg_white">
        <hr>
	        <ul id="placesList"></ul>
	        <div id="pagination"></div>
        </div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
	
	Kakao.init('32776969383e4a77d92f6e18dd233bc5');
	
	var state='';
	if($('input:checkbox').is(':checked')){
	 	state=true;
	}
	function login(throughTalk){
		
		Kakao.Auth.authorize({
			  redirectUri: $(location).attr('protocol')+"//"+"${pageContext.request.serverName }${pageContext.request.contextPath}/member/matchLogin.do"
			  ,state: '${match.match_num}' + '-' + state
			  ,throughTalk: throughTalk
		});
		
	 }

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
	
	
	
	
	$(function(){
		
		var content=$('#match_detail').text();
		$('#report').click(function(){
			location.href='${pageContext.request.contextPath }/member/writeReport.do?source=1&'+'reported_id='+'${match.id}'+'&reporting_id=${user_id}&write_num='+'${match.match_num}'+'&content='+content+'&name='+'${match.club_name}';
		});
		
		var selectTarget = $('.selectbox select');

	    selectTarget.change(function(){
	        var select_name = $(this).children('option:selected').text();
	        $(this).siblings('label').text(select_name);
	    });
	    
	    selectTarget.on({
	        'focus' : function () {
	            $(this).parent().addClass('focus');
	        },
	        'blur' : function () {
	            $(this).parent().removeClass('focus');
	        }
	    });
	    /* map in modal */
		var input=document.getElementById('keyword');
		// Execute a function when the user releases a key on the keyboard
		input.addEventListener("keyup", function(event) {
		  // Number 13 is the "Enter" key on the keyboard
		  if (event.keyCode === 13) {
		    // Cancel the default action, if needed
		    event.preventDefault();
		    // Trigger the button element with a click
		    document.getElementById("search_btn").click();
		  }
		});
		
		search_btn.onclick=function(){
			
			input.blur();
			// 마커를 담을 배열입니다
			var markers = [];
		
			var mapContainer = document.getElementById('map_modal'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			        level: 3, // 지도의 확대 레벨
			    };  
		
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
		
			// 장소 검색 객체를 생성합니다
			var ps = new kakao.maps.services.Places();  
		
			// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({zIndex:1});
		
			// 키워드로 장소를 검색합니다
			searchPlaces();
		
			// 키워드 검색을 요청하는 함수입니다
			function searchPlaces() {
		
			    var keyword = document.getElementById('keyword').value;
		
			    if (!keyword.replace(/^\s+|\s+$/g, '')) {
			        alert('키워드를 입력해주세요!');
			        return false;
			    }
			    var options ={
			    		size:5
			    		
			    }
		
			    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			    ps.keywordSearch( keyword, placesSearchCB,options); 
			}
		
			// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
			function placesSearchCB(data, status, pagination) {
			    if (status === kakao.maps.services.Status.OK) {
		
			        // 정상적으로 검색이 완료됐으면
			        // 검색 목록과 마커를 표출합니다
			        displayPlaces(data);
		
			        // 페이지 번호를 표출합니다
			        displayPagination(pagination);
		
			    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
		
			        alert('검색 결과가 존재하지 않습니다.');
			        return;
		
			    } else if (status === kakao.maps.services.Status.ERROR) {
		
			        alert('검색 결과 중 오류가 발생했습니다.');
			        return;
		
			    }
			}
		
			// 검색 결과 목록과 마커를 표출하는 함수입니다(data>places)
			function displayPlaces(places) {
		
			    var listEl = document.getElementById('placesList'), 
			    menuEl = document.getElementById('menu_wrap'),
			    fragment = document.createDocumentFragment(), 
			    bounds = new kakao.maps.LatLngBounds(), 
			    listStr = '';
			    
			    // 검색 결과 목록에 추가된 항목들을 제거합니다
			    removeAllChildNods(listEl);
		
			    // 지도에 표시되고 있는 마커를 제거합니다
			    removeMarker();
			    
			    for ( var i=0; i<places.length; i++ ) {
		
			        // 마커를 생성하고 지도에 표시합니다
			        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
			            marker = addMarker(placePosition, i), 
			            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
		
			        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			        // LatLngBounds 객체에 좌표를 추가합니다
			        bounds.extend(placePosition);
		
			        // 마커와 검색결과 항목에 mouseover 했을때
			        // 해당 장소에 인포윈도우에 장소명을 표시합니다
			        // mouseout 했을 때는 인포윈도우를 닫습니다
			        (function(marker, title) {
			            kakao.maps.event.addListener(marker, 'mouseover', function() {
			                displayInfowindow(marker, title);
			            });
		
			            kakao.maps.event.addListener(marker, 'mouseout', function() {
			                infowindow.close();
			            });
		
			            itemEl.onmouseover =  function () {
			                displayInfowindow(marker, title);
			            };
		
			            itemEl.onmouseout =  function () {
			                infowindow.close();
			            };
			        })(marker, places[i].place_name);
		
			        fragment.appendChild(itemEl);
			    }
		
			    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
			    listEl.appendChild(fragment);
			    menuEl.scrollTop = 0;
		
			    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			    map.setBounds(bounds);
			}
		
			// 검색결과 항목을 Element로 반환하는 함수입니다
			function getListItem(index, places) {
		
			    var el = document.createElement('li'),
			    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
			                '<div class="info">' +
			                '   <h6>' + places.place_name + '</h6>';
		
			    if (places.road_address_name) {
			        itemStr += '    <span>' + places.road_address_name + '</span></div>'
			    } else {
	 		        itemStr += '    <span>' +  places.address_name  + '</span></div>'
			    }
		
			    el.innerHTML = itemStr;
			    el.className = 'item';
			    el.id='item'+index;
			    el.onclick=function(){
			    	document.getElementById('address').value=places.place_name;
			    	document.getElementById('address_x').value=places.x;
			    	document.getElementById('address_y').value=places.y;
			  		$('#myModals_map').css('display','none');
			    };
		
			    return el;
			}
		
			// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
			function addMarker(position, idx, title) {
			    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
			        imgOptions =  {
			            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
			            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
			            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
			        },
			        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
			            marker = new kakao.maps.Marker({
			            position: position, // 마커의 위치
			            image: markerImage 
			        });
		
			    marker.setMap(map); // 지도 위에 마커를 표출합니다
			    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
		
			    return marker;
			}
		
			// 지도 위에 표시되고 있는 마커를 모두 제거합니다
			function removeMarker() {
			    for ( var i = 0; i < markers.length; i++ ) {
			        markers[i].setMap(null);
			    }   
			    markers = [];
			}
		
			// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
			function displayPagination(pagination) {
			    var paginationEl = document.getElementById('pagination'),
			        fragment = document.createDocumentFragment(),
			        i; 
		
			    // 기존에 추가된 페이지번호를 삭제합니다
			    while (paginationEl.hasChildNodes()) {
			        paginationEl.removeChild (paginationEl.lastChild);
			    }
		
			    for (i=1; i<=3; i++) {
			        var el = document.createElement('a');
			        el.href = "#";
			        el.innerHTML = i;
		
			        if (i===pagination.current) {
			            el.className = 'on';
			        } else {
			            el.onclick = (function(i) {
			                return function() {
			                    pagination.gotoPage(i);
			                }
			            })(i);
			        }
		
			        fragment.appendChild(el);
			    }
			    paginationEl.appendChild(fragment);
			}
		
			// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
			// 인포윈도우에 장소명을 표시합니다
			function displayInfowindow(marker, title) {
			    var content = '<div style="word-break: keep-all;width:200px;text-overflow:ellipsis;padding:5px;z-index:1;">'
			    					+ title + '</div>';
		
			    infowindow.setContent(content);
			    infowindow.open(map, marker);
			}
		
			 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
			function removeAllChildNods(el) { 
			    while (el.hasChildNodes()) {
			        el.removeChild (el.lastChild);
			    }
			}
		
		};
	    $('#address').click(function(){
	    	$('#myModals_map').css('display','block');
	    })
	    $('#close_map').click(function(){
	    	$('#myModals_map').css('display','none');
	    })
		
		
		if (${match.club_color eq 'rgb(0, 0, 0)'}){
			$(".color").css("border","1px solid #fff");
		}
		
		$('#more').click(function(){
			$('#more_modal').css('display','block');
		});
		$('#more-cancel-btn').click(function(){
			$('#more_modal').css('display','none');
		});
		
		$('#report_more').click(function(){
			$('#report_more_modal').css('display','block');
		});
		$('#report-more-cancel-btn').click(function(){
			$('#report_more_modal').css('display','none');
		});
		
		$("#emptyClub_confirm").click(function(){
			location.href='${pageContext.request.contextPath}/match/match_toInvite.do';
		});
		$('#create').click(function(){
			location.href='${pageContext.request.contextPath}/club/createClubForm.do';
		});
		$('#address').click(function(){
			$('#address_msg').text('');
		});
		$('#start_time').click(function(){
			$('#start_msg').text('');
		});
		$('#end_time').click(function(){
			$('#end_msg').text('');
		});
		
		$('#submit').click(function(){
			
			var away = '${match.away}'
			//away가 -2이면 장소, 시간 제안할수 있는 모달창을 띄운다
			//유효성을 검증한다
			//match_request에 시간, 장소를 포함하여 insert한다
			if(away != -2){
				
				postMatchRequest( 
					${match.match_num}, '${user_id}', '${myClub.club_num}', 
					$('#request_detail').val(),'${match.id}','${match.club_num}','${match.club_name}','','',''
				);
				
			}else{
				
				$('#myModals').css('display','block');
				$('#submit_invite').click(function(){
					
					var address = $('#address').val();
					var start_time = $('#start_time').val();
					var end_time = $('#end_time').val();
					
					if(!address.replace(/^\s+|\s+$/g, '')){
						$('#address_msg').css('color','red').text('경기 제안 장소를  입력해주세요');
						return
					}
					if(start_time==''){
						$('#start_msg').css('color','red').text('시작 시간을  선택해주세요');
						return;
					}
					if(end_time==''){
						$('#end_msg').css('color','red').text('종료 시간을  선택해주세요');
						return;
					}
					$('#myModals').css('display','none');
					
					postMatchRequest( 
							${match.match_num}, '${user_id}', '${myClub.club_num}', 
							$('#request_detail').val(),'${match.id}','${match.club_num}',
							'${match.club_name}',address,start_time,end_time
						);
					
					return;
					
				});
				
			}
			
			

		});
		$('#close_mod').click(function(){
			$('#myModals').css('display','none');
		});
	});
	
	function postMatchRequest(a,b,c,d,e,f,g,i,j,k){
		if(c==''||${myClub.club_auth<5}){
			$('#myClub-toast').css('display','flex');
			$('#myClub-toast').click(function(){
				$('#myClub-toast').css('display','none');
			})
			return;
		}
		$.ajax({
			url:'postMatchRequest.do',
			type:'post', 
			data:{
				match_num: a,
				id:b,
				away:c,
				request_detail:d,
				home_name:e,
				club_num:f,
				club_name:g,
				address: i,
				start_time: j,
				end_time: k
			},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(data){
				$('#toast').css('display','flex');
				if(data.result=='requested'){
					$('#matchRequest_msg').text('홈팀 '+g+'에게 어웨이 ${myClub.club_name}팀이 경기 신청했습니다.');
				}else if(data.result=='duplicated'){
					$('#matchRequest_msg').text('이미 경기 신청하셨습니다');
				}else{
					$('#matchRequest_msg').text('경기 신청 오류');
				}
				
				$('#confirm').click(function(){
					if(data.result=='requested'){
						location.href='${pageContext.request.contextPath}/club/manageClub.do?club_num=${myClub.club_num}&clubManageFrom=2';
					}else{
						$('#toast').css('display','none');
					}
					
				});
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
	}
  	
</script>