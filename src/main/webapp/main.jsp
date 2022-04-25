<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	if (session.getAttribute("validMem") == null) { //참이면 로그인 안된 유저가 방문
%>
		<jsp:forward page="login.jsp"></jsp:forward>
<%
	} 
	String id = (String)session.getAttribute("id"); // 세션에서 아이디 가져오기
	String name = (String)session.getAttribute("name"); //세션에서 이름 가져오기			
		
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>
	<h2><%= name %>님 환영합니다.</h2><br>
	<h2><%= id %>님 로그인 되셨습니다.</h2>
	
	<form action="logout.jsp" method="post">
		<input type="submit" value="로그아웃">&nbsp;&nbsp;&nbsp;
		<input type="button" value="정보수정" onclick="javascript:window.location='modify.jsp'"> 
	</form>
	
</body>
</html>