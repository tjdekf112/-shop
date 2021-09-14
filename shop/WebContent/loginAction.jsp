<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "commons.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 글자깨짐 방지
	request.setCharacterEncoding("utf-8");
	//아이디 및 비밀번호를 입력하여 받아오기.
	String memberId = request.getParameter("memberId");
	String memberPw = request.getParameter("memberPw");
	//디버깅
	System.out.println(memberId + "<-- memberId");
	System.out.println(memberPw + "<-- memberPw");
	
	//입력한 아이디아 비밀번호를 받아줄 변수 생성자.
	Member member = new Member();
	member.setMemberId(memberId);
	member.setMemberPw(memberPw);
	
	MemberDao memberDao = new MemberDao();
	Member returnMember = memberDao.login(member);
	
	//반환값이 비어있다면
	if(returnMember == null) {
		System.out.println("로그인 실패");
		response.sendRedirect("./loginForm.jsp");
		return;
		//반환값이 비어있지 않다면
	} else {
		System.out.println("로그인 성공");
		// 디버깅
		System.out.println(returnMember.getMemberId());
		System.out.println(returnMember.getMemberPw());
		// request, session : JSP내장객체
		// 한 사용자의 공간(session)에 변수를 생성
		session.setAttribute("loginMember", returnMember);
		response.sendRedirect("./index.jsp");
	}
%>
</body>
</html>