<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<form:form id="club_form" accept-charset="utf-8" enctype="multipart/form-data">
<input type="hidden" name="id" value="${user_id }">
<div class="row" id="top_wrap">
	<div class="fixed_top">
		<a href="club.do" >
		<span class="material-icons" id="cancel">close</span>
		</a>
		<div class="topnav-centered">
			<span class="active">${title }</span>
		</div>
		<input type="submit" id="submit" value="완료">
	</div>
</div>
<div class="blank_div"></div>
<div class="row">
	<div class="autocomplete input-container col">
		<span class="icon material-icons">sports_soccer</span>
		<input class="input-field" type="text" name="club_name" id="club_name" placeholder="팀 이름 입력" autocomplete="off" onkeyup="removeWhiteSpace(this)">
	</div>
</div>
<div class="row"><div class="col"><span class="msg" id="club_name_msg"></span></div></div>
<hr class="hr">
<div class="row">
	<div class="autocomplete input-container col">
		<i class="fas fa-map-marked-alt icon"></i>
		<input class="input-field" type="text" name="club_loc" id="club_loc" placeholder="주 활동 구장 검색" autocomplete="off" readonly="readonly">
	</div>
	<input type="hidden" name="club_locX" id="club_locX">
	<input type="hidden" name="club_locY" id="club_locY">
	<input type="hidden" name="club_address" id="club_address">
</div>
<div class="row"><div class="col"><span class="msg" id="club_loc_msg"></span></div></div>
<hr class="hr">


<!-- 연령대 -->
<span class="input-label">주 연령대 선택(복수 선택 가능)</span>
<div class="row centered-padding">
	<label class="chip">
		<span class="chip-txt">20대</span>
		<input type="checkbox" value="20대" name="club_ages" checked="checked">
		<span class="checkmark"></span>
	</label>
	<label class="chip">
		<span class="chip-txt">30대</span>
		<input type="checkbox" value="30대" name="club_ages">
		<span class="checkmark"></span>
	</label>
	<label class="chip">
		<span class="chip-txt">40대</span>
		<input type="checkbox" value="40대" name="club_ages">
		<span class="checkmark"></span>
	</label> 
	<label class="chip">
		<span class="chip-txt">50대</span>
		<input type="checkbox" value="50대" name="club_ages">
		<span class="checkmark"></span>
	</label>
	<label class="chip">
		<span class="chip-txt">60대</span>
		<input type="checkbox" value="60대" name="club_ages">
		<span class="checkmark"></span>
	</label>
</div>
<div class="row"><div class="col"><span class="msg" id="club_ages_msg"></span></div></div>
<hr>
<div class="row uni-em">
	<!-- 유니폼 색상 -->
	<div class="half_col" id="uniform_div">
		<div class="row color-view">
			<i class="fas fa-tshirt uni-view"></i>
		</div>
		<div class="row">
			<button class="chip-btn" id="color-btn" >색상 선택</button>
			<input class="input-field" type="text" name="club_color" id="club_color" placeholder="유니폼 색상 선택" style="display:none">
		</div>
	</div>
	<!-- 엠블럼 -->
	<!-- <i class="fas fa-shield-alt icon"></i>
			엠블럼 사진 업로드 -->
	<div class="half_col">
		<div class="row">
			<img src="${pageContext.request.contextPath }/resources/images/blank_emblem.png" id="img-pre">
		</div>
		<div class="row">
			<label for="club_img" class="file-label">
				<span id="emblem-btn">엠블럼 설정</span>
				<input type="file" accept="image/*" class="input-field" name="club_img" id="club_img" alt="" style="display:none">
			</label>
		</div>
	</div>
</div>
<hr class="hr">
<div class="row">
	<div class="text input-container col">
		<textarea class="detail" id="club_detail" name="club_detail" placeholder="팀 소개글 입력"></textarea>
	</div>
</div>
<hr class="hr">
</form:form>

<!-- The Modal -->
<div id="myModals" class="modals">
	<!-- Modal content -->
	<div class="modals-content">
	    <span class="close_mod">&times;</span>
		<div class="input-container col" id="search_modal">
			<input type="text" placeholder="장소 키워드 입력" name="search" class="searchBar" id="keyword" >
	  		<button class="search_btn" id="search_btn"><i class="fa fa-search"></i></button>
  		</div>
  		<div id="map" style="width:100%;height:10rem;"></div>
        <div id="menu_wrap" class="bg_white">
        <hr>
	        <ul id="placesList"></ul>
	        <div id="pagination"></div>
        </div>
	</div>
