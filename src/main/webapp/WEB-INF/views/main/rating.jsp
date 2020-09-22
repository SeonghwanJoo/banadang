<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row" id="top_wrap">
	<div class="fixed_top">
		<a href="#" onclick="history.go(-1)">
		<span class="material-icons" id="cancel" >close</span>
		</a>
		<div class="topnav-centered">
			<a href="#home" class="active">${title }</a>
		</div>
		<input type="submit" id="submit" value="완료">
	</div>
</div>
<ul class="match-list">
	<li class="match">	
		<div class="match-info" id="write_body">
			<div class="match-info invote">
				<span class="match-item">${match.match_date}</span>
				<span class="match-item">${match.start_time }~${match.end_time }</span>
				<span class="match-item">${match.address}</span>
				<span class="match-item">
					<c:if test="${match.type==1 }">축구</c:if>
					<c:if test="${match.type==2 }">풋살</c:if>
				</span>
			</div>
			<hr>
			<div class="row">
				<div class="team-info col">
					${match.home_name}<br>
					매너 : ${match.home_manner*2}/10
					<span class="star-wrap">
					<span class="star-rating">
						<span style="width:${match.home_manner*20}%"></span>
					</span>
					</span><br>
					실력 : ${match.home_perform*2}/10
					<span class="star-rating">
						<span style="width:${match.home_perform*20}%"></span>
					</span>
				</div>
				<span class="from-to">VS</span>
				<div class="team-info col">
					${match.away_name}<br>
					매너 : ${match.away_manner*2}/10
					<span class="star-wrap">
					<span class="star-rating">
						<span style="width:${match.away_manner*20}%"></span>
					</span>
					</span><br>
					실력 : ${match.away_perform*2}/10
					<span class="star-rating">
						<span style="width:${match.away_perform*20}%"></span>
					</span>
				</div>
			</div>
		</div>
		<input type="hidden" id="id" value="${user_id }">
		<input type="hidden" id="club_num" value="${match.club_num }">
		<input type="hidden" id="match_num" value="${match.club_num }">
		<hr class="hr">
		<div class="wrapper">
		<span class="rating_title">매너</span><br>
		<span>약속 준수/페어플레이/거친 정도 등을 고려해 평가해주세요</span><br>
			<i class="manner_rating fas fa-star"  id="manner_1"></i>
			<i class="manner_rating fas fa-star"  id="manner_2"></i>
			<i class="manner_rating fas fa-star"  id="manner_3"></i>
			<i class="manner_rating fas fa-star"  id="manner_4"></i>
			<i class="manner_rating fas fa-star"  id="manner_5"></i>
			<br>
		<span id="manner_msg">선택하세요</span>
		<input type="hidden" name="manner" id="manner">
		</div>
		<div class="wrapper">
		<span class="rating_title">실력</span><br>
		<span>실력 수준을 평가해주세요</span><br>
			<i class="perform_rating fas fa-star" id="perform_1"></i>
			<i class="perform_rating fas fa-star" id="perform_2"></i>
			<i class="perform_rating fas fa-star" id="perform_3"></i>
			<i class="perform_rating fas fa-star" id="perform_4"></i>
			<i class="perform_rating fas fa-star" id="perform_5"></i>
			<br>
		<span id="perform_msg">선택하세요</span>
		<input type="hidden" name="perform" id="perform">
		</div>
		<div class="row">
			<div class="text input-container col">
				<textarea class="detail input-field" id="rating_detail" name="rating_detail" 
				placeholder="경기평(선택 입력)"></textarea>
			</div>
		</div>
	</li>
</ul>
<!-- The Modal -->
<div id="toast" class="submit_toast">

  <!-- Modal content -->
  <div id="submit_toast_content" class="submit_toast_content">
     <span id="rating_msg">상대팀 평점 수정 완료</span>
     <br><br>확인
  </div>
  

