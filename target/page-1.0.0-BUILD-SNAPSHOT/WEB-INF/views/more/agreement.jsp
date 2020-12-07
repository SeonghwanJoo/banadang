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
			<span class="active">${title }</span>
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
					<input type="checkbox" id="all" name="all">
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
					<input type="checkbox" name="service">
					<span class="checkmark"></span>
				</label>
					<span class="agreement cursor" id="service">
						서비스 이용 약관 동의<span class="xs-font">(필수)</span>
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
					<input type="checkbox" name="privacy">
					<span class="checkmark"></span>
				</label>
					<span class="agreement cursor" id="privacy">
						개인 정보 처리 방침 동의<span class="xs-font">(필수)</span>
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
					<input type="checkbox" name="marketing">
					<span class="checkmark"></span>
				</label>
					<span class="agreement">
						마케팅 정보 수신 동의<span class="xs-font">(선택)</span>
					</span>
				</div>
			</div>
		</div>
	</li>
</ul>
<input type="button" class="block modal-block" id="done" value="동의 완료">
<input type="hidden" name="code" value="${code }">
<input type="hidden" name="state" value="${state }">
<!-- The Modal -->
<div id="privacy-myModals" class="modals">
	<!-- Modal content -->
	<div class="modals-content small-font">
		<span id="privacy-close_mod" class="close_mod">&times;</span>
		<div class="agreement-content">
			<h2 class="bold align-center">개인정보 보호 정책</h2>
			<br>
			<br>
			<h6 class="bold">개인정보 보호 정책</h6>
			<p>
			'이시컴퍼니'(이하 '회사')은 고객의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호에 관한 법률” 및 “개인정보보호법” 등의 관련 규정을 준수하고 있습니다.<br><br>
			회사는 고객이 제공하는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드리기 위하여 개인정보취급방침을 작성하였습니다.<br><br>
			회사는 고객이 회원가입 또는 회사가 제공하는 서비스 이용 시 서비스 이용약관 및 개인정보 수집 및 이용 안내에 대한 동의절차를 마련하여, 고객이 “동의”를 선택하면 개인정보 수집 및 이용에 동의한 것으로 보고 개인정보를 수집,이용합니다.
			</p>
			<h6 class="bold">제 1조 수집하는 개인정보의 항목 및 수집방법</h6>
			<p>
			회사는 회원가입, 고객상담, 각종 서비스 제공 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.<br>
			1. 서비스가 제공되는 플랫폼의 유형에 따라 아래와 같은 개인정보를 수집할 수 있습니다. 이때 아래 각 항에서 안내되는 정보 외에 다른 정보들은 일체 수집되지 않습니다.
			<br>&nbsp; ① '회사' 자체 플랫폼 서비스 수집 항목
			<br>&nbsp;&nbsp; - 전화번호, 서비스 이용기록, 접속 로그 및 인증일자, 결제기록, 서비스버전, 통신사정보, 단말기정보(모델명, OS버전, 기기고유식별번호, Mac Address 등)
			<br>&nbsp; ② 카카오톡 플랫폼 연동 서비스 수집항목
			<br>&nbsp;&nbsp; - 전화번호, 서비스 서비스 이용기록, 접속 로그 및 인증일자, 결제기록, 서비스버전, 통신사정보, 단말기 정보(모델명, OS버전, 기기고유식별번호, Mac Address 등), 카카오 회원번호, 카카오톡 닉네임, 카카오톡 프로필사진, 카카오톡 친구목록 및 친구의 프로필사진
			2. 아래 기재된 서비스를 이용하는 고객에 한하여 아래와 같은 정보들을 수집할 수 있습니다.
			<br>&nbsp; - 고객지원 서비스: 전화번호, 이름, SMS 수신 동의 여부
			<br>&nbsp; - 유료 서비스 이용 및 결제, 결제취소, 청약철회 요청: 오픈마켓 아이디, 대금결제 기록
			<br>&nbsp; - 이벤트 및 프로모션: 이름, 주소, 전화번호, 우편번호, 이메일
			<br>&nbsp; - 본인확인: 성명, 신분을 확인할 수 있는 증서
			3. 만14세 미만 아동의 회원가입 등 개인정보 수집 필요 시 법정대리인의 동의여부를 확인하기 위하여, 법정대리인의 성명, 연락처 등의 정보를 수집할 수 있습니다. 법정대리인이 동의하지 않는 경우 해당 정보는 파기됩니다.
			4. 회사는 고객이 회사의 홈페이지, 기타 회사가 제공하는 서비스 이용 시 이용기록, 접속로그, 접속IP정보, 결제기록 등 생성정보를 수집합니다.
			5. 회사는 홈페이지 회원가입, 서면양식, 회원정보 수정, 전화, 팩스, 고객응대 창구, 이벤트 응모, 서비스 내 수집 등의 방법으로 개인정보를 수집합니다.
			</p>
			<h6 class="bold">제 2조 개인정보의 수집 및 이용목적</h6>
			<p>
			회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.<br>
			1. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 콘텐츠 제공, 구매 및 요금 결제, 물품배송 또는 청구지 등 발송, 본인인증<br>
			2. 회원 관리<br>
			회원제 서비스 이용에 따른 본인확인, 개인식별, 불량회원의 부정 이용방지와 비인가 사용방지, 가입의사 확인, 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 추후 법정 대리인 본인확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달
			3. 마케팅 및 광고에 활용<br>
			신규 서비스 개발 및 맞춤 서비스 제공, 통계학적 특성에 따른 서비스 제공 및 광고 게재, 서비스의 유효성 확인, 이벤트 및 광고성 정보 제공, 접속빈도 파악, 회원의 서비스이용에 대한 통계
			4. 자동 친구 추가 및 자동 친구 등록 기능의 제공<br>
			회원의 전화번호 및 회원의 모바일, 테블릿 기기 내의 주소록에 저장된 제 3자의 전화번호를 수집 • 이용하여 자동 친구 추가 및 등록 기능 제공
			</p>
			<h6 class="bold">제 3조 개인정보의 보유 및 이용기간</h6>
			<p>
			1. 회사는 원칙적으로 고객이 회원가입 후 탈퇴 전까지 고객의 개인정보를 보관하며, 고객이 회원탈퇴를 하거나 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 다만 필요에 따라 부정이용의 방지를 위하여 회원탈퇴 후 1주 동안 개인정보를 보유할 수 있으며, 불필요시 혹은 이 기간이 경과한 후에는 고객의 개인정보가 완전히 삭제됩니다.<br>
			2. 상법, 전자상거래 등에서의 소비자보호에 관한 법률 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다. 이 경우 회사는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래와 같습니다.
			<br>&nbsp;① 대금결제 및 재화 등의 공급에 관한 기록: 5년 (전자상거래등에서의 소비자보호에 관한 법률)
			<br>&nbsp;② 소비자의 불만 또는 분쟁처리에 관한 기록: 3년 (전자상거래등에서의 소비자보호에 관한 법률)
			<br>&nbsp;③ 계약 또는 청약철회 등에 관한 기록: 5년 (전자상거래등에서의 소비자보호에 관한 법률)
			<br>&nbsp;④ 본인확인에 관한 기록: 6개월 (정보통신 이용촉진 및 정보보호 등에 관한 법률)
			<br>&nbsp;⑤ 전기통신역무를 이용한 사실에 관한 통신 또는 로그에 관한 기록: 3개월 (통신비밀보호법)
			<br>&nbsp;⑥ 국세 관련 서류 및 증빙자료 : 5년(국세기본법)
			</p>
			<h6 class="bold">제 4조 장기 미이용 회원 개인정보 처리</h6>
			<p>
			1. 회사는 관련 법령에 의거하여 장기 미이용 회원의 개인정보를 파기합니다. 장기 미이용 회원과 파기 방식은 아래와 같습니다.
			<br>&nbsp;① 장기 미이용 회원 : 고알레 서비스 마지막 접속 후 365일 동안 사용이 없는 회원
			<br>&nbsp;② 장기 미이용 회원 대상 정보 파기 안내 메일 발송 : 장기 미이용 회원으로 확인 된 당일, 7일 후, 14일 후 총 3회 개인정보 파기 안내 메일 발송 
			<br>&nbsp;③ 회원 정보 파기 : 마지막 안내 메일 발송 후 30일이 지난 시점까지도 사용이력이 없을 경우 최종확인 후 개인정보 파기
			</p>
			<h6 class="bold">제 5조 개인정보의 파기절차 및 방법</h6>
			<p>
			회사는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 파기절차 및 방법은 다음과 같습니다.<br>
			1. 파기절차
			<br>&nbsp; ① 고객이 회원가입 등을 위해 입력한 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조)일정 기간 저장된 후 파기됩니다. 동 개인정보는 법률에 의한 경우가 아니고서는 보유되는 이외의 다른 목적으로 이용되지 않습니다.
			2. 파기방법
			<br>&nbsp; ① 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.
			<br>&nbsp; ② 전자적 파일 형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.
			</p>
			<h6 class="bold">제 6조 개인정보 제공</h6>
			<p>
			1. 회사는 회원의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.
			<br>&nbsp;① 회원이 사전에 동의한 경우
			<br>&nbsp;② 법령의 규정에 의거하여 자료 제공이 강제되는 경우 또는 적법한 절차에 의한 법원, 수사기관, 기타 행정기관의 요청이 있는 경우
			</p>
			<h6 class="bold">제 7조 회원 및 법정대리인의 권리와 그 행사방법</h6>
			<p>
			1. 회원 혹은 만 14세 미만 아동의 개인정보 조회 • 수정을 위해서는 ‘개인정보변경’(또는 ‘회원정보수정’ 등)을 가입 해지(동의철회)를 위해서는 “회원탈퇴”를 클릭 하여 본인 확인 절차를 거치신 후 직접 열람, 정정 또는 탈퇴가 가능합니다.<br>
			2. 회원은 본인의 개인정보에 대한 정정 또는 삭제를 요구하는 경우 회사는 본인 여부를 확인한 후 지체 없이 필요한 조치를 취합니다.<br>
			3. 회사는 고객 혹은 법정 대리인의 요청에 의해 해지 또는 삭제된 개인정보는 “제 3조. 개인정보의 보유 및 이용기간” 에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.
			</p>
			<h6 class="bold">제 8조 개인정보의 기술적 / 관리적 보호 대책</h6>
			<p>
			회사는 고객의 개인정보를 취급함에 있어 개인정보가 분실, 도난, 유출, 변조, 훼손되지 않고 안전성을 확보하기 위하여 다음과 같은 기술적 및 관리적 대책을 강구하고 있습니다.<br>
			회사는 해킹이나 컴퓨터 바이러스 등에 의해 회원의 개인정보가 유출되거나 훼손되는 것을 막기 위해 최선을 다하고 있습니다.<br>
			개인정보의 훼손에 대비해서 자료를 수시로 백업하고 있고 최신 백신프로그램을 이용하여 고객의 개인정보나 자료가 유출되거나 손상되지 않도록 방지하고 있으며, 암호 알고리즘 등을 통하여 네트워크상에서 개인정보를 안전하게 전송할 수 있도록 하고 있습니다. 그리고 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있으며, 기타 시스템적으로 안정성을 확보하기 위한 가능한 모든 기술적 장치를 갖추려 노력하고 있습니다.<br>
			회사는 고객의 개인정보 관련 취급을 담당자에 한정시키고 있고 이를 위한 별도의 비밀번호를 부여하여 정기적으로 갱신하고 있으며, 담당자에 대한 수시 교육을 통하여 회사의 개인정보 처리방침의 준수를 항상 강조하고 있습니다. 그리고 사내 전담기구 등을 통하여 회사의 개인정보 처리방침의 이행사항 및 담당자의 준수여부를 확인하여 문제가 발견될 경우 즉시 수정하고 바로 잡을 수 있도록 노력하고 있습니다.<br>
			단, 회원 본인의 부주의나 인터넷상의 문제로 ID와 비밀번호 등 개인정보가 유출해 발생한 문제에 대해 회사는 일체의 책임을 지지 않습니다.
			</p>
			<h6 class="bold">제 9조 권익 침해 구제 방법</h6>
			<p>
			고객은 회사의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보관리책임자 혹은 담당부서로 신고하실 수 있습니다. 회사는 고객의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다.<br>
			기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.<br>
			1. 한국인터넷진흥원 개인정보침해신고센터 http://privacy.kisa.or.kr (국번없이 118)<br>
			2. 정보보호마크인증위원회 http://www.eprivacy.or.kr (02-550-9531~2)<br>
			3. 경찰청 사이버테러대응센터 http://www.ctrc.go.kr (국번없이 182)
			</p>
			<h6 class="bold">제 10조 개인정보 처리 방침 변경</h6>
			<p>
			개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경 내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.
			</p>
			<h6 class="bold">제 11조 개인정보 보호 책임자</h6>
			<p>
			회사는 이용자의 개인정보 관련 문의사항 및 불만 처리 등을 위하여 아래와 같이 개인정보 보호 책임자를 지정하고 있습니다.<br>
			개인정보 보호 책임자
			<br>&nbsp; 이름 : 주성환
			<br>&nbsp; 직책 : CEO
			<br>&nbsp; 전화 : 010-9149-4372
			</p>
			<button class="block modal-block" id="privacy-cancel-btn">
				닫기
			</button>
		</div>
	</div>
