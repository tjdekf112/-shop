<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>
<%
		request.setCharacterEncoding("utf-8");
	    Member loginMember = (Member)session.getAttribute("loginMember");
		// 로그인이 안되었거나 관리자레벨이 1보다 작다면 인덱스로 go
		if(loginMember == null || loginMember.getMemberLevel() < 1){
			response.sendRedirect(request.getContextPath() + "/index.jsp");	
			return;
		}
		
		
		int currentPage = 1;
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int rowPerPage = 10;	// 상수 : rowPerPage변수 10으로 초기화되면 끝가지 10이다
		int beginRow = (1-currentPage);
		MemberDao memberDao = new MemberDao();
		ArrayList<Member> memberList = memberDao.selectMemberListAllByPage(beginRow,rowPerPage);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
</head>
<body>
	<div>
	<jsp:include page="/partial/adminMenu.jsp"></jsp:include>
	</div>
	<h1>회원 목록</h1>
	<table border="1">
		<thead>
			<tr>
				<th>memberNo</th>
				<th>memberLevel</th>
				<th>memberName</th>
				<th>memberAge</th>
				<th>memberGender</th>
				<th>updateDate</th>
				<th>createDate</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Member m : memberList){
					%>
					<tr>
						
					
					
					</tr>
					<%
				}
			%>
		</tbody>
	</table>
</body>
</html>