<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<!-- 회원 관리 : 목록, 수정(등급,비밀번호), 강제탈퇴 -->
		<li><a href="<%=request.getContextPath()%>/admin/selectMemberList.jsp">[회원 관리]</a></li>
		<!-- 
			전자책 카테고리 관리  : 목록, 추가, 사용유무 수정
			1) Category.class
			2) CategoryDao.class
			3) selectCategoryList.jsp	(페이징 x)
			4) insertCategoryForm.jsp
			5) insertCategoryAction.jsp
			6) selectCategoryNameCheckAction.jsp
			7) updateCategoryStateAction.jsp
		
		-->
		<li><a href="<%=request.getContextPath()%>/admin/selectCategoryList.jsp">[전자책 카테고리 관리]</a></li>
		<!-- 전자책 관리 : 목록, 추가(이미지 추가), 수정, 삭제 -->
		<li><a href="<%=request.getContextPath()%>/admin/">[전자책 관리]</a></li>
		<li><a href="<%=request.getContextPath()%>/admin/">[주문 관리]</a></li>
		<li><a href="<%=request.getContextPath()%>/admin/">[상품명 관리]</a></li>
		<li><a href="<%=request.getContextPath()%>/admin/">[공지게시판 관리]</a></li>
		<li><a href="<%=request.getContextPath()%>/admin/">[QnA게시간 관리]</a></li>
</body>
</html>