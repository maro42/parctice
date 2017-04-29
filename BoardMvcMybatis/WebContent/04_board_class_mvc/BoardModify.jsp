<%@page import="mvc.board.model.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 0. 넘겨받는 데이타의 한글 처리
	request.setCharacterEncoding("UTF-8");
%>


<%
	// 2. Service에 update() 호출하여 레코드 수정
	int result = (int)request.getAttribute("result");
	Board rec = new Board();

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판글수정</title>
</head>
<body>

<%  // 게시글 수정이 성공적으로 되었다면 그 해당 게시글을 보여주는 페이지로 이동하고
    // 그렇지 않다면, "암호가 잘못 입력되었습니다"를 출력
    if(result != 0) {
    	response.sendRedirect("xxxx.board?cmd=boardview-page&bId="+request.getParameter("bId"));
    }
    else{%>
    	암호가 잘못입력되었습니다.
    	<a href = "xxxx.board?cmd=go-modify&bId=<%=request.getParameter("bId")%>">뒤로가기</a>
    <%
    }
	
%>

</body>
</html>