<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateMemberForm</title>
</head>
<body>
	<form method = "post" action = "./updateMemberAction.jsp">
	<h1>비밀번호 수정</h1>
	<div>No</div>
		<input type = "text" name = "memberNo">
	<div>비밀번호</div>
	<input type = "password" name = "memberPw">
	<button type ="submit">변경</button>
	</form>
</body>
</html>