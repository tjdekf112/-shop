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

		// memberIdCheck값이 공백이거나 널인자..
		if(request.getParameter("memberIdCheck") == null || request.getParameter("memberIdCheck").equals("")){
			response.sendRedirect(request.getContextPath()+"/NewLogin.jsp");
			return;
		}
	
	String memberIdCheck = request.getParameter("memberIdCheck");
	System.out.println(memberIdCheck + "<-- memberIdCheck");

	MemberDao memberDao = new MemberDao();
	String result = memberDao.selectMemberId(memberIdCheck);
	//memberDao.selectMemberId()메서드 호출
	System.out.println(result + "<--result");
	//
	if(result == null){
	response.sendRedirect(request.getContextPath()+"/insertCategoryForm.jsp?memberIdCheck="+memberIdCheck);
	}else{
		response.sendRedirect(request.getContextPath()+"/insertCategoryForm.jsp?idCheckResult=This");
	}
	
	
	
	
	
	%>
</body>
</html>