<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteMemberForm</title>
</head>
<body>
	<%
		MemberDao memberDao = new MemberDao();
		Member member = new Member();
		Member loginMember = (Member)session.getAttribute("loginMember");
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		memberDao.deleteMemberByKey(memberNo);
		System.out.println("삭제 성공");
		response.sendRedirect("./selectMemberList.jsp");
		
		
	%>
</body>
</html>