</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
 $(function(){
	
	 
	$('#manner_1').click(function(){
		$('.manner_rating').css('color','#d6d6d6');
		$('#manner_1').css('color','#f9e936'); 
		$('#manner_msg').text('다시 경기하고 싶지 않아요');
		$('#manner').val(1);
	});
	$('#manner_2').click(function(){
		$('.manner_rating').css('color','#d6d6d6');
		$('#manner_1').css('color','#f9e936'); 
		$('#manner_2').css('color','#f9e936'); 
		$('#manner_msg').text('별로에요');
		$('#manner').val(2);
	});
	$('#manner_3').click(function(){
		$('.manner_rating').css('color','#d6d6d6');
		$('#manner_1').css('color','#f9e936'); 
		$('#manner_2').css('color','#f9e936'); 
		$('#manner_3').css('color','#f9e936');
		$('#manner_msg').text('괜찮아요');
		$('#manner').val(3);
	});
	$('#manner_4').click(function(){
		$('.manner_rating').css('color','#d6d6d6');
		$('#manner_1').css('color','#f9e936'); 
		$('#manner_2').css('color','#f9e936'); 
		$('#manner_3').css('color','#f9e936');
		$('#manner_4').css('color','#f9e936');
		$('#manner_msg').text('좋아요');
		$('#manner').val(4);
	});
	$('#manner_5').click(function(){
		$('.manner_rating').css('color','#f9e936');
		$('#manner_msg').text('매너 최상이에요');
		$('#manner').val(5);
	});
	$('#manner_1').hover(function(){
		$('.manner_rating').css('color','#d6d6d6');
		$('#manner_1').css('color','#f9e936'); 
		$('#manner_msg').text('다시 경기하고 싶지 않아요');
		$('#manner').val(1);
	});
	$('#manner_2').hover(function(){
		$('.manner_rating').css('color','#d6d6d6');
		$('#manner_1').css('color','#f9e936'); 
		$('#manner_2').css('color','#f9e936'); 
		$('#manner_msg').text('별로에요');
		$('#manner').val(2);
	});
	$('#manner_3').hover(function(){
		$('.manner_rating').css('color','#d6d6d6');
		$('#manner_1').css('color','#f9e936'); 
		$('#manner_2').css('color','#f9e936'); 
		$('#manner_3').css('color','#f9e936');
		$('#manner_msg').text('괜찮아요');
		$('#manner').val(3);
	});
	$('#manner_4').hover(function(){
		$('.manner_rating').css('color','#d6d6d6');
		$('#manner_1').css('color','#f9e936'); 
		$('#manner_2').css('color','#f9e936'); 
		$('#manner_3').css('color','#f9e936');
		$('#manner_4').css('color','#f9e936');
		$('#manner_msg').text('좋아요');
		$('#manner').val(4);
	});
	$('#manner_5').hover(function(){
		$('.manner_rating').css('color','#f9e936');
		$('#manner_msg').text('매너 최상이에요');
		$('#manner').val(5);
	});
	$('#perform_1').click(function(){
		$('.perform_rating').css('color','#d6d6d6');
		$('#perform_1').css('color','#f9e936'); 
		$('#perform_msg').text('처음 시작하신 듯');
		$('#perform').val(1);
	});
	$('#perform_2').click(function(){
		$('.perform_rating').css('color','#d6d6d6');
		$('#perform_1').css('color','#f9e936'); 
		$('#perform_2').css('color','#f9e936'); 
		$('#perform_msg').text('아직 부족');
		$('#perform').val(2);
	});
	$('#perform_3').click(function(){
		$('.perform_rating').css('color','#d6d6d6');
		$('#perform_1').css('color','#f9e936'); 
		$('#perform_2').css('color','#f9e936'); 
		$('#perform_3').css('color','#f9e936');
		$('#perform_msg').text('보통이에요');
		$('#perform').val(3);
	});
	$('#perform_4').click(function(){
		$('.perform_rating').css('color','#d6d6d6');
		$('#perform_1').css('color','#f9e936'); 
		$('#perform_2').css('color','#f9e936'); 
		$('#perform_3').css('color','#f9e936');
		$('#perform_4').css('color','#f9e936');
		$('#perform_msg').text('잘하시네요');
		$('#perform').val(4);
	});
	$('#perform_5').click(function(){
		$('.perform_rating').css('color','#f9e936');
		$('#perform_msg').text('모두 선출 같아요');
		$('#perform').val(5);
	});
	$('#perform_1').hover(function(){
		$('.perform_rating').css('color','#d6d6d6');
		$('#perform_1').css('color','#f9e936'); 
		$('#perform_msg').text('처음 시작하신 듯');
		$('#perform').val(1);
	});
	$('#perform_2').hover(function(){
		$('.perform_rating').css('color','#d6d6d6');
		$('#perform_1').css('color','#f9e936'); 
		$('#perform_2').css('color','#f9e936'); 
		$('#perform_msg').text('아직 부족');
		$('#perform').val(2);
	});
	$('#perform_3').hover(function(){
		$('.perform_rating').css('color','#d6d6d6');
		$('#perform_1').css('color','#f9e936'); 
		$('#perform_2').css('color','#f9e936'); 
		$('#perform_3').css('color','#f9e936');
		$('#perform_msg').text('보통이에요');
		$('#perform').val(3);
	});
	$('#perform_4').hover(function(){
		$('.perform_rating').css('color','#d6d6d6');
		$('#perform_1').css('color','#f9e936'); 
		$('#perform_2').css('color','#f9e936'); 
		$('#perform_3').css('color','#f9e936');
		$('#perform_4').css('color','#f9e936');
		$('#perform_msg').text('잘하시네요');
		$('#perform').val(4);
	});
	$('#perform_5').hover(function(){
		$('.perform_rating').css('color','#f9e936');
		$('#perform_msg').text('모두 선출 같아요');
		$('#perform').val(5);
	});
	$('#submit').click(function(){
		$.ajax({
			url:'rating.do',
			type:'post',
			data:{
				match_num:${match.match_num },
				id:${user_id},
				club_num:${match.club_num},
				manner:$('#manner').val(),
				perform:$('#perform').val(),
				rating_detail:$('#rating_detail').val()
			},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(data){
				console.log(data.result);
				if(data.result=='updated'){
					console.log(data.result+'in updated');
					$('#rating_msg').text('상대팀 평점 수정 완료');
				}else if(data.result=='inserted'){
					$('#rating_msg').text('상대팀 평점 등록 완료');
				}
				
				$('#toast').css('display','block');
				$('#confirm').click(function(){
					location.href='${pageContext.request.contextPath}/club/main.do';
				});
				$(window).click(function(){
					location.href='main.do';
				});
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
	});
 });
</script>







