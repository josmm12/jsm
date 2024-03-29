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
                <div class="sub_tit_wrap2">
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
            
        <div class="notice_wrap">
        	<div class="sch_wrap">
        		<div class="sch_wraps">
        			<input type="text" name="검색어" placeholder="검색어를 입력해 주세요." class="sch_bar">
        			<a href="#" class="searchbtn">검색</a>
        		</div>
        	</div>
        </div>
        </section>
        
  <!-- notice list -->
  <section>
	  <div class="inner notice__list">
	  	<div class="notice__header">
	  		<div class="notice__no">NO</div>
	  		<div class="notice__title">제목</div>
	  		<div class="notice__regdate">날짜</div>
	  		<div class="notice__hit">조회수</div>
	  	</div>
	  	<div class="notice__list__itmes">
	
<%
		String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
    String USER = "jsp";
    String PASSWORD = "123456";
	
    Connection conn = null; //디비 접속 성공시 접속 정보 저장
		Statement stmt = null; //쿼리를 실행하기 객체 정보
		ResultSet rs = null;
	
		Exception exception = null;
	
  try {
		// 1. JDBC로 Oracle연결
	  conn = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
	  System.out.println("오라클 접속 성공");
	  
		// 2. BO_FREE 테이블에서 SQL로 데이터 가져오기
	 	stmt = conn.createStatement();	// 2-1. Statement 생성
	 	rs = stmt.executeQuery("SELECT NUM, SUBJECT, HIT, REGDATE FROM BO_FREE ORDER BY NUM DESC"); // 2-2. SQL 쿼리 실행
	 	
	 	// 3. rs로 데이터 가져온 걸 웹에 보여주기 -> 쿼리 실행 결과 출력
	 	while(rs.next()) {
%>
<ul>
	<li><%= rs.getInt("NUM") %></li>
	<li><a href="./notice_in.jsp?num=<%= rs.getInt("NUM") %> "><%= rs.getString("SUBJECT") %></a></li>
	<li><%= rs.getString("REGDATE").substring(0, 10) %></li>
	<li><%= rs.getInt("HIT") %></li>
</ul>
	
<% 		 		
	 	}
  }   catch(Exception e) {
	  System.out.println("오라클 접속 오류:" + e);
  }
%>	  		
	  		
	  	</div>
	  </div>
  </section>
</body>
</html>