<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${not empty user_id }">
<ul class="ul-list">
	<li class="li-list">
		<div class="row">
			<div class="col nowrap">
				<c:if test="${empty member.thumbnail_image }">
				<img src="${pageContext.request.contextPath }/resources/images/profile.png" alt="Avatar" class="avatar">
				</c:if>
				<c:if test="${not empty member.thumbnail_image }">
				<img src="${member.thumbnail_image }" alt="Avatar" class="avatar">
				</c:if>
				<span>${member.nickname }  </span>
				<c:if test="${not empty member.age_range }">
				<span> | ${fn:substring(member.age_range,0,1)}0대</span>
				</c:if>
				<br>
				<span class="xs-font ">${member.email }</span>
			</div>
			<div class="col">
				<button class="sync" onclick="location.href='${pageContext.request.contextPath}/member/kakaoSync.do'">
					<img src="${pageContext.request.contextPath }/resources/images/kakao-logo.jpg">
					<span>프로필 업데이트하기</span>
				</button>
			</div>
		</div>
	</li>
</ul>
<ul class="ul-list ">
	<li class="li-list cursor" onclick="location.href='myRecruitReq.do'">
		<div class="row">
			<div class="col">
				<i class="fas fa-user-plus"></i>
				<span>나의 용병 신청 현황</span>
			</div>
		</div>
	</li>
	<li class="li-list cursor" onclick="location.href='myClubRecruitReq.do'">
		<div class="row">
			<div class="col">
				<i class="fas fa-users"></i>
				<span>나의 팀 가입 신청 현황</span>
			</div>
		</div>
	</li>
</ul>
<ul class="ul-list ">
	<li class="li-list cursor" onclick="location.href='clubRecruit.do'">
		<div class="row">
			<div class="col">
				<i class="far fa-futbol"></i>
				<span>팀원 모집</span>
			</div>
		</div>
	</li>
	<c:if test="${not empty myClub }">
	<li class="li-list cursor" onclick="sendLink()">
		<div class="row">
			<div class="col">
				<i class="fas fa-share-alt"></i>
				<span>카카오톡으로 팀원 초대하기</span>
			</div>
		</div>
	</li>
	</c:if>
	<li class="li-list cursor" onclick="location.href='${pageContext.request.contextPath}/board/qna.do'">
		<div class="row">
			<div class="col">
				<i class="fas fa-headset"></i>
				<span>자주 묻는 질문</span>
			</div>
		</div>
	</li>
	<li class="li-list cursor" onclick="location.href='${pageContext.request.contextPath}/member/appSetting.do'">
		<div class="row">
			<div class="col">
				<i class="fas fa-cog"></i>
				<span>앱 설정</span>
			</div>
		</div>
	</li>
</ul>
</c:if>
<ul class="ul-list non-border-btm ">
	<li class="li-list cursor" onclick="location.href='${pageContext.request.contextPath}/board/notice.do'">
		<div class="row">
			<div class="col">
				<i class="fas fa-bullhorn"></i>
				<span>공지 사항</span>
			</div>
		</div>
	</li>
	<li class="li-list cursor" onclick="location.href='${pageContext.request.contextPath}/member/policy.do'">
		<div class="row">
			<div class="col">
				<i class="fas fa-file-contract m-font"></i>
				<span>약관 및 정책</span>
			</div>
		</div>
	</li>
</ul>
<div class="mid-banner">
	<ins class="kakao_ad_area" style="display:none;" 
	 data-ad-unit    = "DAN-gCSwQUEFuriXnEOA" 
	 data-ad-width   = "320" 
	 data-ad-height  = "100"></ins>
 </div>
<script type="text/javascript" src="//t1.daumcdn.net/kas/static/ba.min.js" async></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">

Kakao.init('32776969383e4a77d92f6e18dd233bc5');
function sendLink() {
    Kakao.Link.sendCustom({
    	templateId: 34560,
    	templateArgs: {
    		'msg_title': '${myClub.club_name} 팀으로 당신을 초대합니다.',
    		'msg_description': '아래 링크를 눌러 들어오세요.',
    		'club_num': '${myClub.club_num}',
    		'nickname': '${member.nickname}'
    	}
    })
  }
</script>
