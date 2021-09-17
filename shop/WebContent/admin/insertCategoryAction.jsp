<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ page import = "vo.*" %>
     <%@ page import = "dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertCategoryAction.jsp</title>
</head>
<body>
<%
	//깨짐 방지
	request.setCharacterEncoding("utf-8");
	//입력한 값 받아오기
	String categoryName = request.getParameter("categoryName");
	String categoryState = request.getParameter("categoryState");

	Category category = new Category();
	CategoryDao categoryDao = new CategoryDao();
	//호출
	categoryDao.insertCategory(categoryName,categoryState);
	// 입력한 경로로 이동
	response.sendRedirect("./selectCategoryList.jsp");

%>
</body>
</html>