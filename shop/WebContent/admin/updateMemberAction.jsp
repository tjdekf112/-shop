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
	if(request.getParameter("memberNo") == null || request.getParameter("memberPw") == null){	//로그인이 된 상태(로그인멤버값이 null인 상태)
	//브라우저에게 다른곳을 '요청'(위치로 보내는 것(go)이 아닌(보내주는 것이 아니라 간 것) 해당 위치로 내보내는(rollback) 것(쫒아내는 것,되돌리는 것))
	response.sendRedirect(request.getContextPath()+"/selectMemberList.jsp");	//로그인이 된 상태니 인덱스로
	return;	//if문 이후 코드가 작동하지 않도록 값 리턴
	}
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