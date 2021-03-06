<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<form:form class="col s12" id="form" autocomplete="off" accept-charset="utf-8">
	<input type="hidden" name="id" value="${user_id }">
	<input type="hidden" name="match_num" id="match_num" value="${match.match_num }">
	<input type="hidden" id="home" name="home" value="${myClub.club_num}">
	<input type="hidden" name="away" id="away" value="${match.away }">
	<input type="hidden" id="home_name" name="home_name" value="${myClub.club_name }">
	<div class="row" id="top_wrap">
		<div class="fixed_top">
			<a href="#" onclick="back()">
			<span class="material-icons" id="cancel">close</span>
			</a>
			<div class="topnav-centered">
				<span class="active">${title }</span>
			</div>
			<input type="submit" id="submit" value="완료">
		</div>
	</div>
	<div class="blank_div"></div>
	<span class="red" id="disabled-txt" class="small-font"></span>
	<ul class="ul-list non-border-btm">
		<li class="li-list">
			<span class="input-label">경기 유형(축구/풋살) 선택</span>
			<div class="row centered-padding  margin-m-top">
				<c:if test="${match.type==1 }">
				<label class="label-sq">
					<span class="label-txt">축구</span>
					<input type="radio" name="type" id="soccer" value="1" checked="checked">
					<span class="checkmark-sq"></span>
				</label> 
				<label class="label-sq">
					<span class="label-txt">풋살</span>
					<input type="radio" name="type" id="futsal" value="2">
					<span class="checkmark-sq"></span>
				</label>
				</c:if>
				<c:if test="${match.type==2 }">
				<label class="label-sq">
					<span class="label-txt">축구</span>
					<input type="radio" name="type" id="soccer" value="1" >
					<span class="checkmark-sq"></span>
				</label> 
				<label class="label-sq">
					<span class="label-txt">풋살</span>
					<input type="radio" name="type" id="futsal" value="2" checked="checked">
					<span class="checkmark-sq"></span>
				</label>
				</c:if>
			</div>
		</li>
		<li class="li-list">
			<span class="input-label">예정된 상대팀 있음/상대팀 초청 선택</span>
			<div class="row centered-padding margin-m-top">
				<c:if test="${match.away==0 }">
				<label class="small-font label-sq padding-top">
					<input type="radio" name="opponent" id="exist">
					<span class="checkmark-sq"></span>
					<span class="label-txt">상대팀 있음</span>
				</label>
				<label class="small-font label-sq padding-top">
					<input type="radio" name="opponent" id="non-exist" checked="checked">
					<span class="checkmark-sq"></span>
					<span class="label-txt">초청합니다</span>
				</label>
				<label class="small-font label-sq padding-top no-margin">
					<input type="radio" name="opponent" id="invite_me">
					<span class="checkmark-sq"></span>
					<span class="label-txt">초청해주세요</span>
				</label>
				</c:if>
				<c:if test="${match.away==-2 }">
				<label class="small-font label-sq padding-top">
					<input type="radio" name="opponent" id="exist">
					<span class="checkmark-sq"></span>
					<span class="label-txt">상대팀 있음</span>
				</label>
				<label class="small-font label-sq padding-top">
					<input type="radio" name="opponent" id="non-exist">
					<span class="checkmark-sq"></span>
					<span class="label-txt">초청합니다</span>
				</label>
				<label class="small-font label-sq padding-top no-margin">
					<input type="radio" name="opponent" id="invite_me" checked="checked">
					<span class="checkmark-sq"></span>
					<span class="label-txt">초청해주세요</span>
				</label>
				</c:if>
				<c:if test="${match.away!=-2 && match.away !=0 }">
				<label class="small-font label-sq padding-top">
					<input type="radio" name="opponent" id="exist"  checked="checked">
					<span class="checkmark-sq"></span>
					<span class="label-txt">상대팀 있음</span>
				</label>
				<label class="small-font label-sq padding-top">
					<input type="radio" name="opponent" id="non-exist">
					<span class="checkmark-sq"></span>
					<span class="label-txt">초청합니다</span>
				</label>
				<label class="small-font label-sq padding-top no-margin">
					<input type="radio" name="opponent" id="invite_me">
					<span class="checkmark-sq"></span>
					<span class="label-txt">초청해주세요</span>
				</label>
				</c:if>
			</div>
		</li>
		<li class="li-list" id="away-wrapper">
			<div class="row">
				<div class="autocomplete input-container col">
					<i class="fa fa-users icon"></i> <input class="input-field"
						type="text" placeholder="상대팀명 입력 (목록에서 선택)" name="away_name" id="away_name" value="${match.away_name}">
				</div>
			</div>
		<div class="row"><div class="col"><span class="msg" id="away_msg"></span></div></div>
		</li>
		<li class="li-list">
		<div class="row">
			<div class="autocomplete input-container col">
				<i class="fas fa-map-marked-alt icon"></i> <input class="input-field"
					type="text" name="address" id="address" placeholder="경기 장소 지도 검색" value="${match.address }" readonly="readonly">
			</div>
			<input type="hidden" name="address_x" id="address_x" value="${match.address_x }">
			<input type="hidden" name="address_y" id="address_y" value="${match.address_y }">
		</div>
		<div class="row"><div class="col"><span class="msg" id="address_msg"></span></div></div>
		</li>
		<li class="li-list">
		<div class="row">
			<div class="input-container col">
				<i class="fas fa-calendar-alt icon"></i> <input class="input-field"
					type="text" id="datepicker" placeholder="경기 날짜 선택" name="match_date" value=${match.match_date } readonly="readonly">
			</div>
		</div>
		<div class="row"><div class="col"><span class="msg" id="date_msg"></span></div></div>
		</li>
		<li class="li-list">
		<div class="row centered-padding margin">
			<div class="input-container col selectbox">
				<label for="start_time">${match.start_time }</label>
				<select class="time input-field" id="start_time" name="start_time">
					<option value="${match.start_time }">${match.start_time }</option>
					<option class="placeholder" value="">시작 시간 선택</option>
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
				<label for="end_time">${match.end_time }</label>
				<select class="time input-field" id="end_time" name="end_time">
					<option class="placeholder" value="${match.end_time }">${match.end_time }</option>
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
			<div class="col"><span class="msg no-margin" id="end_msg"></span></div>
		</div>
		</li>
		<li class="li-list"  id="cost-wrapper" style="display:none">	
			<div class="row">
				<div class="autocomplete input-container col">
					<i class="fas fa-won-sign icon"></i> <input class="input-field"
						type="text" name="cost" id="cost" maxlength="45" placeholder="(상대팀이 부담할)구장 비용 입력" value="${match.cost }">
				</div>
			</div>
		</li>
		<li class="li-list"  id="phone-wrapper" style="display:none">	
		<div class="row">
			<div class="autocomplete input-container col">
				<i class="fas fa-phone-square icon"></i> <input class="input-field"
					type="text" name="phone" id="phone" maxlength="100" placeholder="연락처 입력(앱 알림 미설정 시 필수)" value="${match.phone}">
			</div>
		</div>
		</li>
		<li class="li-list non-border-btm">	
		<div class="row">
			<div class="text input-container col">
				<textarea class="detail input-field" id="match_detail" name="match_detail" placeholder="추가적으로 공유할 내용이 있으면 입력해주세요.(매너/실력은 자동 계산되어 보여집니다)">${match.match_detail }</textarea>
			</div>
		</div>
		</li>
	</ul>
