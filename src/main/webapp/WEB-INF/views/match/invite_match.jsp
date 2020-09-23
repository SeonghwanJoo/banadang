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
	    console.log("R : "+R);
	    console.log("dLat : "+dLat);
	    let dLon = deg2rad(lng2-lng1);
	    console.log("dLon : "+dLon);
	    let a = (Math.sin(dLat/2) * Math.sin(dLat/2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.sin(dLon/2) * Math.sin(dLon/2);
	    console.log("a : "+a);
	    let c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
	    console.log("c : "+c);
	    let d = R * c; // Distance in km
	    console.log("d : "+d);
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
		obj.match_date="${match.match_date}";
		obj.address_x="${match.address_x}";
		obj.address_y="${match.address_y}";
		obj.club_num="${match.club_num}";
		obj.club_color="${match.club_color}";
		obj.club_name="${match.club_name}";
		obj.club_img="${match.club_img}";
		obj.manner="${match.manner}";
		obj.perform="${match.perform}";
		matchs.push(obj);
	</c:forEach>
	console.log("<matchVO>"+matchs);
	

	
	if(navigator.geolocation){
		navigator.geolocation.getCurrentPosition(function(pos) {
		    
			var latitude = pos.coords.latitude;
		    var longitude = pos.coords.longitude;
		    
		    createListOrderByDistance(latitude,longitude,matchs);
		    
		});	
	}else{
		var position={latitude:37.57360511,longitude:127.09005352}//사용자 소속팀의 주소  받아서 넣어주기
		
		createListOrderByDistance(position.latitude, position.longitude, matchs);
	}
	
	
	function createListOrderByDistance(latitude,longitude,matchs){
		var div=document.getElementById("invite-wrapper");
		var ul=document.createElement("UL");
		ul.setAttribute("class","ul-list");
		var itemStr="";
		
		for(var i=0;i<matchs.length;i++){
			
			matchs[i].distance=getDistanceFromLatLonInKm(latitude,longitude,matchs[i].address_y,matchs[i].address_x);
			console.log("<<matchs.distance>>"+i+"번째"+matchs[i].distance);
		}
		matchs.sort(function (a,b){
			return a.distance - b.distance;
		});
		for(var i=0;i<matchs.length;i++){
			
			console.log("<<matchs.distance>>"+i+"번째"+matchs[i].distance);
			
			
			itemStr+=
				"<a class='detail' href='${pageContext.request.contextPath}/match/invite_detail.do?match_num="
				+matchs[i].match_num+"'>"
				+"<li class='li-list'>"
					+"<div class='row'>"
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
							+"<span class='rating'>매너 : "+Number(matchs[i].manner*2).toFixed(1)+"</span>"
							+"<span class='star-wrap'>"
								+"<span class='star-rating'>"
									+"<span style='width:"+matchs[i].perform*20+"%'></span>"
								+"</span><br>"
							+"<span class='rating'>실력 : "+Number(matchs[i].perform*2).toFixed(1)+"</span>"
								+"<span class='star-rating'>"
									+"<span style='width:"+matchs[i].perform*20+"%'></span>"
								+"</span><br>"
							+"</span>"
							+"주 연령대 : 30대"
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