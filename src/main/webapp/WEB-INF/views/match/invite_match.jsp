<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="main-row filter-wrapper margin-btm">
	<div class="filter">
		<c:if test="${match.type==1 }">
		<span>축구</span>
		</c:if>
		<c:if test="${match.type==2 }">
		<span>풋살</span>
		</c:if>
		<span>${match.period}</span>
		<span class="material-icons cursor l-font filter-icon" id="filter">filter_alt</span>
	</div>
</div>
<div class="invite-wrapper" id="invite-wrapper">
</div>
<!-- The Modal -->
<div id="myModals" class="modals">
	<!-- Modal content -->
	<form:form class="col s12" id="form" action="filter.do" commandName="matchVO" autocomplete="off">
	<div class="modals-content">
		<span id="close_mod" class="close_mod">&times;</span>
		<span class="input-label">경기 유형(축구/풋살) 선택</span>
		<div class="row centered-padding">
			<label class="chip">
				<span class="chip-txt small-font">전체</span>
				<input type="radio" name="type" id="soccer" value="3" checked="checked">
				<span class="checkmark"></span>
			</label> 
			<label class="chip">
				<span class="chip-txt small-font">축구</span>
				<input type="radio" name="type" id="soccer" value="1">
				<span class="checkmark"></span>
			</label> 
			<label class="chip">
				<span class="chip-txt small-font">풋살</span>
				<input type="radio" name="type" id="futsal" value="2">
				<span class="checkmark"></span>
			</label>
		</div>
		<hr class="hr">
		<span class="input-label margin-btm">검색 기간</span>
		<label class="chip wider">
				<span class="chip-txt">전체</span>
				<input type="radio" id="entire-pr" checked="checked">
				<span class="checkmark"></span>
		</label> 
		<label class="chip wider">
			<span class="chip-txt">특정 기간</span>
			<input type="radio" id="specific-pr">
			<span class="checkmark"></span>
		</label>
		<div class="row margin-top" id="period-filter" style="display:none">
			<div class="input-container col">
				<i class="fas fa-calendar-alt icon"></i> <input class="input-field"
					type="text" id="datepicker" placeholder="검색 기간 선택" name="period">
			</div>
		</div>
		<hr class="hr">
		<div class="row margin-top">
			<input type="submit" class="block modal-block" id="apply-filter" value="필터 적용">
		</div>
	</div>
	</form:form>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#specific-pr').click(function(){
		$('#period-filter').css('display','block');
	});
	$('#entire-pr').click(function(){
		$('#period-filter').css('display','none');
		$('#datepicker').val('');
	});
	let today=new Date();
	let endDate=new Date();
	endDate.setDate(endDate.getDate()+31);
	
	$('#datepicker').daterangepicker({
		"minDate": today,
		"startDate": today,
		"endDate": endDate,
	    "autoApply": true,
	    "opens": "center",
		"locale" : {
			"format" : "YYYY-MM-DD",
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
	}, function(start, end, label) {
	  console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
	}); 
	$('#datepicker').val('');
	// Get the modal
	var modal = document.getElementById("myModals");

	// Get the button that opens the modal
	var filter = document.getElementById("filter");


	// When the user clicks the button, open the modal 
	filter.onclick = function() {
	 	modal.style.display = "block";
	}
	

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	  if (event.target == modal) {
	    modal.style.display = "none";
	  }
	}
	$('#close_mod').click(function(){
		 modal.style.display = "none";
	});
		
	function getDistanceFromLatLonInKm(lat1,lng1,lat2,lng2) {
	    function deg2rad(deg) {
	        return deg * (Math.PI/180)
	    }

	    const R = 6371; // Radius of the earth in km
	    let dLat = deg2rad(lat2-lat1);  // deg2rad below
	    let dLon = deg2rad(lng2-lng1);
	    let a = (Math.sin(dLat/2) * Math.sin(dLat/2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.sin(dLon/2) * Math.sin(dLon/2);
	    let c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
	    let d = R * c; // Distance in km
	    return d;
	}
	let matchs=new Array();
	<c:forEach items="${matchVO}" var="match">
		var obj={};
		obj.match_num="${match.match_num}";
		obj.type="${match.type}"
		obj.start_time="${match.start_time}";
		obj.end_time="${match.end_time}";
		obj.address="${match.address}";
		obj.match_detail="${match.match_detail}";
		obj.match_date="<fmt:formatDate value="${match.match_date}" pattern="yy.MM.dd"/>";
		obj.address_x="${match.address_x}";
		obj.address_y="${match.address_y}";
		obj.club_num="${match.club_num}";
		obj.club_color="${match.club_color}";
		obj.club_name="${match.club_name}";
		obj.club_img="${match.club_img}";
		obj.manner="${match.manner}";
		obj.perform="${match.perform}";
		obj.club_age="${match.club_age}";
		matchs.push(obj);
	</c:forEach>
	
	if("${myClub.club_loc}"!=""){
		var position={latitude:'${myClub.club_locY}',longitude:'${myClub.club_locY}'}//사용자 소속팀의 주소  받아서 넣어주기
		createListOrderByDistance(position.latitude, position.longitude, matchs);
	}else if(navigator.geolocation){
		navigator.geolocation.getCurrentPosition(function(pos) {
		    
			var latitude = pos.coords.latitude;
		    var longitude = pos.coords.longitude;
		    
		    createListOrderByDistance(latitude,longitude,matchs);
		    
		});	
	}else{
		var position={latitude:37.5668260054857,longitude:126.978656785931};
		createListOrderByDistance(position.latitude, position.longitude, matchs);
	}
	
	function createListOrderByDistance(latitude,longitude,matchs){
		var div=document.getElementById("invite-wrapper");
		var ul=document.createElement("UL");
		ul.setAttribute("class","ul-list");
		ul.classList.add('non-border-btm');
		var itemStr="";
		
		for(var i=0;i<matchs.length;i++){
			
			matchs[i].distance=getDistanceFromLatLonInKm(latitude,longitude,matchs[i].address_y,matchs[i].address_x);
		}
		matchs.sort(function (a,b){
			return a.distance - b.distance;
		});
		for(var i=0;i<matchs.length;i++){
			
			itemStr+=
				"<a class='detail' href='${pageContext.request.contextPath}/match/invite_detail.do?match_num="
				+matchs[i].match_num+"'>"
				+"<li class='li-list'>"
					+"<div class='main-row'>"
						+"<span class='match-item'>"+matchs[i].match_date+"</span>"
						+"<span class='match-item'>"+matchs[i].start_time+"~"+matchs[i].end_time+"</span>"
						+"<span class='match-item'>"+matchs[i].address+"</span>"
						+"<span class='match-item'>";
			if(matchs[i].type==1){
			itemStr+=
						"축구";
			}else if(matchs[i].type==2){
			itemStr+=			
						"풋살";
			}
			itemStr+=
						"</span>"
					+"</div>"
					+"<div class='row'>"
						+"<div class='col club_main'>";
			if(matchs[i].club_img ==""){
			itemStr+=
							"<img src='"+"${pageContext.request.contextPath}"+"/resources/images/blank_emblem.png' class='avatar emblem'>";
			}else if(matchs[i].club_img !=""){
				itemStr+=
					"<img src='"+"${pageContext.request.contextPath}"+"/club/imageView.do?club_num="+matchs[i].club_num+"' class='avatar emblem'>"
			}
			itemStr+=
							"<span class='club_name'>"+matchs[i].club_name+"</span><br>"
							+"<span class='uniform'>"
								+"유니폼";
			if(matchs[i].club_color!=""){
			itemStr+=
								"<span class='color' style='background-color:"+matchs[i].club_color+"'></span>";
			}else if(matchs[i].club_color==""){
			itemStr+=
								" 미정";
			}
			itemStr+=
							"</span>"
							+"</div>"
							+"<div class='col'>"
								+"<span class='rating'>매너 "+"</span>"
								+"<span class='star-wrap'>"
									+"<span class='star-rating'>"
										+"<span style='width:"+matchs[i].perform*20+"%'></span>"
									+"</span>"
									+Number(matchs[i].manner*2).toFixed(1)+"<br>"
								+"<span class='rating'>실력 "+"</span>"
									+"<span class='star-rating'>"
										+"<span style='width:"+matchs[i].perform*20+"%'></span>"
									+"</span>"
									+Number(matchs[i].perform*2).toFixed(1)+"<br>"
								+"</span>"
								+"주 연령대"+matchs[i].club_age
							+"</div>"			
						+"</div>"
					+"</li>"
					+"</a>";
		}
		ul.innerHTML+=itemStr;
		div.appendChild(ul);
	}

});

</script>