</form:form>
<!-- The Modal -->
<div id="myModals" class="modals">
	<!-- Modal content -->
	<div class="modals-content">
	    <span class="close_mod">&times;</span>
		<div class="row margin-top centered-padding">
			<div class="input-container col" id="search_modal">
				<input type="text" placeholder="장소 키워드 입력" name="search" class="searchBar" id="keyword" autofocus="autofocus">
		  		<button class="search_btn" id="search_btn"><i class="fa fa-search"></i></button>
	  		</div>
  		</div>
  		<div class="row centered-padding">
  			<div id="map" style="width:100%;height:10rem;"></div>
  		</div>
        <div id="menu_wrap" class="bg_white">
        <hr>
	        <ul id="placesList"></ul>
	        <div id="pagination"></div>
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
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>


$( function() {
	
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
	
    
    //모집중 일때 away=0  팀명 안보여야함
    //등록되지 않은 팀일 때 = -1 팀명 보여야함
    //else  팀명 disable 팀명 보이되 disable
    
    if(${match.away != 0 && match.away != -1 && match.away!=-2}){
    	console.log('exsit disabled 진입  ');
    	$('#exist').attr('disabled',true);
    	$('#non-exist').attr('disabled',true);
    	$('#invite_me').attr('disabled',true);
    	$('#disabled-txt').text('상대팀이 확정된 경기는 상대팀 수정이 불가능합니다.')
    	$('#away_name').attr('readonly', true).css('color','#888');
    }else if(${match.away == 0 || match.away == -2}){
    	$('#away-wrapper').css('display','none');
		$('#cost-wrapper').css('display','block');
		$('#phone-wrapper').css('display','block');
    }else{
    	$('#away-wrapper').css('display','block');
		$('#cost-wrapper').css('display','none');
    }
   
    
	
	$('#exist').click(function(){
		$('#away-wrapper').css('display','block');
		$('#cost-wrapper').css('display','none');
		$('#phone-wrapper').css('display','none');
		$('#address').attr('placeholder','경기 장소 지도 검색');
		$('#away').val('-1');
		$('#away_name').val('');
	});
	$('#non-exist').click(function(){
		$('#away-wrapper').css('display','none');
		$('#cost-wrapper').css('display','block');
		$('#phone-wrapper').css('display','block');
		$('#address').attr('placeholder','경기 장소 지도 검색');
		$('#cost').attr('placeholder','(상대팀이 부담할)구장 비용 입력');
		$('#away').val('0');
		$('#away_name').val('모집 중');
	});
	$('#invite_me').click(function(){
		$('#away-wrapper').css('display','none');
		$('#cost-wrapper').css('display','block');
		$('#phone-wrapper').css('display','block');
		$('#address').attr('placeholder','희망 경기 장소 지도 검색');
		$('#cost').attr('placeholder','구장비 관련 요청 사항 입력');
		$('#away').val('-2');
		$('#away_name').val('모집 중');
		
	});
	$('#soccer').click(function(){
		$('#type').val(1);
	});
	$('#futsal').click(function(){
		$('#type').val(2);
	});
	$('#away_name').click(function(){
		$('#away_msg').text('');
	});
	$('#address').click(function(){
		$('#address_msg').text('');
	});
	$('#datepicker').click(function(){
		$('#date_msg').text('');
	});
	$('#start_time').click(function(){
		$('#start_msg').text('');
	});
	$('#end_time').click(function(){
		$('#end_msg').text('');
	});
	
	$('#form').submit(function(e){
		
		e.preventDefault();
		
		if($('#type').val()==''){
			return false;
		}
		if(!$('#away_name').val().replace(/^\s+|\s+$/g, '')){
			$('#away_msg').css('color','red').text('상대팀을 입력해주세요');
			return false;
		}
		if(!$('#address').val().replace(/^\s+|\s+$/g, '')){
			$('#address_msg').css('color','red').text('장소를  입력해주세요');
			return false;
		}
		if($('#datepicker').val()==''){
			$('#date_msg').css('color','red').text('날짜를  선택해주세요');
			return false;
		}
		if($('#start_time').val()==''){
			$('#start_msg').css('color','red').text('시작 시간을  선택해주세요');
			return false;
		}
		if($('#end_time').val()==''){
			$('#end_msg').css('color','red').text('종료 시간을  선택해주세요');
			return false;
		}
		
		var formData = $('#form').serialize();
		console.log(formData);
		
		$.ajax({
			
			url:'updateMatch.do',
			type:'post',
			data:formData,
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(data){
				if(data.result=="updated"){
					
					$('#club_msg').text('경기 일정 수정 완료');
					$('#toast').css('display','flex');
					$('#confirm').click(function(){
						if(${isFromClub}){
							location.href='${pageContext.request.contextPath}/club/manageClub.do?club_num=${myClub.club_num}&clubManageFrom=3';
							return;
						}
						location.href='${pageContext.request.contextPath}/main/main.do';
					});
					$(window).click(function(){
						if(${isFromClub}){
							location.href='${pageContext.request.contextPath}/club/manageClub.do?club_num=${myClub.club_num}&clubManageFrom=3';
							return;
						}
						location.href='${pageContext.request.contextPath}/main/main.do';
					});
				}
				
				if(data.result=='errors'){
					
					$('#club_msg').text('경기 수정 에러 발생');
					$('#toast').css('display','flex');
					$('#confirm').click(function(){
						$("#toast").css("display","none");
					});
					$(window).click(function(){
						$("#toast").css("display","none");
					});
				}
				
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
	});
	
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
	
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
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
		  		modal.style.display = "none";
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


	
	// Get the modal
	var modal = document.getElementById("myModals");

	// Get the button that opens the modal
	var address = document.getElementById("address");

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close_mod")[0];

	// When the user clicks the button, open the modal 
	address.onclick = function() {
	  modal.style.display = "block";
	}

	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
	  modal.style.display = "none";
	}

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	  if (event.target == modal) {
	    modal.style.display = "none";
	  }
	}
	
	let today=new Date();
	/*datepicker-start*/

	$('#datepicker').daterangepicker(
		{
			"opens" : "left",
			minDate : today,
			singleDatePicker : true,
			showDropdowns : true,
			autoUpdateInput : false,
			autoApply: true,
			"locale" : {
				"format" : "YYYY/MM/DD",
				"separator" : " ~ ",
				"applyLabel" : "Apply",
				"cancelLabel" : "Cancel",
				"fromLabel" : "From",
				"toLabel" : "To",
				"customRangeLabel" : "Custom",
				"weekLabel" : "W",
				"daysOfWeek" : [ "일", "월", "화", "수", "목",
				"금", "토" ],
				"monthNames" : [ "1월", "2월", "3월", "4월",
				"5월", "6월", "7월", "8월", "9월",
				"10월", "11월", "12월" ],
				"firstDay" : 1
				}
		},
		function(start, end, label) {
			/* 자바스크립트 에러시 로그 추적 */
			$('#datepicker').val(start.format('YYYY-MM-DD'));
		});

		/*datepicker-end*/
		function autocomplete(inp, arr,clubs_num,clubs_address) {
			/*the autocomplete function takes two arguments,
			the text field element and an array of possible autocompleted values:*/
			var currentFocus;
			/*execute a function when someone writes in the text field:*/
			inp
					.addEventListener(
							"input",
							function(e) {
								var a, b, i, val = this.value;
								/*close any already open lists of autocompleted values*/
								closeAllLists();
								$('#away_msg').text('');
								if (!val) {
									return false;
								}
								currentFocus = -1;
								/*create a DIV element that will contain the items (values):*/
								a = document.createElement("DIV");
								a.setAttribute("id", this.id
										+ "autocomplete-list");
								a.setAttribute("class", "autocomplete-items");
								c = document.createElement("DIV");
								c.innerHTML = "등록되지 않은 팀 : " + val;
								/*append the DIV element as a child of the autocomplete container:*/
								this.parentNode.appendChild(a);
								a.appendChild(c);
								document.getElementById('away_name').value=val;
								/*for each item in the array...*/
								for (i = 0; i < arr.length; i++) {
									/*check if the item starts with the same letters as the text field value:*/
									if (arr[i].toUpperCase().indexOf(
											val.toUpperCase()) >= 0
											&& val.length >= 2) {
										/*create a DIV element for each matching element:*/
										b = document.createElement("DIV");

										/*make the matching letters bold:*/
										b.innerHTML = arr[i].substr(0, arr[i]
												.toUpperCase().indexOf(
														val.toUpperCase()));
										b.innerHTML += "<strong>"
												+ arr[i]
														.substr(
																arr[i]
																		.toUpperCase()
																		.indexOf(
																				val
																						.toUpperCase()),
																val.length)
												+ "</strong>";
										b.innerHTML += arr[i].substr(arr[i]
												.toUpperCase().indexOf(
														val.toUpperCase())
												+ val.length);
										b.innerHTML += "<span class='club_address'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+clubs_address[i]+"</span>"
										/*insert a input field that will hold the current array item's value:*/
										b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
										b.innerHTML += "<input type='hidden' value='" + clubs_num[i] + "'>";
										
										/*execute a function when someone clicks on the item value (DIV element):*/
										b
												.addEventListener(
														"click",
														function(e) {
															/*insert the value for the autocomplete text field:*/
															inp.value = this
																	.getElementsByTagName("input")[0].value;
															/*away input에 선택된 클럽의 번호 입력*/
															document.getElementById('away').value=this
																	.getElementsByTagName("input")[1].value;
															/*close the list of autocompleted values,
															(or any other open lists of autocompleted values:*/
															closeAllLists();
														});
										a.appendChild(b);
									}   
								}

							});
			/*execute a function presses a key on the keyboard:*/
			inp.addEventListener("keydown", function(e) {
				var x = document.getElementById(this.id + "autocomplete-list");
				if (x)
					x = x.getElementsByTagName("div");
				if (e.keyCode == 40) {
					/*If the arrow DOWN key is pressed,
					increase the currentFocus variable:*/
					currentFocus++;
					/*and and make the current item more visible:*/
					addActive(x);
				} else if (e.keyCode == 38) { //up
					/*If the arrow UP key is pressed,
					decrease the currentFocus variable:*/
					currentFocus--;
					/*and and make the current item more visible:*/
					addActive(x);
				} else if (e.keyCode == 13) {
					/*If the ENTER key is pressed, prevent the form from being submitted,*/
					e.preventDefault();
					if (currentFocus > -1) {
						/*and simulate a click on the "active" item:*/
						if (x)
							x[currentFocus].click();
					}
				}
			});
			function addActive(x) {
				/*a function to classify an item as "active":*/
				if (!x)
					return false;
				/*start by removing the "active" class on all items:*/
				removeActive(x);
				if (currentFocus >= x.length)
					currentFocus = 0;
				if (currentFocus < 0)
					currentFocus = (x.length - 1);
				/*add class "autocomplete-active":*/
				x[currentFocus].classList.add("autocomplete-active");
			}
			function removeActive(x) {
				/*a function to remove the "active" class from all autocomplete items:*/
				for (var i = 0; i < x.length; i++) {
					x[i].classList.remove("autocomplete-active");
				}
			}
			function closeAllLists(elmnt) {
				/*close all autocomplete lists in the document,
				except the one passed as an argument:*/
				var x = document.getElementsByClassName("autocomplete-items");
				for (var i = 0; i < x.length; i++) {
					if (elmnt != x[i] && elmnt != inp) {
						x[i].parentNode.removeChild(x[i]);
					}
				}
			}
			/*execute a function when someone clicks in the document:*/
			document.addEventListener("click", function(e) {
				closeAllLists(e.target);
			});
		}

		/*An array containing all the country names in the world:*/
		let clubs_name = new Array();
		let clubs_num = new Array();
		let clubs_address = new Array();
		<c:forEach items="${list}" var="clubs">
			clubs_name.push("${clubs.club_name}");
			clubs_num.push("${clubs.club_num}");
			clubs_address.push("${clubs.club_address}");
		</c:forEach>

		/*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocompleawayalues:*/
		autocomplete(document.getElementById("away_name"), clubs_name,clubs_num,clubs_address);
	});
	
</script>
