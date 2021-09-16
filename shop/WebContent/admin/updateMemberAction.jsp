<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateMemberAction</title>
</head>
<body>
	<%
		MemberDao memberDao = new MemberDao();
		Member member = new Member();
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		//값 받기
		member.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
		member.setMemberPw(request.getParameter("memberPw"));
		//Dao 호출
		memberDao.updateMemberPwByadmin(member);
		
		response.sendRedirect("./selectMemberList.jsp");
		
		
	%>
</body>
</html>