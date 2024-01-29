<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.lang.Exception, java.sql.SQLException" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   	String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
    String USER = "jsp";
    String PASSWORD = "123456";
   
    String sql = null; 
    String num = request.getParameter("num");
    Connection conn = null; //디비 접속 성공시 접속 정보 저장
   	Statement stmt = null; //쿼리를 실행하기 객체 정보
   	ResultSet rs = null;

   	int re = 0;
   
   	Exception exception = null;
   
  try {
      // 1. JDBC로 Oracle연결
     conn = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
     System.out.println("오라클 접속 성공");

      // 2. BO_FREE 테이블에서 SQL로 데이터 가져오기
       stmt = conn.createStatement();   // 2-1. Statement 생성
       rs = stmt.executeQuery("SELECT NUM, SUBJECT, CONTENT, HIT FROM BO_FREE WHERE NUM =" + num);

       // 3. rs로 데이터 가져온 걸 웹에 보여주기 -> 쿼리 실행 결과 출력
       while(rs.next()) {

          // SELECT문에서 조회된 값의 HIT를 변수에 담는다.
          int hit = rs.getInt("HIT");

          // HIT의 값을 +1 한다. (조회수 1증가)
          hit++;

          // HIT의 값을 업데이트 한다.
          sql = "UPDATE BO_FREE SET HIT= '" + hit + "' WHERE NUM = " + num;

          re = stmt.executeUpdate(sql); // 2-2. SQL 쿼리 실행

         if (re==1) {
            System.out.println("조회수 수정 성공!");
         } else {
            System.out.println("조회수 수정 실패!");
         }
%>

<%              
       }
  }   	catch(Exception e) {
     		System.out.println("오라클 접속 오류:" + e);
  }
%>           
</body>
</html>