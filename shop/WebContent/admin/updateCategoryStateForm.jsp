<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="<%=request.getContextPath()%>/admin/updateCategoryStateAction.jsp">
	<h1>사용 유무 수정</h1>
	<div>카테고리Name</div>
	<input type = "text" name ="categoryName">
	<div>바꿀 카테고리State</div>
	<input type = "radio" name ="categoryState" value = "Y">Y
	<input type = "radio" name ="categoryState" value = "N">N
	<button type = "submit">수정</button>
</form>
</body>
</html>