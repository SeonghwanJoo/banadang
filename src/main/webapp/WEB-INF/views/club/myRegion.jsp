<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="fixed_top">
	<a href="${pageContext.request.contextPath }/member/myPage.do" >
	<span class="material-icons" id="cancel">close</span>
	</a>
	<div class="topnav-centered">
		<span class="active cursor">${title }</span>
	</div>
</div>
<div class="blank_div"></div>
<div class="gray-bg padding-btm">
	<div class="row cards-wrapper">

	</div>
	<div class="margin-lg-top" id="moreList">
	<button class="block white-bg margin-top" id="moreBtn" onclick="moreList()">더보기</button>
	</div>
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
  	<div id="toast_content" class="submit_toast_content">
		<div class="row centered margin-btm centered-padding">
			<span id="club_msg">로그인 후 이용 가능합니다.</span>
		</div>
		<div class="row margin-top centered">
			<button class="alert-btn" id="vote-alert">확인</button>
		</div>
	</div>
</div>
<!-- The Modal -->
<div id="loader-toast" class="submit_toast">

  <!-- Modal content -->
  	<div id="loader_toast_content" class="loader_toast_content">
		<img src="${pageContext.request.contextPath }/resources/images/ajax-loader.gif" class="loader">
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
function createListInHTML(clubs){
	
	var itemStr='';
	for(var i=0; i<clubs.length; i++){
		
		itemStr+=
			'<div class="col-6 col-sm-4 col-lg-3 margin-m-top">'
				+'<div class="club_cd">'
					+'<div class="centered-padding centered">'
						+'<span class="distance_cd gray">'+clubs[i].distance.toFixed(1)+' km</span>';
		if(clubs[i].club_img == ''){
			itemStr+=
						'<img src="${pageContext.request.contextPath}/resources/images/blank_emblem.png" class="center_emblem">';
		}else if (clubs[i].club_img != ''){
			itemStr+=
						'<img src="${pageContext.request.contextPath}/club/imageView.do?club_num='+clubs[i].club_num+'" class="center_emblem">';
		}
		itemStr+=
						'<span class="disp-bl margin-top m-font">'+clubs[i].club_name+'</span>'
						+'<span class="disp-bl gray small-font">'+clubs[i].club_address+'</span>'
						+'<span class="disp-bl gray small-font margin-top">매너 <span class="blue">'+(clubs[i].manner*2).toFixed(1)+'</span> / 실력 <span class="blue">'+(clubs[i].perform*2).toFixed(1)+'</span></span>'
						+'<div class="main-row margin-top">';
		if(clubs[i].status == 1){
		itemStr+=				
							'<span class="material-icons margin-right" onclick="toggleThumb('+clubs[i].club_num+','+clubs[i].id_like+', 1)">thumb_up</span>'+clubs[i].up
							+'<span class="material-icons margin-right margin-m-left" onclick="toggleThumb('+clubs[i].club_num+','+clubs[i].id_like+', 2)">thumb_down_off_alt</span>'+clubs[i].down
		}else if(clubs[i].status == 2){
		itemStr+=				
							'<span class="material-icons margin-right" onclick="toggleThumb('+clubs[i].club_num+','+clubs[i].id_like+', 1)">thumb_up_off_alt</span>'+clubs[i].up
							+'<span class="material-icons margin-right margin-m-left" onclick="toggleThumb('+clubs[i].club_num+','+clubs[i].id_like+', 2)">thumb_down</span>'+clubs[i].down	
		}else{
		itemStr+=				
							'<span class="material-icons margin-right" onclick="toggleThumb('+clubs[i].club_num+','+clubs[i].id_like+', 1)">thumb_up_off_alt</span>'+clubs[i].up
							+'<span class="material-icons margin-right margin-m-left" onclick="toggleThumb('+clubs[i].club_num+','+clubs[i].id_like+', 2)">thumb_down_off_alt</span>'+clubs[i].down		
		}
		itemStr+=
							
						'</div>'
					+'</div>'
					+'<input type="hidden" id="status_'+clubs[i].club_num+'" value="'+clubs[i].status+'">'
					+'<button class="dark-btn margin-m-top" onclick="goToClubDetail('+clubs[i].club_num+')">팀 페이지</button>'
				+'</div>'
			+'</div>';
		//status에 따라 thumb far/fas 처리 한다
		//thumb를 누르면 club_num/user_id/id_like/updown 여부를 인자로 전달하고
		//기존값이 있으면 업데이트/없으면 insert한다
		//업데이트 완료 후
		//아이콘의 클래스를 far로 초기화하고 updown에 맞추어 fas로 class를 수정한다
	}
	
	return itemStr;
	
	
}
function toggleThumb(club_num, id_like, status){
	if(${empty user_id}){
		
		$('#toast').css('display','flex');
		return
	}
	if($('#status_'+club_num).val()==status){
		
		status= 0;
	}
	
	$.ajax({
		url:'updateLike.do',
		type:'post',
		data:{
			id: '${user_id}',
			club_num: club_num,
			id_like: id_like,
			status: status
		},
		dataType:'json',
		cache:false,
		timeout:30000,
		success:function(data){
			if(data.result=='success'){
				
				alert("updated");
				
			}	
			if(data.result=='errors'){
				
				alert('오류 발생');
			}
			
		},
		error:function(){
			$('#loader-toast').css('display','none');
			alert('네트워크 오류 발생');
		}
	});
	
	
	
}

function goToClubDetail(club_num){
	
	location.href='${pageContext.request.contextPath}/club/club_details.do?club_num='+club_num;
}
let pageCount=0;
let latitude;
let longitude;

function moreList(){
	
	$('#loader-toast').css('display','flex');

	$.ajax({
		url:'nextClubs.do',
		type:'post',
		data:{
			pageCount: pageCount*30,
			id: '${user_id}',
			club_locY:latitude,
			club_locX:longitude
		},
		dataType:'json',
		cache:false,
		timeout:30000,
		success:function(data){
			if(data.result=='success'){
				
				
				var addContent="";
				var clubs=new Array();
				clubs=data.clubs;
				addContent+=createListInHTML(clubs);
				$('.cards-wrapper').append(addContent);
				$('#loader-toast').css('display','none');
				
				if(clubs.length<30){
					$('#moreList').css('display','none');
				}
				
				$('#moreBtn').blur();
				
				pageCount++;
				
				
			}	
			if(data.result=='errors'){
				$('#loader-toast').css('display','none');
				alert('오류 발생');
			}
			
		},
		error:function(){
			$('#loader-toast').css('display','none');
			alert('네트워크 오류 발생');
		}
	});
	

}

$(function(){
	
	$('#loader-toast').css('display','flex');	
	
	$('.alert-btn').click(function(){
		$('#toast').css('display','none');
	});
	
	if("${myClub.club_loc}"!=""){
		latitude='${myClub.club_locY}';
		longitude='${myClub.club_locX}';
		moreList();
		
	}else if(navigator.geolocation){
		navigator.geolocation.getCurrentPosition(function(pos) {
			latitude=pos.coords.latitude;
			longitude=pos.coords.longitude;
			moreList();
			
		},
		function(){
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