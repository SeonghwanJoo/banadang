<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="filter-wrapper sticky padding-btm padding-top">
	<div class="row filter cursor"  id="filter">
		<span class="material-icons l-font  filter-icon">filter_list</span>
		<c:if test="${match.type==1 }">
		<span class="filter-txt">축구</span>
		</c:if>
		<c:if test="${match.type==2 }">
		<span class="filter-txt">풋살</span>
		</c:if>
		<c:if test="${not empty match.period }">
		<span class="filter-txt"><i class="far fa-calendar-alt margin-right"></i>
		${fn:substring(match.period,5,7)}.${fn:substring(match.period,8,10)}~${fn:substring(match.period,18,20)}.${fn:substring(match.period,21,23)}
		</span>
		</c:if>
	</div>
</div>
<ul class="ul-list non-border-btm">
</ul>
<div class="row margin-top margin-btm" id="moreList">
	<button class="block white-bg margin-top" id="moreBtn" onclick="moreList()">더보기</button>
</div>
<div class="mid-banner">
	<ins class="kakao_ad_area" style="display:none;" 
	 data-ad-unit    = "DAN-gCSwQUEFuriXnEOA" 
	 data-ad-width   = "320" 
	 data-ad-height  = "100"></ins>
 </div>
<script type="text/javascript" src="//t1.daumcdn.net/kas/static/ba.min.js" async></script>
<!-- The Modal -->
<div id="myModals" class="modals middle">
	<!-- Modal content -->
	<form:form class="col s12" id="form" action="recruit.do" commandName="matchVO" autocomplete="off">
	<div class="modals-content">
		<span id="close_mod" class="close_mod">&times;</span>
		<span class="input-label">경기 유형(축구/풋살) 선택</span>
		<div class="row centered-padding margin-m-top">
			<label class="label-sq">
				<span class="label-txt">전체</span>
				<input type="radio" name="type" id="soccer" value="3" checked="checked">
				<span class="checkmark-sq"></span>
			</label> 
			<label class="label-sq">
				<span class="label-txt">축구</span>
				<input type="radio" name="type" id="soccer" value="1">
				<span class="checkmark-sq"></span>
			</label> 
			<label class="label-sq">
				<span class="label-txt">풋살</span>
				<input type="radio" name="type" id="futsal" value="2">
				<span class="checkmark-sq"></span>
			</label>
		</div>
		<hr class="hr">
		<span class="input-label margin-btm">검색 기간 설정</span>
		<div class="row centered-padding">
			<div class="row margin-m-top">
				<label class="label-sq">
					<span class="label-txt">전체</span>
					<input type="radio" name="period-opt" id="entire-pr" checked="checked">
					<span class="checkmark-sq"></span>
				</label> 
				<label class="label-sq">
					<span class="label-txt">특정 기간</span>
					<input type="radio" name="period-opt" id="specific-pr">
					<span class="checkmark-sq"></span>
				</label>
			</div>
		</div>
		<div class="row margin-top" id="period-filter" style="display:none">
			<div class="input-container col">
				<i class="fas fa-calendar-alt icon"></i> <input class="small-font radius"
					type="text" id="datepicker" placeholder="검색 기간 선택" name="period" readonly="readonly">
			</div>
		</div>
		<hr class="hr">
		<div class="row margin-top">
			<input type="submit" class="block black-bg" id="apply-filter" value="필터 적용">
		</div>
	</div>
	</form:form>
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
function createListInHTML(matchs){
	var itemStr='';
	for(var i=0;i<matchs.length;i++){
		
		itemStr+=
			"<li class='li-list cursor' onclick='location.href=\"${pageContext.request.contextPath}/match/recruitDetail.do?recruit_num="+matchs[i].recruit_num+"\"'>"
				+"<div class='match-info-wrapper'>"
				+"<div class='main-row'>";
		if(matchs[i].type==1){
			itemStr+=
					"<span class='match-item s-chip white-bg'>"
						+"축구"
					+"</span>";
		}else if(matchs[i].type==2){
			itemStr+=
					"<span class='match-item s-chip black-bg'>"
							+"풋살"
					+"</span>";
		}
		itemStr+=
					"<span class='match-item'>"+matchs[i].address+"</span>"
					+"<span class='distance'><span class='point'>"+matchs[i].distance.toFixed(1)+"</span> km</span>"
				+"</div>"
				+"<div class='row'>"
					+"<span class='match-item'><i class='far fa-calendar-alt margin-right'></i>"+new Date(matchs[i].match_date).format('yy.MM.dd')+"</span>"
					+"<span class='match-item'><i class='far fa-clock margin-right'></i>"+matchs[i].start_time+"~"+matchs[i].end_time+"</span>"
				+"</div>"
				+"</div>"
				+"<div class='row small-font margin-top margin-btm'>"
					+"<div class='col club_main'>";
		if(matchs[i].club_img ==""){
		itemStr+=
						"<img src='${pageContext.request.contextPath}/resources/images/blank_emblem.png' class='avatar emblem'>";
		}else if(matchs[i].club_img !=""){
			itemStr+=
				"<img src='${pageContext.request.contextPath}/club/imageView.do?club_num="+matchs[i].club_num+"' class='avatar emblem'>"
		}
		itemStr+=
						"<span class='club_name'>"+matchs[i].club_name+"</span><br>"
						+"<span class='uniform'>"
							+"유니폼";
		if(matchs[i].club_color =="rgb(0, 0, 0)") {
		itemStr+=
							"<span class='color' style='background-color:#000; border:1px solid #ccc;'></span>";					
		}else if(matchs[i].club_color!=""){
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
							+"<span class='star-wrap'>"
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
							+"</span>"
							+"연령대<span class='xs-font margin-left'>"+matchs[i].club_age+"</span>"
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
	
	$('#loader-toast').css('display','flex');
	
	$.ajax({
		url:'nextRecruitPage.do',
		type:'post',
		data:{
			type: ${match.type},
			period: '${match.period}',
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
				$('.ul-list').append(addContent);
				$('#loader-toast').css('display','none');
				
				if(matches.length<30){
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
Date.prototype.format = function(f) {
    if (!this.valueOf()) return " ";
 
    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    var d = this;
     
    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
        switch ($1) {
            case "yyyy": return d.getFullYear();
            case "yy": return (d.getFullYear() % 1000).zf(2);
            case "MM": return (d.getMonth() + 1).zf(2);
            case "dd": return d.getDate().zf(2);
            case "E": return weekName[d.getDay()];
            case "HH": return d.getHours().zf(2);
            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
            case "mm": return d.getMinutes().zf(2);
            case "ss": return d.getSeconds().zf(2);
            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
            default: return $1;
        }
    });
};
String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
Number.prototype.zf = function(len){return this.toString().zf(len);};
$(function(){
	
	$('#loader-toast').css('display','flex');
	
	$('#specific-pr').click(function(){
		$('#period-filter').css('display','block');
	});
	$('#entire-pr').click(function(){
		$('#period-filter').css('display','none');
		$('#datepicker').val('');
	});
	
	let today=new Date();
	let endDate=new Date();
	endDate.setDate(endDate.getDate()+30);
	
	$('#datepicker').daterangepicker({
		"minDate": today,
		"startDate": today,
		"endDate": endDate,
	    "autoApply": true,
	    "opens": "left",
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