</div>
<div id="color_sel" class="modals middle">
	<div class="modals-content">
		<span class="close_mod">&times;<br></span>
		<div class="row">
			<div class="col"><i class="color_opt fas fa-tshirt" style="color:#FFFFFF;border-radius:50%;background-color:#7a7a7a;"></i></div>
			<div class="col"><i class="color_opt fas fa-tshirt" style="color:#FAEBD7"></i></div>
			<div class="col"><i class="color_opt fas fa-tshirt" style="color:#A9A9A9"></i></div>
			<div class="col"><i class="color_opt fas fa-tshirt" style="color:#000000"></i></div>
			<div class="col"><i class="color_opt fas fa-tshirt" style="color:#000080"></i></div>
		</div>
		<div class="row">
			<div class="col"><i class="color_opt fas fa-tshirt" style="color:#0000FF"></i></div>
			<div class="col"><i class="color_opt fas fa-tshirt" style="color:#ADD8E6"></i></div>
			<div class="col"><i class="color_opt fas fa-tshirt" style="color:#FFD700"></i></div>
			<div class="col"><i class="color_opt fas fa-tshirt" style="color:#FFA500"></i></div>
			<div class="col"><i class="color_opt fas fa-tshirt" style="color:#FF0000"></i></div>
		</div>
		<div class="row">
			<div class="col"><i class="color_opt fas fa-tshirt" style="color:#800080"></i></div>
			<div class="col"><i class="color_opt fas fa-tshirt" style="color:#FF69B4"></i></div>
			<div class="col"><i class="color_opt fas fa-tshirt" style="color:#ADFF2F"></i></div>
			<div class="col"><i class="color_opt fas fa-tshirt" style="color:#008000"></i></div>
			<div class="col"><i class="color_opt fas fa-tshirt" style="color:#8B4513"></i></div>
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
<div id="loader-toast" class="loader_toast">
	<img src="${pageContext.request.contextPath }/resources/images/ajax-loader.gif" class="loader">
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	

function adjustHeight() {
	  var textEle = $('textarea');
	  textEle[0].style.height = 'auto';
	  var textEleHeight = textEle.prop('scrollHeight');
	  textEle.css('height', textEleHeight);
};

