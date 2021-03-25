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