<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "commons.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NewLoginAction</title>
</head>
<body>
<%
	//글자 깨짐 방지
	request.setCharacterEncoding("utf-8");
	//회원가입을 하기위해 입력한 정보들 받아오기 변수에 받기
	String memberId = request.getParameter("memberId");
	String memberPw = request.getParameter("memberPw");
	String memberName = request.getParameter("memberName");
	int memberAge = Integer.parseInt(request.getParameter("memberAge"));
	String memberGender = request.getParameter("memberGender");
	
	//디버깅
	System.out.println(memberId + "<--memberId");
	System.out.println(memberPw + "<--memberPw");
	System.out.println(memberName + "<--memberName");
	System.out.println(memberAge + "<--memberAge");
	System.out.println(memberGender + "<--memberGender");
	
	// 받아온 데이터를 Dao에서 사용하기위해 변수에 대입.
	Member member = new Member();
	member.setMemberId(memberId);
	member.setMemberPw(memberPw);
	member.setMemberName(memberName);
	member.setMemberAge(memberAge);
	member.setMemberGender(memberGender);
	
	//Member안에 있는 데이터를 매개변수로 호출
	MemberDao memberDao = new MemberDao();
	int rs = memberDao.insertMember(member);
	
	if(rs == 1){
		System.out.println("회원가입 성공");
		response.sendRedirect("./index.jsp");
	}else{
		System.out.println("회원가입 실패");
		response.sendRedirect("./NewLoginAction.jsp");
	}
	
	
%>
</body>
</html>