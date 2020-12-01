<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="row" id="top_wrap">
	<div class="fixed_top">
		<a href="${pageContext.request.contextPath }/main/main.do">
		<span class="material-icons" id="cancel">close</span>
		</a>
		<div class="topnav-centered">
			<a href="javascript:document.reload()" class="active">${title }</a>
		</div>
	</div>
</div>
<div class="blank_div"></div>
<ul class="ul-list">
	<li class="li-list">
		<div class="row">
			<div class="col">
				<div class="main-row ">
				<label class="custom">
					<input type="checkbox">
					<span class="checkmark"></span>
				</label>
					<span class="agreement bold">개인정보 처리 방침 및 이용 약관 전체 동의</span>
				</div>
			</div>
		</div>
	</li>
</ul>
<ul class="ul-list non-border-btm gray">
	<li class="li-list">
		<div class="row">
			<div class="col">
				<div class="main-row ">
				<label class="custom">
					<input type="checkbox">
					<span class="checkmark"></span>
				</label>
					<span class="agreement cursor" id="service">
						서비스 이용 약관 동의
						<i class="fas fa-chevron-right"></i>
					</span>
					
				</div>
			</div>
		</div>
	</li>
	<li class="li-list">
		<div class="row">
			<div class="col">
				<div class="main-row ">
				<label class="custom">
					<input type="checkbox">
					<span class="checkmark"></span>
				</label>
					<span class="agreement cursor" id="privacy">
						개인 정보 처리 방침 동의
						<i class="fas fa-chevron-right"></i>
					</span>
				</div>
			</div>
		</div>
	</li>
