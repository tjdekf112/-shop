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
	<h1>회원 가입</h1>
	<form method="post" action="<%=request.getContextPath() %>/NewLoginAction.jsp">
		<div class="btn-secondary"> memberId : </div>
		<div><input type="text" name="memberId"></div>
		<div class="btn-secondary"> memberPw : </div>
		<div><input type="text" name="memberPw"></div>
		<div class="btn-secondary"> memberName : </div>
		<div><input type="text" name="memberName"></div>
		<div class="btn-secondary"> memberAge : </div>
		<div><input type="text" name="memberAge"></div>
		<div class="btn-secondary"> memberGender : </div>
		<div>
			<input type="radio" name="memberGender"	value = "남">남
			<input type="radio" name="memberGender" value = "여">여
		</div>
		
		<div><button type="submit">로그인</button></div>
	</form>
</body>
</html>