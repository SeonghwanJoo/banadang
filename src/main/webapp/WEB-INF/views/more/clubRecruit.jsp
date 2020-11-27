<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="main-row filter-wrapper margin-btm">
	<div class="filter cursor"  id="filter">
		<span class="material-icons cursor l-font filter-icon" >filter_alt</span>
		<c:if test="${type==1 }">
		<span class="filter-txt">축구</span>
		</c:if>
		<c:if test="${type==2 }">
		<span class="filter-txt">풋살</span>
		</c:if>
		<c:if test="${type==3 }">
		<span class="filter-txt">전체</span>
		</c:if>
	</div>
</div>
<ul class="ul-list non-border-btm">
</ul>
<div class="row margin-top margin-btm" id="moreList">
	<button class="seemore margin-top" id="moreBtn" onclick="moreList()">더보기</button>
</div>
<!-- The Modal -->
<div id="myModals" class="modals">
	<!-- Modal content -->
	<form:form class="col s12" id="form" action="clubRecruit.do" commandName="matchVO" autocomplete="off">
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
		<div class="row margin-top">
			<input type="submit" class="block modal-block" id="apply-filter" value="필터 적용">
		</div>
	</div>
	</form:form>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
function createListInHTML(matchs){
	var itemStr='';
	for(var i=0;i<matchs.length;i++){
		
		itemStr+=
			"<li class='li-list cursor' onclick='location.href=\"${pageContext.request.contextPath}/member/clubRecruitDetail.do?clubRecruit_num="+matchs[i].clubRecruit_num+"\"'>"
				+"<div class='match-info-wrapper'>"
					+"<div class='main-row'>"
		if(matchs[i].type==1){
			itemStr+=
					"<span class='match-item last soccer'>"
						+"축구"
					+"</span>";
		}else if(matchs[i].type==2){
			itemStr+=
					"<span class='match-item last futsal'>"
							+"풋살"
					+"</span>";
		}
		itemStr+=
					"<span class='match-item'>"+matchs[i].club_address+"</span>"
				+"</div>"
				+"<div class='row'>"
					+"<span class='match-item'><i class='far fa-calendar-alt margin-right'></i>주 활동 요일 "+matchs[i].act_day+" |</span>"
					+"<span class='match-item'><i class='far fa-clock margin-right'></i>시간대 "+matchs[i].act_time+"</span>"
				+"</div>"
				+"</div>"
				+"<div class='row small-font margin-top margin-btm'>"
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
						+"<div class='flex-start'>"
						+"<span class='rating'>매너</span>"
							+"<span class='star-rating'>"
								+"<span style='width:"+matchs[i].manner*20+"%'></span>"
							+"</span>"
							+Number(matchs[i].manner*2).toFixed(1)+"</div>"
						+"<div class='flex-start'>"
							+"<span class='rating'>실력</span>"
							+"<span class='star-rating'>"
								+"<span style='width:"+matchs[i].perform*20+"%'></span>"
							+"</span>"
							+Number(matchs[i].perform*2).toFixed(1)+"</div>"
						+"연령대"+ "<span class='xs-font'>"+matchs[i].club_age+"</span>"
					+"</div>"			
				+"</div>"
			+"</li>";
	}
	return itemStr;
}
let pageCount=0;
let latitude;
let longitude;
function moreList(){
	
	
	$.ajax({
		url:'nextClubRecruitPage.do',
		type:'post',
		data:{
			type: ${type},
			pageCount: pageCount*30,
			club_locY:latitude,
			club_locX:longitude
		},
		dataType:'json',
		cache:false,
		timeout:30000,
		success:function(data){
			if(data.result=='success'){
				var addContent="";
				var matches=new Array();
				matches=data.matches;
				addContent+=createListInHTML(matches);
				$(addContent).appendTo('.ul-list');
				if(matches.length<30){
					$('#moreList').css('display','none');
				}
				$('#moreBtn').blur();
				
				pageCount++;
			}	
			if(data.result=='errors'){
				alert('오류 발생');
			}
			
		},
		error:function(){
			alert('네트워크 오류 발생');
		}
	});
	
}

$(function(){
	
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
	
	if("${myClub.club_loc}"!=""){
		console.log('position by myClub 진입');
		latitude='${myClub.club_locY}';
		longitude='${myClub.club_locX}';
		moreList();
	}else if(navigator.geolocation){
		navigator.geolocation.getCurrentPosition(function(pos) {
			console.log('position by geolocation 진입');
			latitude=pos.coords.latitude;
			longitude=pos.coords.longitude;
			moreList();
		},
		function(){
			console.log('position by geolocation error 진입');
			alert('사용자 위치 접근 허용이 필요합니다');
			latitude=37.5668260054857;
			longitude=126.978656785931;
			moreList();
		});	
	}else{
		latitude=37.5668260054857;
		longitude=126.978656785931;
		moreList();
	}	
	
	


});

</script>