<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>카테고리 추가</h1>
		
	<%

		//null이면 공백 null이 아니면 값이 있는것
		String categoryNameCheck = "";
		if(request.getParameter("categoryNameCheck") != null){
			categoryNameCheck = request.getParameter("categoryNameCheck");
		}
	%>
	<div><%= request.getParameter("NameCheckResult") %>
	
	<!-- 카테고리 이름이 사용가능한지 확인하는 폼 -->
	<form method="post" action="<%=request.getContextPath() %>/admin/selectCategoryNameCheckAction.jsp">
		<div>
			카테고리 이름 중복 검사:
			<input type = "text" name = "categoryNameCheck">
			<button type = "submit"> 중복 검사</button>
		</div>
		

	</form>
	<form method = "post" action="<%=request.getContextPath() %>/admin/insertCategoryAction.jsp">

	<div>categoryName : </div>
	<div><input type = "text" name = "categoryName" readonly="readonly" value="<%= categoryNameCheck%>"></div>
	<div>categoryState : </div>
	<div>
		<input type = "radio" name = "categoryState" value = "Y">Y
		<input type = "radio" name = "categoryState" value = "N">N
	</div>
	<button type="submit">추가</button>
	</form>
</body>
</html>