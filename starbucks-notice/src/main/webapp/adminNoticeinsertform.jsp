<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <div class="card">
        <div class="card-header1">
            <h1><a href="./adminNoticeList.jsp">스타벅스 공지사항 글 등록</a></h1>
        </div>
        <form action="./adminNoticeInsert.jsp" method="post" id="form1" onSubmit="return false">
        <div class="card-write">
            <div class="myinfo">
                이름<input type="text" name="koname" id="koname" placeholder="이름을 입력하세요.">
            </div>
            <div class="title-w">
                제목<input type="text" name="title" id="title" placeholder="제목을 입력하세요.">
            </div>
            <div class="msg">
                내용<textarea placeholder="내용을 입력하세요." name="content" id="content"></textarea>
                <input type="file" name="filecontent" id="">
            </div>
        </div>
        <div class="btn-w">
        	<input type="submit" value="작성" class="input-btn-w" onClick="javascript: prevCheckTextBox();" />
        </div>
     </form>
   
        <script>
    		function prevCheckTextBox() {
    			if (!$('#koname').val()) {	// 이름 관련 dom
    				alert('이름을 입력하세요.');	// 이름 입력하라고 팝업 뜸.
    					$('#koname').focus();		// 이름 입력 칸으로 포커스 이동
    			return;
    		}
						if (!$('#koname').val().length > 5){
							alert('이름을 5자 이내로 입력해주세요');
							$('#koname').focus();
							
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