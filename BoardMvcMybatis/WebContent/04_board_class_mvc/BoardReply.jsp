<%@page import="mvc.board.model.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
%>

<%
	Board rec = (Board)request.getAttribute("result");

%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 답변 글 저장하기 </title>
</head>
<body>

답변글을 등록하였습니다. <br/><br/>

<a href="xxxx.board?cmd=list-page"> 목록보기 </a> &nbsp;
<a href="xxxx.board?cmd=boardview-page&bId=<%=rec.getArticleId()%>"> 게시글 읽기 </a>

</body>
</html>