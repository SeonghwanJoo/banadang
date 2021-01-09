<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row" id="top_wrap">
	<div class="fixed_top">
		<a onclick="location.href='qnaDetail.do?qna_num=${board.qna_num}'">
			<span class="material-icons" id="chevron_left" >close</span>
		</a>
		<div class="topnav-centered">
			<span class="active">${title }</span>
		</div>
	</div>
</div>
<div class="blank_div"></div>
<div class="main-row margin-top cursor" onclick="location.href='qnaDetail.do?qna_num=${board.qna_num}'">
	<span class="m-font">${board.title }</span>
	<span class="material-icons float-right l-font gray">
		chevron_right
	</span>
</div>
<hr class="hr">
<div class="row">
	<div class="text input-container col">
		<textarea class="detail input-field" name="content" id="content" placeholder="댓글 내용을 입력해주세요."></textarea>
	</div>
</div>
<div style="display:block;height:2rem;">
	<span class="msg" id="content_msg"></span>
	<button id="register" class="f-r register-btn">등록</button>
	<span id="counter" class="gray small-font f-r">0 / 최대 500자</span>
</div>
<div id="answer-wrapper" class="border-top">
<c:if test="${not empty answers }">
<ul class="ul-list">
<c:forEach items="${answers }" var="answer">
<li class="li-list">
	<div class="main-row margin-top">
		<span class="nickname">${answer.nickname }</span>
		<span class="small-font bold gray">${answer.register_date }</span>
		<c:if test="${answer.id==user_id }">
		<span class="material-icons more cursor m-font gray" id="more" onclick="modifyAnswer(${answer.answer_num})" >more_vert</span>
		</c:if>
	</div>
	<p>
	${answer.content }
	</p>
</li>
</c:forEach>
</ul>
</c:if>
</div>
<div id="more_modal" class="confirm-modals">
	<!-- Modal content -->
	<div class="confirm-modal-content">
		<div class="sub-content">
			<button id="modify" class="pos-btn">수정</button>
			<hr>
			<button id="delete" class="pos-btn red">삭제</button>
		</div>
		<div class="sub-content">
			<button id="more-cancel-btn" class="neg-btn">닫기</button>
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

function modifyAnswer(answer_num){
	
	$('#more_modal').css('display','block');
	$('#delete').click(function(){
		$.ajax({
			url:'deleteAnswer.do',
			type:'post',
			data:{
				answer_num: answer_num,
			},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(data){
				if(data.result=='success'){
					location.reload();
				}
				if(data.result=='errors'){
					
					alert('오류 발생');
					$(window).click(function(){
						$('#more_modal').css('display','none');
					});
				}
				
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
		
	});
	$('#modify').click(function(){
		location.href='modifyAnswer.do?answer_num='+answer_num;
	});
}
	
$('#register').click(function(){
	
	if(!$('#content').val().replace(/^\s+|\s+$/g, '')){
		$('#content_msg').css('color','red').text('답글 내용을 입력해주세요.');
		return false;
	}
	$.ajax({
		url:'postAnswer.do',
		type:'post',
		data:{
			qna_num: ${qna_num},
			id: ${user_id},
			content: $('#content').val()
		},
		dataType:'json',
		cache:false,
		timeout:30000,
		success:function(data){
			if(data.result=='success'){
				//data를 전달한다
				//답글을 insert한다
				//입력창의 높이를 한줄 높이로 줄인다,내용을 지운다
				$('#content').height('2rem').val('');
				//답글 리스트를 업데이트 한다
				var answers=new Array();
				answers=data.answers;
				var el =document.createElement('ul');
				el.className='ul-list';
				var itemStr="";
				for(var i=0;i<answers.length;i++){
					
					itemStr+=
						"<li class='li-list'>"
						+"<div class='main-row margin-top'>"
							+"<span class='nickname'>"+answers[i].nickname+"</span>"
							+"<span class='small-font bold gray'>"+new Date(answers[i].register_date).format('yyyy-MM-dd')+"</span>";
					if(answers[i].id == '${user_id}'){
						itemStr+=
							"<span class='material-icons more cursor m-font gray' id='more' onclick='modifyAnswer("+answers[i].answer_num+")'>more_vert</span>";
						
						
					}
					itemStr+=
						"</div>"
						+"<p>"+answers[i].content+"</p>"
						+"</li>"
				}
				el.innerHTML=itemStr;
				var wrapper=document.getElementById('answer-wrapper');
				wrapper.innerHTML='';
				wrapper.appendChild(el);
				
			}
			if(data.result=='errors'){
				
				alert('오류 발생');
			}
			
		},
		error:function(){
			alert('네트워크 오류 발생');
		}
	});
	
});
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
		
		$('#content').focus();
		
		
		$('#more').click(function(){
			
			$('#more_modal').css('display','block');
		});
		$('#more-cancel-btn').click(function(){
			$('#more_modal').css('display','none');
		});
		
		$('#content').click(function(){
			$('#content_msg').text('');
		});
		
	})


</script>