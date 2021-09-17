<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import = "dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");	
	// memberIdCheck값이 공백이거나 널인자..
	if(request.getParameter("categoryNameCheck") == null || request.getParameter("categoryNameCheck").equals("")){
		response.sendRedirect(request.getContextPath()+"/admin/insertCategoryForm.jsp");
		return;
	}
	//입력값 받기.
	String categoryNameCheck = request.getParameter("categoryNameCheck");
	// 디버깅
	System.out.println(categoryNameCheck + "<-- categoryNameCheck");
	
	CategoryDao categoryDao = new CategoryDao();
	
	// if문에 조건을 사용하기위해 result란 변수에 호출
	String result = categoryDao.selectCategoryName(categoryNameCheck);
	// 디버깅
	System.out.println(result + "<--result");
	
	//중복되는 값이 없다면 categoryName에 입력하고 아니면 다시입력
	if(result == null) {
		response.sendRedirect(request.getContextPath()+"/admin/insertCategoryForm.jsp?categoryNameCheck="+categoryNameCheck);
	} else {
		response.sendRedirect(request.getContextPath()+"/admin/insertCategoryForm.jsp");
	}
	
	%>
</body>
</html>