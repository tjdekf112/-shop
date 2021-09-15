<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>

<%
	    Member loginMember = (Member)session.getAttribute("loginMember");
		// 로그인이 안되었거나 관리자레벨이 1보다 작다면 인덱스로 go
		if(loginMember == null || loginMember.getMemberLevel() < 1){
			response.sendRedirect(request.getContextPath() + "/index.jsp");	
			return;
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 관리자 메뉴 -->
	<!--  -->
	<div>
		<jsp:include page="/partial/adminMenu.jsp"></jsp:include>
	</div>
	<h1>관리자페이지</h1>
	<div><%=loginMember.getMemberId() %>님 반갑습니다.</div>
</body>
</html>



