<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row" id="top_wrap">
	<div class="fixed_top">
		<a href="javascript:location.href='${pageContext.request.contextPath }/member/myPage.do'">
		<span class="material-icons" id="cancel">close</span>
		</a>
		<div class="topnav-centered">
			<span class="active">${title }</span>
		</div>
	</div>
</div>
<div class="blank_div"></div>
<ul class="ul-list non-border-btm gray">
	<li class="li-list cursor" onclick="location.href='${pageContext.request.contextPath}/member/service.do'">
		<div class="row">
			<div class="col">
				<span>서비스 이용안내</span>
				<i class="fas fa-chevron-right"></i>
			</div>
		</div>
	</li>
	<li class="li-list cursor" onclick="location.href='${pageContext.request.contextPath}/member/privacy.do'">
		<div class="row">
			<div class="col">
				<span>개인 정보 보호 정책</span>
				<i class="fas fa-chevron-right"></i>
			</div>
		</div>
	</li>
</ul>
