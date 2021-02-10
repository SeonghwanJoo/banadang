<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row" id="top_wrap">
	<div class="fixed_top">
		<a onclick="back()">
			<span class="material-icons" id="chevron_left" >close</span>
		</a>
		<div class="topnav-centered">
			<span class="active">${title }</span>
		</div>
		<input type="submit" id="submit" value="신고">
	</div>
</div>
<div class="blank_div"></div>
<div class="main-row margin-top centered-padding">
	<span class="m-margin-right" >작성자</span>
	<span>${report.name}</span>
</div>
<div class="main-row margin-top centered-padding">
	<div class="x-smaller">
		<span>내용</span>
	</div>
	<div class="x-bigger">
		<p class="detail readonly">${report.content}</p>
	</div>
</div>
<hr>
<span class="input-label bold">사유 선택</span>
<ul class="ul-list non-border-btm">
	<li class="li-list">
		<label class="login-label">
			스팸 홍보/도배 글입니다.
			<input type="radio" name="reason">
			<span class="checkmark"></span>
		</label>
	</li>
	<li class="li-list">
		<label class="login-label">
			음란물입니다.
			<input type="radio" name="reason">
			<span class="checkmark"></span>
		</label>
	</li>
	<li class="li-list">
		<label class="login-label">
			불법 정보를 포함하고 있습니다.
			<input type="radio" name="reason">
			<span class="checkmark"></span>
		</label>
	</li>
	<li class="li-list">
		<label class="login-label">
			청소년에게 유해한 내용입니다.
			<input type="radio" name="reason">
			<span class="checkmark"></span>
		</label>
	</li>
	<li class="li-list">
		<label class="login-label">
			욕설/생명경시/혐오/차별적 표현입니다.
			<input type="radio" name="reason">
			<span class="checkmark"></span>
		</label>
	</li>
	<li class="li-list">
		<label class="login-label">
			개인정보 노출 게시물입니다.
			<input type="radio" name="reason">
			<span class="checkmark"></span>
		</label>
	</li>
	<li class="li-list">
		<label class="login-label">
			불쾌한 표현이 있습니다.
			<input type="radio" name="reason">
			<span class="checkmark"></span>
		</label>
	</li>
	<li class="li-list">
		<label class="login-label">
			불법 촬영물 등이 포함되어 있습니다.
			<input type="radio" name="reason">
			<span class="checkmark"></span>
		</label>
	</li>
</ul>
