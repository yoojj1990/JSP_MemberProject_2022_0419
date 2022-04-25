<%@page import="com.yjj.ex.MemberDao"%>
<%@page import="com.yjj.ex.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	request.setCharacterEncoding("utf-8");
	
	String id = (String)session.getAttribute("id");
	String pw = request.getParameter("pw");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	
	MemberDto dto = new MemberDto();
	
	dto.setId(id);
	dto.setPw(pw);
	dto.setEmail(email);
	dto.setAddress(address);
	
	MemberDao dao = new MemberDao();
	int dbFlag = dao.modifyMemberInfo(dto); // 1이면 수정성공, 아니면 수정 실패
	
	if(dbFlag == 1) {
%>
		<script	type="text/javascript">
			alert("정보수정 성공.");
			document.location.href="main.jsp";
		</script>
<%		
	} else {
%>		
		<script	type="text/javascript">
			alert("정보수정 실패");
			history.back();
		</script>	
<%		
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 확인</title>
</head>
<body>
	
</body>
</html>