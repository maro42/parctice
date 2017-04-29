<%@page import="mvc.board.model.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 수정할 레코드의 게시글번호를 넘거받기
	String bId = request.getParameter("bId");


%>   
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 수정하기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
 <body>
	<h4> 게시판 글 수정하기 </h4><br/>
	<form id="frm" name='frm' method='post' action="xxx.board?cmd=modify-page&bId=<%=bId%>">
	제  목 : <input name="title" type='text' id="title"><br/><br/>
	패스워드(수정/삭제시 필요) :
			<input name="password" type='password' id="pass"><br/><br/>
	내  용 : <textarea name='content' rows='10' cols='40' id="content"></textarea><br/><br/>

	<input id="modify" type='submit' value='수정하기'>
	<input type='button' value='목록보기' onclick="window.location='BoardList.jsp'">
	</form>

</body>
</html>