<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="invite-wrapper">
	<ul class="ul-list">
		<c:forEach items="${matchVO }" var="match">
		<li class="li-list">
			<div class="row">
				<span class="match-item">${match.match_date}</span>
				<span class="match-item">${match.start_time }~${match.end_time }</span>
				<span class="match-item">${match.address}</span>
				<span class="match-item">
					<c:if test="${match.type==1 }">축구</c:if>
					<c:if test="${match.type==2 }">풋살</c:if>
				</span>
			</div>
			<div class="row">
							
			</div>
		</li>
		</c:forEach>
	</ul>
</div>




<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

</script>