<%@page import="com.yjj.ex.MemberDto"%>
<%@page import="com.yjj.ex.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDao dao = new MemberDao();
	String id = (String)session.getAttribute("id");
	MemberDto dto = dao.getMemberInfo(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
</head>
<body>
	<form action="modifyOk.jsp" method="post">
		
		아이디 : <%= dto.getId() %> <br><br>
		비빌번호 : <input type="password" name="pw" size="20"><br><br>
		이름 :  <%= dto.getName() %><br><br>
		이메일 : <input type="email" name="email" size="20" value="<%= dto.getEmail() %>"><br><br>
		주소 : <input type="text" name="address" size="50" value="<%= dto.getAddress() %>"><br><br>
		
		<input type="submit" value="수정완료">&nbsp;&nbsp;&nbsp;
		
		<input type="button" value="취소" onclick="javascript:window.location='main.jsp'">
		
	</form>
</body>
</html>