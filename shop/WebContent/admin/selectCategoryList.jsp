<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import = "vo.*" %>
     <%@ page import = "dao.*" %>
   <%@ page import = "java.util.ArrayList" %>
<%
	request.setCharacterEncoding("utf-8");

	Member loginMember = (Member)session.getAttribute("loginMember");
	// 로그인이 안되었거나 관리자레벨이 1보다 작다면 인덱스로 go
	if(loginMember == null || loginMember.getMemberLevel() < 1){
		response.sendRedirect(request.getContextPath() + "/index.jsp");	
		return;
	} 
	
	Category category = new Category();
	CategoryDao CategryDao = new CategoryDao();
	//리스트 초기화(배열과 비슷한 용도)
	ArrayList<Category> categoryList = null;
	categoryList = CategryDao.selectCategoryListAllByPage();
   

   
   
   
   
   
 %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selectCategory.jsp 페이징 x</title>
</head>
<body>
<div><jsp:include page="/partial/adminMenu.jsp"></jsp:include></div>
	<h1> 전자책 목록</h1>
	
	<a href = "<%=request.getContextPath()%>/admin/insertCategoryForm.jsp">전자책 추가</a>
	
	<table border="1">
	<thead>
			<tr>
				<th>categoryName</th>
				<th>categoryState</th>
				<th>updateDate</th>
				<th>createDate</th>
			</tr>
	</thead>
	<tbody>
			<tr>
					<%
				for(Category c : categoryList){
					
				%>
				<tr>
				<td><%= c.getCategoryName()%></td>
				<td><%= c.getCategoryState() %>
				<div>
				<a href = "<%=request.getContextPath()%>/admin/updateCategoryStateForm.jsp">수정</a>
				</div>
				</td>
				<td><%= c.getUpdateDate() %></td>
				<td><%= c.getCreateDate() %></td>
				</tr>
				<%
				}
				 %>
				 
			</tr>
	</tbody>
</table>
</body>
</html>