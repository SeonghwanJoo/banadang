<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="row" id="top_wrap">
	<div class="fixed_top">
		<a href="${pageContext.request.contextPath }/member/myPage.do">
			<span class="material-icons" id="chevron_left" >chevron_left</span>
		</a>
		<div class="topnav-centered">
			<span class="active">${title }</span>
		</div>
		<c:if test="${board.id==user_id }">
		<span class="material-icons more cursor xl-font" id="more">more_horiz</span>
		</c:if>
	</div>
</div>
<div class="blank_div"></div>
<img src="${pageContext.request.contextPath }/resources/images/event1.png" class="event"/>
<div class="event">
<form:form class="col s12" id="form" action="write.do" autocomplete="off">
	<div class="row">
		<span class="input-label">상품 수령 정보 입력</span>
		<span class="share cursor margin-m-top" onclick="sendLink()">
		이벤트 공유하기
		<img class="kakaolink-share" src="${pageContext.request.contextPath }/resources/images/kakaolink_btn.png">
		</span>
	</div>
	<div class="row margin-top">
		<div class="autocomplete input-container col">
			<i class="fa fa-users icon"></i> <input class="input-field"
				type="text" placeholder="수령인 이름 입력" name="name" id="name">
		</div>
	</div>
	<div class="row"><div class="col"><span class="msg" id="name_msg"></span></div></div>
	<hr class="hr">
	<div class="row">
		<div class="autocomplete input-container col">
			<i class="fas fa-map-marked-alt icon"></i> <input class="input-field"
				type="text" name="address" id="address" placeholder="상품 수령 주소 검색" readonly="readonly">
		</div>
	</div>
	<div class="row"><div class="col"><span class="msg" id="address_msg"></span></div></div>
	<hr class="hr">
	<div class="row">
		<div class="autocomplete input-container col">
			<i class="far fa-building icon"></i> <input class="input-field"
				type="text" name="address_detail" id="address_detail" placeholder="상세 주소 입력">
		</div>
	</div>
	<div class="row"><div class="col"><span class="msg" id="address_detail_msg"></span></div></div>
	<hr class="hr">
	<div class="row">
		<div class="autocomplete input-container col">
			<i class="fas fa-mobile-alt icon"></i> <input class="input-field"
				type="tel" placeholder="수령인 휴대폰 번호 입력" name="phone" id="phone">
		</div>
	</div>
	<div class="row"><div class="col"><span class="msg" id="phone_msg"></span></div></div>
	<input type="submit" class="block white-bg margin-lg-btm" value="이벤트 참여 신청하기">
</form:form>
</div>
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
	<div id="toast-content" class="submit_toast_content">
		<div class="row centered margin-btm centered-padding">
			<span id="matchRequest_msg"></span>
		</div>
		<div class="row margin-top centered" id="btns">
			<div class="col">
				<button class="alert-btn" id="confirm">닫기</button>
			</div>
		</div>
	</div>
</div>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>

	Kakao.init('32776969383e4a77d92f6e18dd233bc5');
	
	function sendLink(){
		
		Kakao.Link.sendCustom({
	    	templateId: 49928,
	    	templateArgs: {
	    		
	    	}
	    });
		$('#report_more_modal').css('display','none');
		
	};
	var state='';
	if($('input:checkbox').is(':checked')){
	 	state=true;
	}else{
		state=false;
	}
	function login(throughTalk){
		
		Kakao.Auth.authorize({
			  redirectUri: $(location).attr('protocol')+"//"+"${pageContext.request.serverName }${pageContext.request.contextPath}/member/login.do"
			  ,state: state + '-' + 'eventLogin' 
			  ,throughTalk: throughTalk
		});
		
	 }
	
	$(function(){
		
		$('#name').click(function(){
			$('#name_msg').text('');
		});
		$('#address').click(function(){
			$('#address_msg').text('');
		});
		$('#address_detail').click(function(){
			$('#address_detail_msg').text('');
		});
		$('#phone').click(function(){
			$('#phone_msg').text('');
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
				var address_name
			    var el = document.createElement('li'),
			    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
			                '<div class="info">' +
			                '   <h6>' + places.place_name + '</h6>';
		
			    if (places.road_address_name) {
			        itemStr += '    <span>' + places.road_address_name + '</span></div>';
			        address_name = places.road_address_name
			    } else {
	 		        itemStr += '    <span>' +  places.address_name  + '</span></div>';
	 		       address_name = places.address_name
			    }
		
			    el.innerHTML = itemStr;
			    el.className = 'item';
			    el.id='item'+index;
			    el.onclick=function(){
			    	document.getElementById('address').value=address_name;
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
		
		$('#form').submit(function(e){
			
			e.preventDefault();
			
			if(!$('#name').val().replace(/^\s+|\s+$/g, '')){
				$('#name_msg').css('color','red').text('수령인의 이름을 입력해주세요');
				return false;
			}
			if(!$('#address').val().replace(/^\s+|\s+$/g, '')){
				$('#address_msg').css('color','red').text('주소를  입력해주세요');
				return false;
			}
			if(!$('#address_detail').val().replace(/^\s+|\s+$/g, '')){
				$('#address_detail_msg').css('color','red').text('상세 주소를  입력해주세요');
				return false;
			}
			if(!$('#phone').val().replace(/^\s+|\s+$/g, '')){
				$('#phone_msg').css('color','red').text('수령인 휴대폰 번호를  입력해주세요');
				return false;
			}
			var address=$('#address').val()+' '+$('#address_detail').val();
			$.ajax({
				url:'postEventReq.do',
				type:'post',
				data:{
					id:'${user_id}', 
					name:$('#name').val(),
					address:address,
					phone:$('#phone').val()
				},
				dataType:'json',
				cache:false,
				timeout:30000,
				success:function(data){
					
					if(data.result=='success'){
						var teamCreate;
						teamCreate='<div class="col">'
								  +		'<button class="alert-btn red" id="create">팀 만들기</button>'
								  +'</div>';
						$('#btns').append(teamCreate);
						$('#confirm').addClass('border-right-gray');
						$('#matchRequest_msg').text('이벤트 신청 완료');
					}else if(data.result=='duplicated'){
						$('#matchRequest_msg').text('이미 이벤트 신청하셨습니다.');
						
					}else if(data.result=='errors'){
						
						$('#matchRequest_msg').text('이벤트 신청 오류. 잠시 후 다시 시도해주세요.');
					}
					$('#toast').css('display','flex');
					$('#confirm').click(function(){
						$('#toast').css('display','none');
					});
					$('#create').click(function(){
						location.href='${pageContext.request.contextPath}/club/createClubForm.do';
					});
					
				},
				error:function(){
					alert('네트워크 오류 발생');
				}
			});
		});
		
		
	});
</script>