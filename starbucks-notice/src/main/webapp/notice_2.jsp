<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.lang.Exception, java.sql.SQLException" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Starbucks Korea Coffee</title>
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

    <script defer src="./js/main.js"></script>    
</head>

<body>
    <header>
		<%@ include file="./header.jsp" %>
	</header>
	
	  <!-- notice list  -->
        <section>
        	<div class="inner sub_tit_wrap">
                <div class="sub_tit_inner">
                    <h2><img src="https://www.starbucks.co.kr/common/img/whatsnew/notice_tit.jpg" alt="공지사항"></h2>
                    <ul class="smap">
                        <li><a href="#"><img src="https://image.istarbucks.co.kr/common/img/common/icon_home.png" alt="홈으로"></a></li>
                        <li><img class="arrow" src="https://image.istarbucks.co.kr/common/img/common/icon_arrow.png" alt="하위메뉴"></li>
                        <li class="en"><a href="#">WHAT'S NEW</a></li>
                        <li><img class="arrow" src="https://image.istarbucks.co.kr/common/img/common/icon_arrow.png" alt="하위메뉴"></li>
                        <li><a href="#" class="this">공지사항</a></li>
                    </ul>
                </div>
            </div>
       </section>
       
       <section>
       		<div class="container">
       				<div class="mcontainer">
       				
       				</div>
       		</div>
       </section>