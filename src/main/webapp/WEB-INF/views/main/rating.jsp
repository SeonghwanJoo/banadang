<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="row" id="top_wrap">
	<div class="fixed_top">
		<c:if test="${isMain }">
		<a href="${pageContext.request.contextPath}/main/main.do">
			<span class="material-icons" id="cancel" >close</span>
		</a>
		</c:if>
		<c:if test="${isMain }">
		<a href="${pageContext.request.contextPath}/club/manageClub.do?club_num=${myClub.club_num}">
			<span class="material-icons" id="cancel" >close</span>
		</a>
		</c:if>
		<div class="topnav-centered">
			<span class="active">${title }</span>
		</div>
		<input type="submit" id="submit" value="완료">
	</div>
</div>
<div class="blank_div"></div>
<ul class="ul-list non-border-btm">
	<li class="li-list">
		<div class="match-info-wrapper">	
			<div class="row">
				<c:if test="${match.type==1 }">
				<span class="match-item last soccer">
				축구
				</span>	
				</c:if>
				<c:if test="${match.type==2 }">
				<span class="match-item last futsal">
				풋살
				</span>	
				</c:if>
				<span class="match-item">${match.address}</span>
			</div>
			<div class="row gray">
				<span class="match-item"><i class="far fa-calendar-alt margin-right"></i><fmt:formatDate value="${match.match_date}" pattern="MM월 dd일"/></span>
				<span class="match-item"><i class="far fa-clock margin-right"></i>${match.start_time }~${match.end_time }</span>
			</div>
		</div>
			<div class="row small-font margin-top margin-btm">
			<c:if test="${empty match.home_name }">
			<div class="team-info col">
				<span class="disp-inbl margin-top">삭제된 팀</span>
			</div>
			</c:if>
			<c:if test="${not empty match.home_name }">
			<div class="team-info col cursor" onclick="location.href='${pageContext.request.contextPath}/club/club_details.do?club_num=${match.home }'">
				<div class="row margin-top margin-btm">
					<div class="centered">
						<c:if test="${not empty match.home_filename }">
						<img src="${pageContext.request.contextPath }/club/imageView.do?club_num=${match.home}" alt="Avatar" class="avatar emblem">
						</c:if>
						<c:if test="${empty match.home_filename  }">
						<img src="${pageContext.request.contextPath }/resources/images/blank_emblem.png" alt="Avatar" class="avatar emblem">
						</c:if>
						<span class="disp-inbl margin-top">${match.home_name}</span>
					</div>
				</div>
				<div class="centered">
					<span class="margin-right">매너</span> 
					<span class="star-rating">
						<span style="width:${match.home_manner*20}%"></span>
					</span>
					<span>${match.home_manner*2}</span>
				</div>
				<div class="centered">
					<span class="margin-right">실력</span> 
					<span class="star-rating">
						<span style="width:${match.home_perform*20}%"></span>
					</span>
					${match.home_perform*2}
				</div>
			</div>
			</c:if>
			<span class="from-to">VS</span>
			<c:if test="${match.away != 0 }">
				<c:if test="${not empty match.away_name }">
				<div class="team-info col cursor" onclick="location.href='${pageContext.request.contextPath}/club/club_details.do?club_num=${match.away }'">
					<div class="row margin-top margin-btm">
						<div class="centered">
							<c:if test="${not empty match.away_filename }">
							<img src="${pageContext.request.contextPath }/club/imageView.do?club_num=${match.away}" alt="Avatar" class="avatar emblem">
							</c:if>
							<c:if test="${empty match.away_filename  }">
							<img src="${pageContext.request.contextPath }/resources/images/blank_emblem.png" alt="Avatar" class="avatar emblem">
							</c:if>
							<span class="disp-inbl margin-top">${match.away_name}</span>
						</div>
					</div>
					<div class="centered">
						<span class="margin-right">매너</span> 
						<span class="star-rating">
							<span style="width:${match.away_manner*20}%"></span>
						</span>
						<span>${match.away_manner*2}</span>
					</div>
					<div class="centered">
						<span class="margin-right">실력</span> 
						<span class="star-rating">
							<span style="width:${match.away_perform*20}%"></span>
						</span>
						${match.away_perform*2}
					</div>
				</div>
				</c:if>
				<c:if test="${empty match.away_name }">
				<div class="team-info col">
					<span class="disp-inbl margin-top">삭제된 팀</span>
				</div>
				</c:if>
			</c:if>
			<c:if test="${match.away == 0 }">
			<div class="team-info col">
				<div class="row margin-top">
					<div class="margin-top centered">
						<span class="disp-bl">모집 중</span>
					</div>
				</div>
			</div>
			</c:if>
		</div>
		<input type="hidden" id="id" value="${user_id }">
		<input type="hidden" id="club_num" value="${match.club_num }">
		<input type="hidden" id="match_num" value="${match.club_num }">
		<hr class="hr">
		<div class="wrapper">
		<span class="rating_title">매너</span><br>
		<span>약속 준수/페어플레이/거친 정도 등을 고려해 평가해주세요</span><br>
			<div class="row centered margin-top margin-btm">
				<i class="manner_rating fas fa-star"  id="manner_1"></i>
				<i class="manner_rating fas fa-star"  id="manner_2"></i>
				<i class="manner_rating fas fa-star"  id="manner_3"></i>
				<i class="manner_rating fas fa-star"  id="manner_4"></i>
				<i class="manner_rating fas fa-star"  id="manner_5"></i>
			</div>
		<span id="manner_msg">선택하세요</span>
		<input type="hidden" name="manner" id="manner">
		</div>
		<div class="wrapper">
		<span class="rating_title">실력</span><br>
		<span >실력 수준을 평가해주세요</span><br>
			<div class="row centered margin-top margin-btm">
				<i class="perform_rating fas fa-star" id="perform_1"></i>
				<i class="perform_rating fas fa-star" id="perform_2"></i>
				<i class="perform_rating fas fa-star" id="perform_3"></i>
				<i class="perform_rating fas fa-star" id="perform_4"></i>
				<i class="perform_rating fas fa-star" id="perform_5"></i>
			</div>
		<span id="perform_msg">선택하세요</span>
		<input type="hidden" name="perform" id="perform">
		</div>
		<div class="row">
			<div class="text input-container">
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
		<div class="row centered margin-btm centered-padding">
			<span id="club_msg">상대팀 평점 업데이트 완료</span>
		</div>
		<div class="row margin-top centered">
			<button class="alert-btn">확인</button>
		</div>
	</div>

</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
 $(function(){
	
		$('#rating_detail').keyup(function (){
			
			var str=$(this).val();
			if(str.length>500){
				alert("최대 500자 까지 입력 가능합니다.");
				$(this).val(str.substring(0,500));
			}
			
		});
	 
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
				if(data.result=='updated'){
					$('#rating_msg').text('상대팀 평점 수정 완료');
				}else if(data.result=='inserted'){
					$('#rating_msg').text('상대팀 평점 등록 완료');
				}
				
				$('#toast').css('display','block');
				$('#confirm').click(function(){
					if(${isMain}){
						location.href='${pageContext.request.contextPath}/main/main.do';
					}else{
						location.href='${pageContext.request.contextPath}/club/manageClub.do?club_num='+${myClub.club_num};
					}
				});
				$(window).click(function(){
					if(${isMain}){
						location.href='${pageContext.request.contextPath}/main/main.do';
					}else{
						location.href='${pageContext.request.contextPath}/club/manageClub.do?club_num='+${myClub.club_num};
					}
				});
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
	});
 });
</script>







