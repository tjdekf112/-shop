<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "dao.*" %>
     <%@ page import = "vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	//입력했던 값 받기
	String categoryName = request.getParameter("categoryName");
	String categoryState = request.getParameter("categoryState");
	//디버깅
	System.out.println(categoryName + "<--categoryName");
	System.out.println(categoryState + "<--categoryState");
	CategoryDao categoryDao = new CategoryDao();
	//호출
	categoryDao.updateCategoryStateByadmin(categoryName, categoryState);
	
	response.sendRedirect(request.getContextPath()+"/admin/selectCategoryList.jsp");
	
	
	
	%>
</body>
</html>