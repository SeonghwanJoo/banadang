<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
<%-- 	<ul class="ul-list">
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
				<div class="col club_main">
					<c:if test="${!empty match.club_img }">
					<img src="${club_img }" alt="Avatar" class="avatar emblem">
					</c:if>
					<c:if test="${empty match.club_img }">
					<img src="${pageContext.request.contextPath }/resources/images/blank_emblem.png" alt="Avatar" class="avatar emblem">
					</c:if>
					<span class="club_name">${match.club_name }</span><br>
					<span class="uniform">
						유니폼
						<c:if test="${!empty match.club_color }">
						<span class="color"></span>
						</c:if>
						<c:if test="${empty match.club_color }">
						미정
						</c:if>
					</span>
				</div>
				<div class="col">
					매너 : ${match.manner*2}/10
					<span class="star-wrap">
					<span class="star-rating">
						<span style="width:${match.manner*20}%"></span>
					</span>
					</span><br>
					실력 : ${match.perform*2}/10
					<span class="star-rating">
						<span style="width:${match.perform*20}%"></span>
					</span><br>
					평균 연령 : 30대
				</div>			
			</div>
		</li>
		</c:forEach>
	</ul>
--%>
<input type="file" id="test" accept="image/*">
<img id="preview">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

$("#test").on("change",function preview(event) {
	console.log("input");
	var file=event.target.files[0];
    	console.log("input2");
      var reader = new FileReader();
      reader.readAsDataURL(file);          
      reader.onload = function(e) {
        $("#preview").attr('src', e.target.result);
        var image=new Image();
        image.src=e.target.result;
        image.onload=function(image){
        	console.log("image.src : "+image.src);
        }
      }
});


		
	 
</script>
</body>

</html>