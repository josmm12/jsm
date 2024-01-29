<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 | Starbucks Korea</title>
    <!-- 파피콘 -->
    <link rel="icon" href="./images/favicon.ico">
    
    <!-- reset.css -->
    <link rel="stylesheet" href="./css/reset.css">
    
    <!-- 구글 나눔고딕-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

    <!-- 매트리얼 아이콘 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    
    <link rel="stylesheet" href="./css/main.css">   
    <link rel="stylesheet" href="./css/notice.css">
        
    <script defer src="./js/jquery-3.7.1.min.js"></script>
    <!-- lodash -->
    <script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>
    
    <!-- gsap -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/gsap.min.js"></script>
    <!-- gsap_scrolltoplugin -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/ScrollToPlugin.min.js"></script>

    <!--Swiper-->
    <link rel="stylesheet" href="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>
</head>
<body>
	<header>
		<%@ include file="./header.jsp" %>
	</header>
	
	<div class="inner log_bg">
		<div class="log_box_wa">
			로그인
		</div>
		<form class="fologin">
			<p class="logtext">	
				<span class="welco">Welcome!</span>
				<span class="top_text">스타벅스 코리아에 오신 것을 환영합니다.</span>
			</p>
		<div class="log_box">
			<div class="log_box_id">
				<input class="log_id" type="text" placeholder="아이디를 입력해 주세요.">
			</div>	
			<div class="log_box_pw">
				<input class="log_pw" type="password" placeholder="비밀번호를 입력해 주세요.">
			</div>
		</div>	
		</form>
	</div>
</body>
</html>