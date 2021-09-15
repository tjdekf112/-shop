<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<div class="container">
	<table class="table table-dark">
	<div>
		<!--  /로 시작하면 절대 주소 -->
		<jsp:include page="/partial/mainMenu.jsp"></jsp:include>
	</div>
	<h1>메인페이지</h1>
	<%
	// 아이디를 입력해서 로그인 했다면..
	if(session.getAttribute("loginMember") == null) {
	%>
	<!--  로그인 전 -->
	
	<div>
	
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<div><a class="btn-secondary" href="<%=request.getContextPath() %>/loginForm.jsp">로그인</a></div>
	</nav>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<div><a class="btn-secondary" href="<%=request.getContextPath() %>/NewLogin.jsp">회원가입</a></div>
	</nav>
	</div>
	<%
	} else {
		Member loginMember = (Member)session.getAttribute("loginMember");
	%>
	<!-- 로그인 후-->
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<div class ="btn-secondary"><%=loginMember.getMemberName()%>님 반갑습니다.</div><a href="./logout.jsp">로그아웃</a>
	</nav>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<div><a href="./selectMemberOne.jsp">회원정보</a></div>
	</nav>
	<%
	}
	%>
	
</table>
</body>
</html>