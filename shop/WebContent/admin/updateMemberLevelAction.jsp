<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		MemberDao memberDao = new MemberDao();
		Member member = new Member();
		Member loginMember = (Member)session.getAttribute("loginMember");
		//No와 바꿀 Level 받아오기
		member.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
		member.setMemberLevel(Integer.parseInt(request.getParameter("memberLevel")));
		//디버깅
		System.out.println(member.getMemberNo() + "<-- memberNo");
		System.out.println(member.getMemberLevel() + "<-- memberLevel");
		//호출
		memberDao.updateMemberLevelBydamin(member);
		
		response.sendRedirect("./selectMemberList.jsp");
		
		
	%>
</body>
</html>