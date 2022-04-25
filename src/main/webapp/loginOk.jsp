<%@page import="com.yjj.ex.MemberDto"%>
<%@page import="com.yjj.ex.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String id = request.getParameter("id"); // login.jsp 엣서 넘오온 id 값을 저장
		String pw = request.getParameter("pw"); // login.jsp 엣서 넘오온 pw 값을 저장
		
		MemberDao dao = new MemberDao(); // MemberDao 클래스로 dao 객체 선언
		int checkNum = dao.userCheck(id, pw); // 1이면 로그인성공, 2면 비빌번호 틀림, 0 이면 회원이 아님
		
		if(checkNum == 0) {
	%>	
		<script	type="text/javascript">
			alert("아이디가 존재하지 않습니다.");
			history.back();
		</script>
	<%
		} else if(checkNum == 2) {
	%>		
		<script	type="text/javascript">
			alert("비밀번호가 틀렸습니다. 다시 확인해 주세요.");
			history.back();
		</script>	
	<%		
		} else {	
			
			MemberDto dto = dao.getMemberInfo(id);
			
			session.setAttribute("id", id);
			
			String pname = dto.getName();
			session.setAttribute("name", pname);
			session.setAttribute("validMem", "yes");
			
			response.sendRedirect("main.jsp");
			
		}
		
		
		
	
	%>
</body>
</html>