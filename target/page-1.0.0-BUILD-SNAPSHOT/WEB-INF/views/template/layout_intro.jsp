<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" />
<meta name="naver-site-verification" content="5deee65b5c8cbc143af6b0f06b83ee7e886bfda4" />
<meta property="og:title" content="Gentlepro:축구/풋살 매칭 플랫폼">
<meta property="og:image" content="https://gentlepro.net/favicon-96x96.png">
<meta property="og:description" content="아마추어 축구/풋살팀 회원 관리, 매칭 서비스">
<meta name="description" content="우리 축구/풋살팀을 이제 간편하게 관리하자!" />
<meta name="appleid-signin-client-id" content="com.gentlepro.services">
<meta name="appleid-signin-redirect-uri" content="https://gentlepro.net/member/appleLogin.do">
<meta name="appleid-signin-scope" content="name email">
<meta name="appleid-signin-state" content="user authentication request">
<meta name="appleid-signin-nonce" content="nonce">
<meta name="appleid-signin-use-popup" content="true">
<link rel="canonical" href="https://gentlepro.net"> 
<title><tiles:getAsString name="title"/></title>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-6W9GZKN1FV"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-6W9GZKN1FV');
</script>
<!-- Google Adsense -->
<script data-ad-client="ca-pub-8355155789819718" async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/layout.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Encode+Sans+Semi+Condensed:wght@900&display=swap" rel="stylesheet">
<!-- Google icon -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<!-- favicon -->
<link rel="apple-touch-icon" sizes="57x57" href="/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60" href="/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72" href="/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76" href="/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114" href="/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120" href="/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144" href="/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152" href="/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"  href="/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96" href="/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
<link rel="manifest" href="/manifest.json">
<meta name="msapplication-TileColor" content="transparent">
<meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">
<script src="https://kit.fontawesome.com/154da1ea0f.js" ></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=32776969383e4a77d92f6e18dd233bc5&libraries=services"></script>
</head>
<body class="intro_bd">
<div id="main">
	<div id="main_header">
		<tiles:insertAttribute name="header"/>
	</div>
	<div id="main_body">
		<tiles:insertAttribute name="body"/>
	</div>
	<div id="main_footer">
		<tiles:insertAttribute name="footer"/>
	</div>
</div>
<!-- Compiled and minified JavaScript -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<script type="text/javascript">
function back() {
	var userAgent=navigator.userAgent.toLowerCase();

	if (userAgent.indexOf('android')>-1) {
		history.go(-1);
	}else {
		location.href=document.referrer;
	} 

};

$(function(){
	var title='${title}';
	if(title.indexOf('소개')!=-1){
		$('#main_header').addClass('green-bg');
	}

});



</script>
</body>
</html>




