<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="invite-wrapper" id="invite-wrapper">
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
		
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
	<c:forEach items="${matches}" var="match">
		var obj={};
		obj.type="${match.type}"
		obj.club_num="${match.club_num}";
		obj.club_color="${match.club_color}";
		obj.club_name="${match.club_name}";
		obj.club_img="${match.club_img}";
		obj.club_age="${match.club_age}";
		obj.manner="${match.manner}";
		obj.perform="${match.perform}";
		obj.clubRecruit_num="${match.clubRecruit_num}";
		obj.act_day="${match.act_day}";
		obj.act_time="${match.act_time}";
		obj.club_address="${match.club_address}";
		matchs.push(obj);
		console.log("match"+obj);
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
				"<a class='detail' href='${pageContext.request.contextPath}/member/clubRecruitDetail.do?clubRecruit_num="
				+matchs[i].clubRecruit_num+"'>"
				+"<li class='li-list'>"
					+"<div class='main-row'>"
						+"<span class='match-item'>주 활동 요일 "+matchs[i].act_day+" | </span>"
						+"<span class='match-item'>시간대 "+matchs[i].act_time+" | </span>"
						+"<span class='match-item'>지역 "+matchs[i].club_address+" | </span>"
						+"<span class='match-item'>";
			if(matchs[i].type.includes('1')){
			itemStr+=
						"축구";
			}
			if(matchs[i].type.includes('2')){
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