<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.lang.Exception, java.sql.SQLException" %>
<%@ page import="java.sql.*" %>
    
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
      </section>
      
    <div class="inner notice__list_in">
	  	<div class="notice__header_in">
<%
			String num = request.getParameter("num");			

				String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
		    String USER = "jsp";
		    String PASSWORD = "123456";
	
		    Connection conn = null; //디비 접속 성공시 접속 정보 저장
				Statement stmt = null; //쿼리를 실행하기 객체 정보
				PreparedStatement pstmt = null; // 쿼리 CUD 실행문
				ResultSet rs = null;
	
				Exception exception = null;
				
				String title = "";
				String content = "";
				
				String sql = null;
				int re = 0;
			
  try {
	  
	  		Class.forName("oracle.jdbc.driver.OracleDriver");
	  		
		// 1. JDBC로 Oracle연결
		
		    conn = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
		    
	  
		// 2. BO_FREE 테이블에서 SQL로 데이터 가져오기
					String updateQuery = "UPDATE BO_FREE SET HIT = HIT + 1 WHERE NUM = ?";
					pstmt = conn.prepareStatement(updateQuery);
					pstmt.setInt(1, Integer.parseInt(num));

					pstmt.executeUpdate();
					
					stmt = conn.createStatement();
					rs = stmt.executeQuery("SELECT NUM, NAME, SUBJECT, CONTENT FROM BO_FREE WHERE NUM = " + num);
					
	 	
	 	// 3. rs로 데이터 가져온 걸 웹에 보여주기 -> 쿼리 실행 결과 출력
	 	if (rs.next()) {
	 		title = rs.getString("SUBJECT");
	 		content = rs.getString("CONTENT");
	 	}
 } catch(Exception e) {
	  exception = e;
	  e.printStackTrace();
 } finally {
	  if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
	  if (conn != null) try { conn.close(); } catch (SQLException ex) {}
 }
  
%>
		<h3><%= title %></h3>
		<p><%= content %></p>
		
	  	</div>
   </div>	
</body>
</html>