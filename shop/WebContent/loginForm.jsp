<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<h1>로그인</h1>
	<form method = "post" action= "<%=request.getContextPath() %>/loginAction.jsp">
	<div>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<div class="btn-secondary"> memberId :</div>
		<input type = "text" name ="memberId">
	</nav>
	</div>
	<div>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<div class="btn-secondary"> memberPw :</div>
		<input type = "passWord" name ="memberPw">
	</nav>
	</div>
	<div>
	<button type = "submit"> 입력 </button>
	</div>
	</form>
</body>
</html>