</ul>
<!-- The Modal -->
<div id="privacy-myModals" class="modals">
	<!-- Modal content -->
	<div class="modals-content">
		<span id="privacy-close_mod" class="close_mod">&times;</span>
		<p>
		<p class='sub_p mgt10'>
			<span class='colorLightBlue'>1. 개인정보의 처리 목적</span>
			&lt;이시컴퍼니&gt;(‘Gentlepro.com’이하 ‘Gentlepro’) 은(는) 다음의 목적을 위하여 개인정보를
			처리하고 있으며, 다음의 목적 이외의 용도로는 이용하지 않습니다.
		</p>
		<p class='sub_p'>- 고객 가입의사 확인, 고객에 대한 서비스 제공에 따른 본인 식별.인증, 회원자격
			유지.관리, 물품 또는 서비스 공급에 따른 금액 결제, 물품 또는 서비스의 공급.배송 등</p>
		<p class='sub_p mgt30'>
			<strong>2. 개인정보의 처리 및 보유 기간</strong>
		</p>
		<p class='sub_p mgt10'>
			①
			&lt;이시컴퍼니&gt;(‘Gentlepro.com’이하 ‘Gentlepro’) 은(는) 정보주체로부터 개인정보를 수집할
			때 동의 받은 개인정보 보유․이용기간 또는 법령에 따른 개인정보 보유․이용기간 내에서 개인정보를 처리․보유합니다.
		</p>
		<p class='sub_p mgt10'>② 구체적인 개인정보 처리 및 보유 기간은 다음과 같습니다.</p>
		<p class='sub_p'>☞ 아래 예시를 참고하여 개인정보 처리업무와 개인정보 처리업무에 대한 보유기간 및 관련
			법령, 근거 등을 기재합니다.</p>
		<p class='sub_p'>(예시)- 고객 가입 및 관리 : 서비스 이용계약 또는 회원가입 해지시까지, 다만
			채권․채무관계 잔존시에는 해당 채권․채무관계 정산시까지</p>
		<p class='sub_p'>- 전자상거래에서의 계약․청약철회, 대금결제, 재화 등 공급기록 : 5년</p>
		<br>
		<br>
		<p class='lh6 bs4'>
			<strong>3. 개인정보의 제3자 제공에 관한 사항</strong><br>
			<br> ① <em class="emphasis">&lt;이시컴퍼니&gt;('Gentlepro.com'이하
				'Gentlepro')</em>은(는) 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조 및 제18조에 해당하는
			경우에만 개인정보를 제3자에게 제공합니다.
		</p>
		<p class="sub_p mgt10">
			② <span class="colorLightBlue">&lt;이시컴퍼니&gt;('Gentlepro.com')</span>은(는)
			다음과 같이 개인정보를 제3자에게 제공하고 있습니다.
		</p>
		<ul class="list_indent2 mgt10">
			<li class="tt">1. </li>
			<li>개인정보를 제공받는 자 :</li>
			<li>제공받는 자의 개인정보 이용목적 :</li>
			<li>제공받는 자의 보유.이용기간:</li>
		</ul>
		<br>
		<br>
		<p class='lh6 bs4'>
			<strong>4. 개인정보처리 위탁</strong><br>
			<br> ① <em class="emphasis">&lt;이시컴퍼니&gt;('Gentlepro')</em>은(는) 원활한
			개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.
		</p>
		<ul class='list_indent2 mgt10'>
			<li class='tt'>1. </li>
			<li>위탁받는 자 (수탁자) :</li>
			<li>위탁하는 업무의 내용 :</li>
			<li>위탁기간 :</li>
		</ul>
		<p class='sub_p mgt10'>
			② <span class='colorLightBlue'>&lt;이시컴퍼니&gt;('Gentlepro.com'이하
				'Gentlepro')</span>은(는) 위탁계약 체결시 개인정보 보호법 제25조에 따라 위탁업무 수행목적 외 개인정보 처리금지,
			기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에
			명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.
		</p>
		<p class='sub_p mgt10'>③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보
			처리방침을 통하여 공개하도록 하겠습니다.</p>

		<p class="lh6 bs4">
			<strong>5. 정보주체와 법정대리인의 권리·의무 및 그 행사방법 이용자는 개인정보주체로써 다음과 같은
				권리를 행사할 수 있습니다.</strong>
		</p>
		<p class="ls2">① 정보주체는 이시컴퍼니(‘Gentlepro.com’이하 ‘Gentlepro) 에 대해
			언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.</p>
		<p class='sub_p'>1. 개인정보 열람요구</p>
		<p class='sub_p'>2. 오류 등이 있을 경우 정정 요구</p>
		<p class='sub_p'>3. 삭제요구</p>
		<p class='sub_p'>4. 처리정지 요구</p>
		<br>
		<br>
		<p class='lh6 bs4'>
			<strong>6. 처리하는 개인정보의 항목 작성 </strong><br>
			<br> ① <em class="emphasis">&lt;이시컴퍼니&gt;('Gentlepro.com'이하
				'Gentlepro')</em>은(는) 다음의 개인정보 항목을 처리하고 있습니다.
		</p>
		<ul class='list_indent2 mgt10'>
			<li class='tt'>1&lt;홈페이지 회원 가입 및 관리&gt;</li>
			<li>필수항목 : 카카오톡 프로필</li>
			<li>- 선택항목 :</li>
		</ul>
		<br>
		<br>
		<p class='lh6 bs4'>
			<strong>7. 개인정보의 파기<em class="emphasis">&lt;이시컴퍼니&gt;('Gentlepro')</em>은(는)
				원칙적으로 개인정보 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기합니다. 파기의 절차, 기한 및 방법은 다음과
				같습니다.
			</strong>
		</p>
		<p class='ls2'>
			-파기절차<br>이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의 서류) 내부 방침 및 기타 관련
			법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 다른
			목적으로 이용되지 않습니다.<br>
			<br>-파기기한<br>이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로부터 5일 이내에, 개인정보의 처리 목적
			달성, 해당 서비스의 폐지, 사업의 종료 등 그 개인정보가 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로
			인정되는 날로부터 5일 이내에 그 개인정보를 파기합니다.
		</p>
		<p class='sub_p mgt10'></p>
		<br>
		<br>
		<p class="lh6 bs4">
			<strong>8. 개인정보 자동 수집 장치의 설치•운영 및 거부에 관한 사항</strong>
		</p>
		<p class="ls2">이시컴퍼니 은 정보주체의 이용정보를 저장하고 수시로 불러오는 ‘쿠키’를 사용하지 않습니다.
		<p class='sub_p mgt30'>
			<strong>9. 개인정보 보호책임자 작성 </strong>
		</p>
		<p class='sub_p mgt10'>
			① <span class='colorLightBlue'>이시컴퍼니(‘Gentlepro.com’이하
				‘Gentlepro)</span> 은(는) 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리
			및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.
		</p>
		<ul class='list_indent2 mgt10'>
			<li class='tt'>▶ 개인정보 보호책임자</li>
			<li>성명 :주성환</li>
			<li>직책 :대표</li>
			<li>직급 :대표</li>
			<li>연락처 :010-9149-4372, zzoosh@naver.com, 02-498-7642</li>
		</ul>
		<p class='sub_p'>② 정보주체께서는 이시컴퍼니(‘Gentlepro.com’이하 ‘Gentlepro) 의
			서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보
			보호책임자 및 담당부서로 문의하실 수 있습니다. 이시컴퍼니(‘Gentlepro.com’이하 ‘Gentlepro) 은(는)
			정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.</p>
		<p class='sub_p mgt30'>
			<strong>10. 개인정보 처리방침 변경 </strong>
		</p>
		<p class='sub_p mgt10'>①이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의
			추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.</p>
		<br>
		<br>
		<p class='lh6 bs4'>
			<strong>11. 개인정보의 안전성 확보 조치 <em class="emphasis">&lt;이시컴퍼니&gt;('Gentlepro')</em>은(는)
				개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.
			</strong>
		</p>
		<p class='sub_p mgt10'>
			1. 정기적인 자체 감사 실시<br> 개인정보 취급 관련 안정성 확보를 위해 정기적(분기 1회)으로 자체 감사를 실시하고 있습니다.<br>
			<br>
		</p>
	</div>