function removeWhiteSpace(obj){
    var a =  $('#club_name').val().replace(/ /gi, '');
    $('#club_name').val(a);
    var maxByte = 16; //최대 입력 바이트 수
 
    var rbyte = 0;
    var rlen = 0;
    var one_char = "";
    var str2 = "";
 
    for (var i = 0; i < a.length; i++) {
        one_char = a.charAt(i);
 
        if (escape(one_char).length > 4) {
            rbyte += 2; //한글2Byte
        } else {
            rbyte++; //영문 등 나머지 1Byte
        }
 
        if (rbyte <= maxByte) {
            rlen = i + 1; //return할 문자열 갯수
        }
    }
 
    if (rbyte > maxByte) {
        alert("한글 " + (maxByte / 2) + "자 / 영문 " + maxByte + "자를 초과 입력할 수 없습니다.");
        str2 = a.substr(0, rlen); //문자열 자르기
        obj.value = str2;
    } 


}
		
	$(function(){
		
		adjustHeight();
		var textEle = $('textarea');
		textEle.on('keyup', function() {
		  adjustHeight();
		});
		
		$('#club_detail').keyup(function (){
			
			var str=$(this).val();
			if(str.length>500){
				alert("최대 500자 까지 입력 가능합니다.");
				$(this).val(str.substring(0,500));
			}
			
		});
		
		$('#club_name').click(function(){
			$('#club_name_msg').text('');
		});
		
		$('input[name="club_ages"]').click(function(){
			$('#club_ages_msg').text('');
		});
		
		
		$("#submit").click(function(e){
			
			$('#loader-toast').css('display','block');
			
			e.preventDefault();
			
			if(!$('#club_name').val().replace(/^\s+|\s+$/g, '')){
				$('#club_name_msg').css('color','red').text('팀명을 입력해주세요.');
				$('#loader-toast').css('display','none');
				return false;
			}else if(!$('#club_loc').val().replace(/^\s+|\s+$/g, '')){
				$('#club_loc_msg').css('color','red').text('주 활동 구장을 입력해주세요.');
				$('#loader-toast').css('display','none');
				return false;
			}else if(!$("input[name='club_ages']").is(":checked")){
				$('#club_ages_msg').css('color','red').text('주 연령대를 선택해주세요.');
				$('#loader-toast').css('display','none');
				return false;
			}
			
			let club_img=dataURLToBlob($("#img-pre").attr("src"));
			var formData = new FormData($('#club_form')[0]);
				formData.append("upload", club_img); 
				formData.append("filename",$("#img-pre").attr("alt"));
			
			
			$.ajax({
				url:'createClub.do',
				type:'post',
				data:formData,
				dataType:'json',
				processData: false,
	            contentType: false,
				cache:false,
				timeout:30000,
				success:function(data){
					
					$('#loader-toast').css('display','none');
					
					if(data.result=="inserted"){
						
						$("#club_msg").text("팀 생성 완료");
						$("#toast").css("display","block");
						$("#confirm").click(function(){
							location.href="manageClub.do?club_num="+data.club_num;
						});
						$(window).click(function(){
							location.href="manageClub.do?club_num="+data.club_num;
						});
						
					}
					if(data.result=="errors"){
						
						$("#club_msg").text("팀 생성 실패");
						$("#toast").css("display","block");
						$('#confirm').click(function(){
							$("#toast").css("display","none");
						});
						$(window).click(function(){
							$("#toast").css("display","none");
						});
					}
					
				},
				error:function(){
					
					$('#loader-toast').css('display','none');
					alert('네트워크 오류 발생');
				}
			});
		});
		
		
		
		$("#club_img").on("change",function(event){
			const file = event.target.files[0];
			const filename=file.name;
			const reader = new FileReader();
			
		    reader.onload = function(e) {
		    	const image=new Image();
		        image.src = e.target.result;//OK
		        image.onload=function(){
		        	
					let canvas = document.createElement("canvas"),
					max_size = 150,
					
					width = image.width,
					height = image.height;
					
					if (width > height) {
					    // 가로가 길 경우
						if (width > max_size) {
						height *= max_size / width;
						      width = max_size;
						}
					} else {
					    // 세로가 길 경우
					    if (height > max_size) {
					      width *= max_size / height;
					      height = max_size;
					    }
					}
					canvas.width = width;
					canvas.height = height;
					canvas.getContext("2d").drawImage(image, 0, 0, width, height);
					const dataUrl = canvas.toDataURL();
					// 미리보기 위해서 마크업 추가.
					$("#img-pre").attr("src",dataUrl);
					$("#img-pre").attr("alt",filename);
					
		        }
		       
		    };
		    reader.readAsDataURL(file);
		});
		
		
		function dataURLToBlob (dataURL) {
			const BASE64_MARKER = ";base64,";
		
			// base64로 인코딩 되어있지 않을 경우
			if (dataURL.indexOf(BASE64_MARKER) === -1) {
				const parts = dataURL.split(",");
			    const contentType = parts[0].split(":")[1];
			    const raw = parts[1];
			    return new Blob([raw], {
			      type: contentType
			    });
			}
			// base64로 인코딩 된 이진데이터일 경우
			const parts = dataURL.split(BASE64_MARKER);
			const contentType = parts[0].split(":")[1];
			const raw = window.atob(parts[1]);
			// atob()는 Base64를 디코딩하는 메서드
			const rawLength = raw.length;
			// 부호 없는 1byte 정수 배열을 생성 
			const uInt8Array = new Uint8Array(rawLength); // 길이만 지정된 배열
			let i = 0;
			while (i < rawLength) {
				uInt8Array[i] = raw.charCodeAt(i);
			    i++;
			}
				return new Blob([uInt8Array], {
			    type: contentType
				});
		};
		

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
	
	
	search_btn.onclick = function() {

		// 마커를 담을 배열입니다
		var markers = [];

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 3, // 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();

		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});

		// 키워드로 장소를 검색합니다
		searchPlaces();

		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {

			var keyword = document.getElementById('keyword').value;

			if (!keyword.replace(/^\s+|\s+$/g, '')) {
				alert('키워드를 입력해주세요!');
				return false;
			}
			var options = {
				size : 5

			}

			// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			ps.keywordSearch(keyword, placesSearchCB, options);
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

			var listEl = document.getElementById('placesList'), menuEl = document
					.getElementById('menu_wrap'), fragment = document
					.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

			// 검색 결과 목록에 추가된 항목들을 제거합니다
			removeAllChildNods(listEl);

			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();

			for (var i = 0; i < places.length; i++) {

				// 마커를 생성하고 지도에 표시합니다
				var placePosition = new kakao.maps.LatLng(places[i].y,
						places[i].x), marker = addMarker(placePosition, i), itemEl = getListItem(
						i, places[i]); // 검색 결과 항목 Element를 생성합니다

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				bounds.extend(placePosition);

				// 마커와 검색결과 항목에 mouseover 했을때
				// 해당 장소에 인포윈도우에 장소명을 표시합니다
				// mouseout 했을 때는 인포윈도우를 닫습니다
				(function(marker, title) {
					kakao.maps.event.addListener(marker, 'mouseover',
							function() {
								displayInfowindow(marker, title);
							});

					kakao.maps.event.addListener(marker, 'mouseout',
							function() {
								infowindow.close();
							});

					itemEl.onmouseover = function() {
						displayInfowindow(marker, title);
					};

					itemEl.onmouseout = function() {
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

			var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
					+ (index + 1)
					+ '"></span>'
					+ '<div class="info">'
					+ '   <h5>' + places.place_name + '</h5>';

			if (places.road_address_name) {
				itemStr += '    <span>' + places.road_address_name
						+ '</span></div>'
			} else {
				itemStr += '    <span>' + places.address_name
						+ '</span></div>'
			}

			el.innerHTML = itemStr;
			el.className = 'item';
			el.id = 'item' + index;
			el.onclick = function() {
				document.getElementById('club_loc').value = places.place_name;
				document.getElementById('club_locX').value = places.x;
				document.getElementById('club_locY').value = places.y;
				document.getElementById('club_address').value = places.address_name;
				modal.style.display = "none";
			};

			return el;
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
			var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
				spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new kakao.maps.Point(13, 37)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}, markerImage = new kakao.maps.MarkerImage(imageSrc,
					imageSize, imgOptions), marker = new kakao.maps.Marker(
					{
						position : position, // 마커의 위치
						image : markerImage
					});

			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(marker); // 배열에 생성된 마커를 추가합니다

			return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}

		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
			var paginationEl = document.getElementById('pagination'), fragment = document
					.createDocumentFragment(), i;

			// 기존에 추가된 페이지번호를 삭제합니다
			while (paginationEl.hasChildNodes()) {
				paginationEl.removeChild(paginationEl.lastChild);
			}

			for (i = 1; i <= 3; i++) {
				var el = document.createElement('a');
				el.href = "#";
				el.innerHTML = i;

				if (i === pagination.current) {
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
				el.removeChild(el.lastChild);
			}
		}

	};

		// Get the modal
		var modal = document.getElementById("myModals");

		// Get the button that opens the modal
		var address = document.getElementById("club_loc");

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close_mod")[0];

		// When the user clicks the button, open the modal 
		address.onfocus = function() {
			modal.style.display = "block";
			$('#club_loc_msg').text('');
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
			if (event.target == color_modal) {
				color_modal.style.display = "none";
			}
		}
		//Get the modal
		var color_modal = document.getElementById("color_sel");

		// Get the button that opens the modal
		var color = document.getElementById("color-btn");

		// Get the <span> element that closes the modal
		var span_color = document.getElementsByClassName("close_mod")[1];

		// When the user clicks the button, open the modal 
		color.onclick = function(e) {
			e.preventDefault();
			color_modal.style.display = "block";
		}

		// When the user clicks on <span> (x), close the modal
		span_color.onclick = function() {
			color_modal.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		$(".color_opt").click(function(){
			var clickedColor=$(this).css("color");
			if(clickedColor=="rgb(255, 255, 255)"){
				$(".uni-view").css("background-color","#7a7a7a");
			}
			$(".uni-view").css("color",clickedColor);
			$("#club_color").val(clickedColor);
			$("#color_sel").hide();
		});
	});
</script>