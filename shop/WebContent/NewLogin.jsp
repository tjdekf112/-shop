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
	
	
	<%
		//null이면 공백 null이 아니면 값이 있는것
		String memberIdCheck = "";
		if(request.getParameter("memberIdCheck") != null){
			memberIdCheck = request.getParameter("memberIdCheck");
		}
	%>
	
	<div><%= request.getParameter("idCheckResult") %></div>	<!--  null -->
	
	<!-- 멤버아이디가 사용가능한지 확인하는 폼 -->
	<form method="post" action="<%=request.getContextPath() %>/selectMemberIdCheckAction.jsp">
		<div>
			회원아이디:
			<input type = "text" name = "memberIdCheck">
			<button type = "submit">아이디 중복 검사</button>
		</div>

	</form>
	
	<form method="post" action="<%=request.getContextPath() %>/NewLoginAction.jsp">
		<div class="btn-secondary"> memberId : </div>
		<!-- readonly는 적을수 없게하는 것 -->
		<div><input type="text" name="memberId" readonly="readonly" value="<%= memberIdCheck%>"></div>
		<div class="btn-secondary"> memberPw : </div>
		<div><input type="password" name="memberPw"></div>
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