</div>
<!-- The Modal -->
<div id="service-myModals" class="modals">
	<!-- Modal content -->
	<div class="modals-content small-font">
		<span id="service-close_mod" class="close_mod">&times;</span>
		<div class="agreement-content">
			<h2 class="bold align-center">이용약관</h2>
			<br>
			<br>
			<h6 class="bold">제 1조 목적</h6>
			<p>
				1. 본 약관은 (주)이시컴퍼니(이하 '회사')가 제공하는 'Gentlepro(젠틀프로)'(이하 '서비스')를 이용하는데 필요한 권리, 의무 및 책임 사항, 이용조건 및 절차 등 기본적인 사항을 규정하고 있습니다. 이용자 분들께서는
				주의 깊게 읽어주시기 바랍니다."<br>
				2. '서비스'는 회사가 제공하는 'Gentlepro' 브랜드를 사용하는 '서비스'를 말합니다. 
			</p>
			<br>
			<h6 class="bold">제 2조 정의</h6>
			<p>
				1. '회사'란 'Gentlepro 서비스'(이하 '서비스')를 운영하고 있는 주식회사 '이시컴퍼니'를 의미합니다.
				<br>
				2. '서비스'란 '회사'가 제공하는 서비스를 말하며, 이는 유/무선 단말기의 종류와 무관하게 제공되는 모든 서비스를 의미하며, 회사가 공개한 API를 이용하여 제 3자가 제공하는 서비를 포함합니다.
				<br>
				3. '회원'이란 본 약관에 동의하고 개인정보를 제공하여 회원 등록을 한자로서, 회사로부터 ID를 부여받고 회사의 방침에 따라 회사가 제공하는 정보와 '서비스'를 이용할 수 있는 자를 말합니다.
				<br>
				4. '비회원'이란 '회원'이 아니면서 '회사'가 제공하는 제한된 '서비스'를 이용하는 자를 말합니다.
				<br>
				5. '이용자'란 회원과 비회원 모두를 의미합니다.
				<br>
				6. '게시물'이란 '회원'이 회사가 제공하는 서비스를 활용하여 게시 또는 등록하는 부호, 문자, 이미지, 파일 등을 말합니다.
			</p>
			<br>
			<h6 class="bold">제 3조 신원정보 등의 제공</h6>
			<p>
				1. '회사'는 이 약관의 내용, 상호, 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호, 모사전송번호, 전자우편주소, 사업자등록번호, 통신판매이버 신고번호 및 개인정보 관리 책임자등을
				'회원'이 쉽게 알 수 있도록 온라인 '서비스' '나의 페이지' 화면에 게시합니다.
			</p>
			<br>
			<h6 class="bold">제 4조 약관의 게시와 개정</h6>
			<p>
				1. '회사'는 약관의 규제에 관한 법률, 위치정보의 보호 및 이용 등에 관한 법률, 개인정보 보호법, 전자상거래 등에서의 소비자 보호에 관한 법률, 정보통신망 이용촉진 및 정보보호 등에 관한 법률등 관계 법령에 위배되지 않는
				범위 내에서 이 약관을 개정할 수 있습니다.
				<br>
				2. '회사'가 약관을 개정할 경우에는 적용일자 및 개정 사유를 명시하여 현행 약관과 함께 '서비스' 공지사항 화면에 그 적용일자 7일 이전부터 적용일 후 상당한 기간동안 공지하고, 기존 회원에게는 개정약관을 전자우편 주소로 발송합니다.
				<br>
				3. 공지된 적용일자 이후에 회원이 '회사'의 '서비스'를 계속 이용하는 경우에는 개정된 약관에 동의하는 것으로 봅니다. 개정된 약관에 동의하지 아니하는 회원은 언제든지 자유롭게 '서비스' 이용 계약을 해지할 수 있습니다.
			</p>
			<br>
			<h6 class="bold">제 5조 약관의 해석</h6>
			<p>
				1. 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 약관의 규제에 관한 법률, 위치정보의 보호 및 이용 등에 관한 법률, 개인정보 보호법, 전자상거래 등에서의 소비자 보호에 관한 법률, 정보통신망 이용촉진 및 정보보호 등에 관한 법률등 관계 법령
				, 기타 관계법령 또는 상관례에 따릅니다.
			</p>
			<br>
			<h6 class="bold">제 6조 회원가입/변경 및 탈퇴에 따른 자격상실</h6>
			<p>
				1. 회원가입은 '비회원'이 약관의 내용에 대하여 동의를 하고 '회사'가 정한 가입 절차에 따라 제공된 회원 정보를 '서비스'에 등록함으로써 체결됩니다.
				<br>
				2. '회사'는 상기 '비회원'의 회원 가입 신청에 대하여 가입 승낙함을 원칙으로 합니다. 다만, '회사'는 다음 각 호에 해당하는 신청에 대하여는 회원 자격을 회수 할 수 있습니다.<br>
				&nbsp; ① 가입 신청자가 이 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우 <br>
				&nbsp; ② 가입정보가 중복되는 경우<br>
				&nbsp; ③ 허위의 정보를 기재하거나, 회사가 제시하는 내용을 기재하지 않은 경우<br>
				&nbsp; ④ 비회원의 귀책 사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하며 신청하는 경우<br>
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
				13. '회사'가 회원자격을 제한정지시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 '회사'는 회원자격을 상실시킬 수 있습니다.
				<br>
				14. '회사'가 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 '회원'에게 이를 통지하고, 회원등록 말소 전 소명할 기회를 부여합니다.
			</p>
			<br>
			<h6 class="bold">제 7조 '서비스'의 이용/변경 및 제한/정지</h6>
			<p>
			1. '회사'는 서비스(개별 서비스 포함)를 변경하여야 하는 상당한 이유가 있는 경우 변경될 서비스의 내용 및 제공일자를 회원에게 통지하고 서비스를 변경하여 제공할 수 있습니다.
			<br>
			&nbsp; ① "서비스"의 내용, 이용방법, 이용시간에 대하여 변경이 있는 경우에는 변경사유, 변경될 서비스의 내용 및 제공일자 등은 그 변경 전 7일 이상 해당 서비스 초기화면에 게시하여야 합니다.<br>
			&nbsp; ② "'회사'"는 무료로 제공되는 서비스의 일부 또는 전부를 '회사'의 정책 및 운영의 필요상 수정, 중단, 변경할 수 있으며, 이에 대하여 관련법에 특별한 규정이 없는 한 "회원"에게 별도의 보상을 하지 않습니다.<br>
			2. '회사'는 회원의 ID가 다음 각 호에 해당되는 경우 회원과 협의하여 회원의 ID를 변경하거나 또는 회원의 서비스 이용을 일정기간 중단시킬 수 있습니다. 
			① ID가 회원의 주민등록번호 등으로 등록되어 사생활 침해가 우려되는 경우 
			② 타인에게 혐오감을 주거나 미풍양속에 어긋나는 경우 
			③ ID가 타회원과 중복되어 서비스 제공이 곤란한 경우 
			④ 기타 합리적인 사유가 있는 경우 
			3. '회사'는 다음 각호의 사유에 해당되는 경우 서비스의 전부 또는 일부를 제한하거나 중단할 수 있습니다. 이 경우 '회사'는 제한 또는 중단사유를 사전에 공지합니다. 다만, '회사'가 통제할 수 없는 사유로 인한 경우에는 사후에 공지합니다. 
			<br>&nbsp; ① 서비스용 설비의 확장, 보수 등 공사로 인한 부득이한 경우 
			<br>&nbsp; ② '회사'가 통제하기 곤란한 사정으로 불가피하게 서비스 제한 또는 중단이 필요한 경우 
			<br>&nbsp; ③ 회원이 '회사'의 영업활동을 방해하는 경우 
			<br>&nbsp; ④ 정전, 제반 설비의 장애 또는 서비스 이용량의 폭주 등으로 정상적인 서비스 이용에 지장이 있는 경우 
			<br>&nbsp; ⑤ 새로운 서비스로의 교체, 개별 서비스를 '회사'가 운영하는 다른 사이트로 이전하는 등 '회사'의 서비스 운영정책상 서비스의 제한 또는 중단이 필요하다고 판단하는 경우 
			<br>&nbsp; ⑥ 제휴업체(BP)와의 계약종료 등과 같은 '회사'의 제반사정으로 서비스를 유지할 수 없는 경우 
			<br>&nbsp; ⑦ 기타 천재지변, 국가비상사태 등 불가항력적 사유가 있는 경우 
			4. '회사'는 비실명인 회원, 만 14세 미만 회원, 청소년보호법상의 보호대상인 회원, 만 19세 미만의 회원, 외국인 회원, 법인 및 단체 회원, 폰번호 회원 등 회원 별로 서비스의 이용을 제한할 수 있으며, 이러한 서비스 제한에 대한 사항은 개별 서비스에서 별도로 안내 또는 공지합니다. 
			5. '회사'는 '회사'의 귀책사유로 서비스가 중단됨으로 인하여 회원이 이미 결제한 유료서비스를 이용할 수 없을 경우 회원에게 결제금액을 보상하기로 하되, 구체적인 보상 방법은 유료서비스 이용약관에서 정한 바에 따릅니다.
			</p>
			<h6 class="bold">제 8조 면책 조항</h6>
			<p>
			1. '회사'는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면책됩니다.<br>
			2. '회사'는 회원의 귀책사유로 인한 서비스의 이용장애에 대하여 책임을 지지 않습니다. <br>
			3. '회사'는 고의 또는 과실이 없는 한 회원이 '회사'에서 제공하는 서비스로부터 기대되는 이익을 얻지 못하였거나 서비스에 게시된 게시물 등에 대한 취사선택 또는 이용으로 발생하는 손해 등에 대해서는 책임을 지지 않습니다. 또한, '회사'는 회원이 사이트에 게재한 게시물 등의 정확성 등 내용에 대하여는 책임을 지지 않습니다.<br> 
			4. '회사'는 회원 상호간 또는 회원과 제3자 상호간에 서비스를 매개로 발생한 분쟁에 대해서는 개입할 의무가 없으며, '회사'의 고의 또는 과실이 없는 한 이로 인한 손해를 배상할 책임도 없습니다.<br>
			</p>
			<h6 class="bold">제 9조 '회사'의 의무</h6>
			<p>
			1. '회사'는 안정적인 서비스의 제공을 위하여, 설비에 장애가 발생하거나 손상된 때에는 부득이한 사유가 없는 한 지체없이 이를 수리 또는 복구합니다. <br>
			2. '회사'는 회원의 회원정보 보호하기 위하여 보안시스템을 구축ㆍ운영하며, "개인정보처리방침"을 공지하고 준수합니다. 또한, '회사'는 "개인정보처리방침" 따라 회원정보를 취급함에 있어 안정성 확보에 필요한 기술적ㆍ관리적 대책을 수립ㆍ운영합니다.<br>
			3. '회사'는 서비스와 관련한 회원의 불만사항이 접수되는 경우 이를 신속히 처리하여야 하며, 신속한 처리가 곤란한 경우 그 사유와 처리 일정을 서비스 화면에 게재하거나 메일 등을 통하여 회원에게 통지합니다.<br>
			</p>
			<h6 class="bold">제 10조 회원의 의무</h6>
			<p>
			1. 회원은 관계법령, 약관, 서비스 이용안내 및 서비스상에 공지한 주의사항, '회사'가 서비스 이용과 관련하여 회원에게 통지하는 사항 등을 준수하여야 하며, 기타 '회사'의 업무에 방해되는 행위를 하여서는 아니 됩니다.<br> 
			2. 회원은 '회사'의 명시적 동의가 없는 한 회원의 서비스 이용권한을 타인에게 양도, 증여 또는 이용하게 하거나 이를 담보로 제공할 수 없습니다.<br> 
			3. 회원은 서비스 이용시 다음 각 호의 행위를 하여서는 안됩니다. 
			<br>&nbsp; ① 서비스 이용신청 또는 변경 시 허위사실을 기재하거나, 다른 사람의 개인정보를 이용하는 행위 
			<br>&nbsp; ② 서비스 이용 중 습득한 게시물 등 또는 정보를 상업적 목적으로 이용하거나 출판, 방송 등을 통하여 제3자에 노출시키는 행위. 다만, 공익 목적을 위하여 필요한 경우에는 사전에 '회사'의 동의를 얻어야 합니다. 
			<br>&nbsp; ③ 서비스를 이용하여 상품 또는 용역을 판매하는 영업활동 등의 상행위(해킹, 광고를 통한 수익, 음란사이트를 통한 상업행위, 상용소프트웨어 불법배포 등 포함). 다만, '회사'가 공식적으로 상행위를 인정한 경우에는 그러하지 않습니다. 
			<br>&nbsp; ④ '회사'의 서비스 운영을 저해하거나 다른 회원의 서비스 이용을 방해하는 행위 및 '회사'의 운영진, 직원 또는 관계자를 사칭하는 행위 
			</p>
			<h6 class="bold">제 11조 개인정보</h6>
			<p>
			1. '회사'는 적법하고 공정한 수단에 의하여 이용계약의 성립 및 이행에 필요한 최소한의 범위 내에서 "개인정보처리방침"에 따라 이용고객의 회원정보를 수집합니다.<br> 
			2. '회사'의 "개인정보처리방침"은 '회사'에 링크된 다른 웹사이트('회사'가 운영하지 않는 웹사이트를 말합니다. 이하 같습니다)에서는 적용되지 않습니다. <br>
			3. '회사'는 전기통신사업법, 통신비밀보호법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 개인정보 보호법 등 관계법령에 따라 행정기관이나 수사기관 등에서 회원의 회원정보의 열람이나 제출을 요청하는 경우에는 이를 제공할 수 있습니다.<br>
			4. '회사'는 회원의 귀책사유로 인해 노출된 회원정보에 대해서 일체의 책임을 부담하지 않습니다. <br>
			5. '회사'는 회원정보의 취급 및 관리, 서비스 운영 등의 업무를 스스로 수행함을 원칙으로 하나, 필요한 경우 이러한 업무의 일부 또는 전부를 '회사'가 선정한 '회사'에 위탁할 수 있으며, 회원정보의 취급 및 관리, 서비스 운영 등에 관한 업무를 위탁하는 경우에는 "개인정보처리방침"에 공지합니다.<br> 
			6. 회원이 이용계약 체결과정에서 '회사'에 제공한 회원정보에 대한 이용 또는 제공에 대한 동의를 철회하고자 하는 경우에는 "개인정보처리방침"에서 정한 바에 따르며, 회원이 이러한 동의를 철회하는 경우 서비스 이용계약은 자동으로 해지됩니다.<br>
			</p>
			<h6 class="bold">제 12조 서비스의 이용시간</h6>
			<p>
			1. '회사'는 회원의 이용신청을 승낙한 때부터 서비스를 개시합니다. 다만, 일부 서비스의 경우에는 지정된 일자부터 서비스를 개시합니다.<br>
			2. '회사'의 업무상 또는 기술상의 장애로 인하여 서비스를 개시하지 못하는 경우에는 서비스에 공지하거나 회원에게 이를 통지합니다. <br>
			3. 서비스의 이용은 연중무휴 1일 24시간을 원칙으로 합니다. 다만, 시스템 점검, 증설과 교체 및 고장 등의 이유로 '회사'가 정한 기간에는 서비스가 일시 중지될 수 있습니다. 이러한 경우 '회사'는 사전 또는 사후에 이를 공지합니다.<br>
			4. '회사'는 서비스를 일정범위로 분할하여 각 범위별로 이용 가능한 시간을 별도로 정할 수 있으며 이 경우 그 내용을 공지합니다. <br>
			5. '회사'는 서비스내의 개별 서비스에 대한 별도의 약관을 둘 수 있으며, 개별 서비스에서 별도로 적용되는 약관에 대한 동의는 회원이 개별 서비스를 최초로 이용할 경우 별도의 동의절차를 거치게 됩니다.<br>
			</p>
			<h6 class="bold">제 13조 정보 제공 및 광고 게재</h6>
			<p>
			1. '회사'는 서비스를 운영함에 있어 각종 정보를 서비스 화면에 게재하거나 메일, 쪽지, SMS등의 방법으로 회원에게 제공할 수 있습니다.<br>
			2. '회사'는 서비스의 운영과 관련하여 광고 등을 서비스 화면에 게재하거나, 메일, 쪽지, SMS등을 통하여 발송할 수 있습니다. 다만, '회사'는 회원에게 메일, 쪽지, SMS 등의 발송을 하는 경우 수신 동의 여부를 확인하여, 수신 동의한 회원에 한하여 이를 발송합니다. <br>
			3. 회원이 서비스상에 게재되어 있는 광고를 이용하거나 서비스를 통한 광고주의 판촉활동에 참여하는 등의 방법으로 교신 또는 거래를 하는 것은 전적으로 회원과 광고주간의 문제입니다. 만약, 회원과 광고주간에 문제가 발생할 경우 회원과 광고주가 직접 해결하여야 하며, 이와 관련하여 '회사'는 고의 또는 과실이 없는 이상 어떠한 책임도 지지 않습니다.<br>
			</p>
			<h6 class="bold">제 14조 회원의 게시물에 대한 책임</h6>
			<p>
			1. '회사'는 회원이 서비스에 게시하거나 전달하는 게시물이 다음 각호에 해당된다고 판단되는 경우 사전 통지 없이 해당 게시물에 대한 임시조치, 삭제 또는 게시 거부 등 필요한 조치를 할 수 있습니다. 다만, '회사'가 모든 게시물을 검토할 의무를 가지는 것은 아닙니다. 
			<br>&nbsp; ① '회사', 다른 회원 또는 제3자를 비방하거나 명예를 손상시키는 내용인 경우
			<br>&nbsp; ② 공공질서 및 공서양속에 위반되는 내용인 경우 
			<br>&nbsp; ③ 게시물의 내용이 범죄적 행위에 결부된다고 판단되는 경우 
			<br>&nbsp; ④ '회사'의 저작권, 제3자의 저작권 등 기타 타인의 권리를 침해하는 내용인 경우 
			<br>&nbsp; ⑤ 법령을 위반하거나 타인의 권리를 침해하는 방식으로 정치적, 종교적 분쟁을 야기하는 내용인 경우 
			<br>&nbsp; ⑥ 불필요하거나 승인되지 않은 광고, 판촉물을 게재하는 경우 
			<br>&nbsp; ⑦ 타인의 개인정보를 도용하여 작성한 내용이거나, 타인이 입력한 정보를 무단으로 위·변조한 내용인 경우 
			<br>&nbsp; ⑧ 동일한 내용을 중복하여 다수 게시하는 등 게시의 목적에 어긋나는 경우 
			<br>&nbsp; ⑨ 정보통신망 이용촉진 및 정보보호 등에 관한 법률 또는 청소년 보호법에 따라 청소년유해매체물로 지정예고되거나 지정된 경우 및 이에 준하는 게시물이라고 판단되는 경우 10. 기타 관계법령 및 '회사'의 개별 서비스별 세부이용지침 등에 위반된다고 판단되는 내용인 경우 
			2. '회사'는 개별 서비스별로 게시물과 관련된 세부이용지침을 별도로 정하여 시행할 수 있으며, 회원은 그 지침에 따라 게시물(회원간 전달 포함)을 게재하여야 합니다.
			</p>
			<h6 class="bold">제 15조 게시물의 저작권</h6>
			<p>
			1. 회원이 서비스에 게시한 게시물이나 실시간 영상, 기타 저작물(이하 “게시물 등”)의 저작권은 저작권법에 의해 보호를 받습니다. '회사'가 작성한 저작물에 대한 저작권은 '회사'에 귀속합니다.<br>
			2. 회원은 자신의 게시물 등을 '회사'가 국내ㆍ외에서 다음 각호의 목적으로 사용하는 것을 허락합니다. 
			<br>&nbsp; ① 서비스(제3자가 운영하는 사이트 또는 미디어의 일정 영역 내에 입점하여 서비스가 제공되는 경우를 포함합니다)내에서 게시물 등의 복제, 전송, 전시 및 우수 게시물 등을 서비스 화면에 노출하기 위하여 게시물 등의 크기를 변환하거나 단순화하는 등의 방식으로 수정하는 것
			<br>&nbsp; ② '회사'가 운영하는 다른 사이트 또는 다른 '회사'가 운영하는 사이트에서 게시물 등을 복제, 전송 또는 전시하는 것. 다만, 회원이 이에 동의하지 아니한 경우에는 그러하지 않습니다.
			<br>&nbsp; ③ '회사'의 서비스를 홍보하기 위한 목적으로 미디어, 통신사 등에 게시물 등의 전부 또는 일부를 보도, 방영하게 하는 것. 
			3. '회사'는 전항 각호의 기재된 목적 이외에 상업적 목적으로 게시물을 사용할 수 있습니다.<br>
			4. 회원이 서비스에 게시물 등을 게재하는 것은 다른 회원이 게시물 등을 서비스 내에서 사용하거나 '회사'가 검색결과로 사용하는 것을 허락한 것으로 봅니다. 다만, 회원은 개별 서비스내의 관리기능을 통하여 게시물 등의 비공개, 검색결과 제외 등의 조치를 취할 수 있습니다.<br>
			5. 회원이 이용계약을 해지하거나 제22조 제3항에 의해 이용계약이 해지되는 경우 본인 계정에 기록된 게시물 등은 삭제됩니다. 다만, 제3자에 의하여 스크랩, 펌, 담기 등으로 다시 게시된 게시물 등 및 클럽, 공유게시판, 댓글 등 공용 서비스 내에 게시된 게시물 등 다른 회원의 정상적인 서비스 이용에 필요한 게시물 등은 삭제되지 않습니다.<br>
			6. '회사'는 서비스의 운영정책상 게시물 등의 내용을 변경하지 아니하고 게시물 등의 게재위치를 변경ㆍ이전할 수 있으며, 게시물 등을 이전ㆍ변경하는 경우에는 사전에 공지합니다.<br>
			7. 회원이 자신이 게시한 게시물 등(이하 “원게시물”이라 합니다)을 서비스내의 개별 서비스에 재게재한 경우, 재게재된 게시물 등은 원게시물과 다른 게시물 등으로 취급되며, 이 경우 원게시물이 삭제되더라도 재게재된 게시물 등은 제5항 단서의 적용을 받습니다. 서비스에 게시되는 모든 콘텐츠의 저작권은 콘텐트 제작 원작자에 있습니다. 회원이 타 회원의 콘텐츠를 사용할 때는 그 원작자에게 허가를 받아야 하며 '회사'는 저작권법 위반에 대한 어떠한 책임도 지지않습니다.<br>
			8. 회원이 제 3자의 저작권 등 관련 법률을 위반하여 '회사'가 소송 등을 당하는 경우, 회원은 본인의 책임으로 '회사'를 면책하게 하여야 한다.
			</p>
			<h6 class="bold">제 16조 회원에 대한 통지</h6>
			<p>
			1. '회사'는 회원의 서비스 이용에 필요한 권리 및 의무 등에 관한 사항을 '회사'가 발급한 또는 회원이 지정한 메일, SMS, 서비스 내 공지 등으로 통지할 수 있습니다.<br> 
			2. '회사'는 불특정 다수 회원에 대한 통지의 경우 서비스 내에 게시함으로써 개별 통지에 갈음할 수 있습니다.<br>
			</p>
			<h6 class="bold">제 17조 손해배상</h6>
			<p>
			1. '회사'는 서비스로 인하여 회원에게 손해가 발생한 경우 그러한 손해가 '회사'의 고의 또는 과실에 의해 발생한 경우에 한하여 책임을 부담하며, 그 책임의 범위는 통상손해에 한합니다. <br> 
			2. '회사'의 고의 또는 과실로 인하여 다음 각호의 사유가 발생하고 이로 인하여 회원에게 손해가 발생한 경우 '회사'는 다음 각호에서 정한 바에 따라 보상합니다. 
			<br>&nbsp; ① 사전 예고없이 전체 서비스가 일시 중단된 경우, 기간제 아이템의 사용기간을 장애지속 시간의 3배에 해당하는 시간만큼 사용기간을 연장하는 방식으로 보상합니다. 다만, '회사'가 사전에 시스템 점검, 증설, 긴급장애 등의 사유로 인하여 서비스 일시 중지를 공지한 경우에는 그러하지 않습니다. 
			<br>&nbsp; ② 회원이 구매한 컨텐츠의 손상, 훼손, 불량 등이 발생한 경우, 구매 컨텐츠의 복원 또는 환불 방식으로 보상합니다. 
			3. 회원이 서비스를 이용하는 과정에서 행한 불법행위 또는 이 약관의 규정을 위반함으로 인하여 '회사'에 손해가 발생하거나 제3자로부터 '회사'가 손해배상 청구 또는 각종 이의제기를 받는 경우, 당해 회원은 자신의 책임과 비용으로 '회사'를 면책시켜야 하며, '회사'가 면책되지 못한 경우 당해 회원은 그로 인하여 '회사'에 발생하는 모든 손해를 배상하여야 합니다.<br> 
			
			</p>
			<h6 class="bold">제 18조 재판권 및 준거법</h6>
			<p>
			1. 회원은 게시물 등과 관련된 저작권 침해, 명예훼손 또는 개인정보 및 서비스 이용과 관련된 사항에 관한 문제제기 또는 문제해결은 '회사'가 운영하는 문의사항 페이지를 통하여 처리할 수 있습니다.<br> 
			2. '회사'와 회원 간에 서비스 이용과 관련하여 발생한 분쟁에 대한 소송이 제기되는 경우 '회사'의 주소지를 관할하는 법원을 그 관할법원으로 합니다.
			</p>
			<br>
			<br>
			<h6 class="bold">부칙</h6>
			<p>
			이 약관은 2020년 12월 1일 부터 적용됩니다
			</p>
			<button class="block modal-block" id="service-cancel-btn">
				닫기
			</button>
		</div>
	</div>