</div>
<!-- The Modal -->
<div id="service-myModals" class="modals">
	<!-- Modal content -->
	<div class="modals-content small-font">
		<span id="service-close_mod" class="close_mod">&times;</span>
		<div class="agreement-content">
			<h2>이용약관</h2>
			<br>
			<br>
			<h5>&#44;제 1조 목적</h5>
			<p>
				1. 본 약관은 (주)이시컴퍼니(이하 '회사')가 제공하는 'Gentlepro(젠틀프로)'(이하 '서비스')를 이용하는데 필요한 권리, 의무 및 책임 사항, 이용조건 및 절차 등 기본적인 사항을 규정하고 있습니다. 이용자 분들께서는
				주의 깊게 읽어주시기 바랍니다.<br>
				2. '서비스'는 회사가 제공하는 'Gentlepro' 브랜드를 사용하는 '서비스'를 말합니다. 
			</p>
			<br>
			<h5>&#44;제 2조 정의</h5>
			<p>
				1. '회사'란 'Gentlepro '서비스'(이하 '서비스')'를 운영하고 있는 주식회사 이시컴퍼니를 의미합니다.
				<br>
				2. '서비스'란 '회사'가 제공하는 서비스를 말하며, 이는 유/무선 단말기의 종류와 무관하게 제공되는 모든 서비스를 의미하며, 회사가 공개한 API를 이용하여 제 3자가 제공하는 서비를 포함합니다.
				<br>
				3. '회원'이란 본 약관에 동의하고 개인정보를 제공하여 회원 등록을 한자로서, 회사로부터 ID를 부여받고 회사의 방침에 따라 회사가 제공하는 정보와 '서비스'를 이용할 수 있는 자를 말합니다.
				<br>
				4. '비회원'이란 '회원'이 아니면서 '회사'가 제공하는 제한된 '서비스'를 이용하는 자를 말합니다.
				<br>
				5. '이용자'란 회원과 비회원 모두를 의미합니다.
				<br>
				6. '게시물'이란 '회원'이 회사가 제공하는 서비스에 게시 또는 등록하는 부호, 문자, 이미지, 파일 등을 말합니다.
			</p>
			<br>
			<h5>&#44;제 3조 신원정보 등의 제공</h5>
			<p>
				1. '회사'는 이 약관의 내용, 상호, 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호, 모사전송번호, 전자우편주소, 사업자등록번호, 통신판매이버 신고번호 및 개인정보 관리 책임자등을
				'회원'이 쉽게 알 수 있도록 온라인 '서비스' '나의 페이지' 화면에 게시합니다.
			</p>
			<br>
			<h5>&#44;제 4조 약관의 게시와 개정</h5>
			<p>
				1. '회사'는 약관의 규제에 관한 법률, 위치정보의 보호 및 이용 등에 관한 법률, 개인정보 보호법, 전자상거래 등에서의 소비자 보호에 관한 법률, 정보통신망 이용촉진 및 정보보호 등에 관한 법률등 관계 법령에 위배되지 않는
				범위 내에서 이 약관을 개정할 수 있습니다.
				<br>
				2. '회사'가 약관을 개정할 경우에는 적용일자 및 개정 사유를 명시하여 현행 약관과 함께 '서비스' 공지사항 화면에 그 적용일자 7일 이전부터 적용일 후 상당한 기간동안 공지하고, 기존 회원에게는 개정약관을 전자우편 주소로 발송합니다.
				<br>
				3. 공지된 적용일자 이후에 회원이 '회사'의 '서비스'를 계속 이용하는 경우에는 개정된 약관에 동의하는 것으로 봅니다. 개정된 약관에 동의하지 아니하는 회원은 언제든지 자유롭게 '서비스' 이용 계약을 해지할 수 있습니다.
			</p>
			<br>
			<h5>&#44;제 5조 약관의 해석</h5>
			<p>
				1. 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 약관의 규제에 관한 법률, 위치정보의 보호 및 이용 등에 관한 법률, 개인정보 보호법, 전자상거래 등에서의 소비자 보호에 관한 법률, 정보통신망 이용촉진 및 정보보호 등에 관한 법률등 관계 법령
				, 기타 관계법령 또는 상관례에 따릅니다.
			</p>
			<br>
			<h5>&#44;제 6조 회원가입/변경 및 탈퇴에 따른 자격상실</h5>
			<p>
				1. 회원가입은 '비회원'이 약관의 내용에 대하여 동의를 하고 '회사'가 정한 가입 절차에 따라 제공된 회원 정보를 '서비스'에 등록함으로써 체결됩니다.
				<br>
				2. '회사'는 상기 '비회원'의 회원 가입 신청에 대하여 가입 승낙함을 원칙으로 합니다. 다만, '회사'는 다음 각 호에 해당하는 신청에 대하여는 회원 자격을 회수 할 수 있습니다.
				&nbsp; ① 가입 신청자가 이 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우 
				&nbsp; ② 가입정보가 중복되는 경우
				&nbsp; ③ 허위의 정보를 기재하거나, 회사가 제시하는 내용을 기재하지 않은 경우
				&nbsp; ④ 비회원의 귀책 사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하며 신청하는 경우
				&nbsp; ⑤ 기타 '회사'가 합리적인 판단에 의하여 필요하다고 인정하는 경우
				<br>
				3. '회사'는 '서비스' 관련 설비의 여유가 없거나, 기술상 또는 업무상 문제가 있는 경우에는 승낙을 유보할 수 있습니다.
				<br>
				4. '회원' 연결된 카카오톡 프로필 수정을 통하여 언제든지 개인정보를 열람하고 수정할 수 있습니다.
				<br>
				5. '회원'의 '아이디'와 '비밀번호'에 관한 관리 책임을 '회원'에게 있으며, 이를 제 3자가 이용하도록 하여서는 안 됩니다.
				<br>
				6. '회원'은 '아이디' 및 '비밀번호'가 도용되거나 제 3자에 의해 사용되고 있음을 인지한 경우에는 이를 즉시 '회사'에 통지하고 '회사'의 안내에 따라야 합니다.
				<br>
				7. 제 6항의 경우에 해당 '회원'이 '회사'에 그 사실을 통지하지 않건, 통지한 경우에도 '회사'의 안내에 따르지 않아 발생한 불이익에 대하여 '회사'는 책임지지 않습니다.
				<br>
				8. '회원'은 '회사'에 언제든지 탈퇴를 요청할 수 있으며 '회사'는 즉시 회원탈퇴를 처리합니다.
				<br>
				9. '회원'이 다음 각 호의 사유에 해당하는 경우, '회사'는 회원자격을 제한 및 정지시킬 수 있습니다.
				<br>
				&nbsp; ① 가입신청 시에 허위 내용을 등록한 경우
				<br>
				&nbsp; ② '회사'의 '서비스' 이용대금, 기타 '회사'의 '서비스' 이용에 관련하여 '회원'이 부담하는 채무를 기일에 이행하지 않는 경우
				<br>
				&nbsp; ③ 다른 '이용자'의 '회사' '서비스' 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우
				<br>
				&nbsp; ④ 다른 '이용자'의 권리나 명예를 침해하는 경우
				<br>
				&nbsp; ⑤ 명백한 이유 없이 '회사'의 '서비스'를 상습 반복적으로 실행/취소하여 '회사'의 업무를 방해하는 경우
				<br>
				&nbsp; ⑥ 근거 없는 사실 또는 허위 사실을 적시하거나 유포하여 '회사'의 명예를 실추시키는 경우
				<br>
				&nbsp; ⑦ '회사'를 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우
				<br>
				&nbsp; ⑧ 계정을 판매하거나 양도하는 경우
				<br>
				13. '회사'가 회원자격을 제한&#44;정지시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 '회사'는 회원자격을 상실시킬 수 있습니다.
				<br>
				14. '회사'가 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 '회원'에게 이를 통지하고, 회원등록 말소 전 소명할 기회를 부여합니다.
			</p>
			<br>
			
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function(){
		$('#service').click(function(){
			$('#service-myModals').css('display','block');
		});
		$('#service-close_mod').click(function(){
			$('#service-myModals').css('display','none');
		});
		$('#privacy').click(function(){
			$('#privacy-myModals').css('display','block');
		});
		$('#privacy-close_mod').click(function(){
			$('#privacy-myModals').css('display','none');
		});
		
	});
</script>