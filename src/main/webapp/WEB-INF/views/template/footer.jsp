<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row blank_div"> </div>
<div class="row">
	<div class="bottom_menu">
		<div class="row">
			<div class="col">
				<a class="menu-item" href="${pageContext.request.contextPath }/main/main.do">
				<span class="main material-icons bottom-icon">home</span>
				<span class="main bottom-icon-txt">홈</span>
				</a>
			</div>
			<div class="col">
				<a class="menu-item" href="${pageContext.request.contextPath }/match/match_toInvite.do">
				<span class="invite material-icons bottom-icon">sports_soccer</span>
				<span class="invite bottom-icon-txt">상대팀 매칭</span>
				</a>
			</div>
			<div class="col">
				<a class="menu-item" href="${pageContext.request.contextPath }/match/join.do">
				<span class="join material-icons bottom-icon">person_add</span>
				<span class="join bottom-icon-txt">용병 모집</span>
				</a>
			</div>
			<div class="col">
				<a class="menu-item" href="${pageContext.request.contextPath }/club/club.do">
				<span class="club material-icons bottom-icon">groups</span>
				<span class="club bottom-icon-txt">팀 관리</span>
				</a>
			</div>
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function(){
		if(${title eq 'BANADANG'}){
			$('.main').css('color','black');
		}else if(${title eq '경기 매치'}){
			$('.invite').css('color','black');
		}else if(${title eq '용병 모집'}){
			$('.join').css('color','black');
		}else if(${title eq '팀 관리'}){
			$('.club').css('color','black');
		}
	});
</script>