</div>
<!-- The Modal -->
<div id="toast" class="submit_toast">

  <!-- Modal content -->
  	<div id="submit_toast_content" class="submit_toast_content">
		<div class="row centered margin-btm centered-padding">
			<span id="club_msg">필수 약관에 동의하셔야 서비스 이용 가능합니다.</span>
		</div>
		<div class="row margin-top centered">
			<button class="alert-btn">확인</button>
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function(){
		$('#service').click(function(){
			$('#service-myModals').css('display','block');
		});
		$('#service-close_mod, #service-cancel-btn').click(function(){
			$('#service-myModals').css('display','none');
		});
		$('#privacy').click(function(){
			$('#privacy-myModals').css('display','block');
		});
		$('#privacy-close_mod, #privacy-cancel-btn').click(function(){
			$('#privacy-myModals').css('display','none');
		});
		$('#all').click(function(){
			if ($('input:checkbox[name=all]').is(':checked')==true){
				$('input:checkbox').prop('checked',true);
			}else{
				$('input:checkbox').prop('checked',false);
			}
		});
		
		$('#done').click(function(e){
			e.preventDefault();
			if($('input:checkbox[name=service]').is(':checked')==false ||$('input:checkbox[name=privacy]').is(':checked')==false){
				$('#toast').css('display','block');
				$("#submit_toast_content").click(function(){
					$('#toast').css('display','none');
				});
				return false;
			}
			console.log('loginType : '+${loginType});
			$.ajax({
				url:'insertMember.do',
				type:'post',
				data:
					{
					marketing: $('input:checkbox[name=marketing]:checked').val()
				},
				dataType:'json',
	            contentType: false,
				cache:false,
				timeout:30000,
				success:function(data){
					if(data.result=="success"){
						$("#club_msg").text("가입 완료");
						$("#toast").css("display","block");
						$(".alert-btn").click(function(){
							let str;
							if(${not empty state}){
								
								str='${state}'.split('-');
								
							}
							if(${loginType==1 || loginType ==2}){
								location.href='${pageContext.request.contextPath}/main/main.do';
							}else if(${loginType==3 || loginType ==4}){
								location.href='${pageContext.request.contextPath}/club/inviteMember.do?club_num='+str[0]+'&nickname='+str[1];
							}else{
								location.href='${pageContext.request.contextPath}/main/voteForm.do?match_num='+str[0]+'&club_num='+str[1]+'&isMain='+str[2];
							}
						});
						
					}
					if(data.result=="errors"){
						
						$("#club_msg").text("가입 실패. 잠시 후 다시 시도하세요.");
						$("#toast").css("display","block");
						$('.alert-btn').click(function(){
							$("#toast").css("display","none");
						});
						$(window).click(function(){
							$("#toast").css("display","none");
						});
						return false;
					}
					
				},
				error:function(){
					alert('네트워크 오류 발생');
					return false;
				}
			});
			
		});
		
	});
</script>