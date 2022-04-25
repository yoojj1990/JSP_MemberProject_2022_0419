<%@page import="com.yjj.ex.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dto" class="com.yjj.ex.MemberDto"></jsp:useBean>

<jsp:setProperty property="*" name="dto"/>

<%
	MemberDao dao = new MemberDao();

	int idResult = dao.confirmId(dto.getId()); // 1이면 가입된 아이디 0이면 가입가능 아이디
	
	if(idResult == 1){
%>		
	<script	type="text/javascript">
		alert("이미 존재하는 아이디입니가. 다른 아이디를 입력해주세요.");
		history.back();
	</script>
<%		
	} else{
	
		int dbResult = dao.insertMember(dto); //DB 저장 성공이면 1, 아니면 0으로 반환

		if(dbResult == 1){
%>		
		<script	type="text/javascript">
			alert("회원가입성공! 가입을 축하합니다.");
		</script>
<%		
	} else {
%>
		<script	type="text/javascript">
			alert("회원가입실패! 다시 확인해 주세요.");
		</script>
<%	
		}
	}	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 성공</title>
<body>
	
</body>
</html>