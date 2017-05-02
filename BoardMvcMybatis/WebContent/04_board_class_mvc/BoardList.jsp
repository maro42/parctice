
<%@page import="mvc.board.model.Board"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>

<%  //웹브라우저가 게시글 목록을 캐싱할 경우 새로운 글이 추가되더라도 새글이 목록에 안 보일 수 있기 때문에 설정 캐쉬 삭제?
	response.setHeader("Pragma","No-cache");		// HTTP 1.0 version
	response.setHeader("Cache-Control","no-cache");	// HTTP 1.1 version
	response.setHeader("Cache-Control","no-store"); // 일부 파이어폭스 버스 관련
	response.setDateHeader("Expires", 1L);			// 현재 시간 이전으로 만료일을 지정함으로써 응답결과가 캐쉬되지 않도록 설정
	
	//야 바꿨다 여기 수정부분이다
%>

<%

//전체 페이지 수 구해오기

//Control에서 param을 넘겨받아 mList 변수에 지정
List <Board> mList = (List<Board>)request.getAttribute("param");
 

Date date = new Date();
SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
String today = f.format(date);
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 게시글 목록 </title>
</head>

<BODY>

	<h3> 게시판 목록 </h3>
	
	<table border="1" bordercolor="darkblue">
	<tr>
		<td> 글번호 </td>
		<td> 제 목 </td>
		<td> 작성자 </td>
		<td> 작성일 </td>
		<td> 조회수 </td>
	</tr>
	

	<% if( mList.isEmpty() ) { %>
		<tr><td colspan="5"> 등록된 게시물이 없습니다. </td></tr>
	<% } else { %>
	
		<% for(Board rec : mList) {%>
		<tr>
			<td><%= rec.getArticleId() %></td>
			<td>
			<% for(int i=0; i<rec.getLevel(); i++){ //답글일 경우 공백 넣어주기%>
				&nbsp;
			<%}//end of for %>
			<%if(rec.getLevel() !=0){ //답글 표시해주는 사진 넣어주기%>
				<img src="imgs/board_re.gif"/>
			<%}//end of if %>
			<a href="xxxx.board?cmd=boardview-page&bId=<%=rec.getArticleId()%>">
			<%if(rec.getPostingDate().equals(today)){ %>
			<%= rec.getTitle()%><img src="imgs/new.png"/></a>
			<%} else{%>
			<%= rec.getTitle()%></a>
			<%} %>
			</td>
			<td><%= rec.getWriterName() %></td>		
			<td><%= rec.getPostingDate() %></td>
			<td><%= rec.getReadCount() %></td>
		</tr>
		<%}//end of for %>

	<% } // end else %>
	
		<tr>
			<td colspan="5">
				<a href="xxx.board?cmd=write-page">글쓰기</a>
			</td>
		</tr>
	</table>
	<hr/>
<%-- 	<%for(int i=1; i<=totalPageCount; i++){ %> --%>
<%-- 	<a href="BoardList.jsp?pageNo=<%=i%>">[<%=i%>]</a> --%>
<%-- 	<%} %> --%>
</BODY>
</HTML>
