<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateMemberLevelForm</title>
</head>
<body>
	<form method = "post" action = "./updateMemberLevelAction.jsp">
	<h1>level 수정</h1>
	<div>No</div>
	<input type = "text" name = "memberNo">
	<div>바꿀 비밀번호</div>
	<input type = "text" name = "memberLevel">
	<button type ="submit">변경</button>
	</form>
</body>
</html>