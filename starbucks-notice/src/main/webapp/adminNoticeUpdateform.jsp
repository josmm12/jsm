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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/style.css">
    <script defer src="./js/jquery-3.7.1.min.js"></script>
    <title>글쓰기</title>
</head>
<body>
<%
				String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
			  String USER = "jsp";
			  String PASSWORD = "123456";
  
  			String num = request.getParameter("num");
	
			  Connection conn = null; //디비 접속 성공시 접속 정보 저장
				Statement stmt = null; //쿼리를 실행하기 객체 정보
				ResultSet rs = null;
	
				Exception exception = null;
				
				String name = "";
				String title = "";
				String content = "";
	
  try {
	  // 0.
				  Class.forName("oracle.jdbc.driver.OracleDriver");
				  
					// 1. JDBC로 Oracle연결
				  		conn = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
				  // System.out.println("오라클 접속 성공");
				  
					// 2. BO_FREE 테이블에서 SQL로 데이터 가져오기
						 	stmt = conn.createStatement();	// 2-1. Statement 생성
						 	rs = stmt.executeQuery("SELECT NUM, NAME, SUBJECT, CONTENT FROM BO_FREE WHERE NUM = " + num); // 2-2. SQL 쿼리 실행
				 	
							 	if (rs.next()) {
										 		name = rs.getString("NAME");
										 		title = rs.getString("SUBJECT");
										 		content = rs.getString("CONTENT");
							 }
  } catch(Exception e) {
	  						System.out.println("오라클 접속 오류: " + e);
	  
  } finally {
								  if (stmt != null) try { stmt.close(); } catch (SQLException ex) {}
								  if (conn != null) try { conn.close(); } catch (SQLException ex) {}
  }
%>




    <div class="card">
        <div class="card-header1">
            <h1><a href="./adminNoticeList.jsp">스타벅스 공지사항 글 수정</a></h1>
        </div>
        <form action="./adminNoticeUpdate.jsp" method="post" id="form1" onSubmit="return false">
        <input type="hidden" name="num" value="<%= num %>">
        <div class="card-write">
            <div class="myinfo">
                이름<input type="text" name="koname" id="koname" placeholder="이름을 입력하세요." value="<%= name %>">
            </div>
            <div class="title-w">
                제목<input type="text" name="title" id="title" placeholder="제목을 입력하세요." value="<%= title %>">
            </div>
            <div class="msg">
                내용<textarea placeholder="내용을 입력하세요." name="content" id="content"><%= content %></textarea>
                <input type="file" name="filecontent" id="">
            </div>
        </div>
        <div class="btn-w">
        	<input type="submit" value="수정" class="input-btn-w" onClick="javascript: prevCheckTextBox();" />
        </div>
     </form>
   
        <script>
					function prevCheckTextBox() {
			    		if (!$('#koname').val()) {	// 이름 관련 dom
			    			alert('이름을 입력하세요.');	// 이름 입력하라고 팝업 뜸.
			    			$('#koname').focus();		// 이름 입력 칸으로 포커스 이동
			    			
			    			return;
			    		}
			    		if ($('#koname').val().length > 5) { // 이름 관련 dom	
			    			alert('이름을 5자 이내로 입력해 주세요.');	// 이름 5자 이내로 입력하라고 팝업 뜸.
			    			$('#koname').focus();		// 이름 입력 칸으로 포커스 이동
			    			
			    			return;
			    		}
						if (!$('#title').val()){
							alert('제목을 입력하세요');
							$('#title').focus();
							
							return;
						}
						if (!$('#content').val()){
							alert('내용을 입력하세요');
							$('#content').focus();
						
							return;
						}
						// 실제 form의 action의 값으로 전송
						document.getElementById('form1').submit();
					}
        </script>
    </div>
</body>
</html>