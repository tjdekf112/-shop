<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>
<%
		request.setCharacterEncoding("utf-8");
	    Member loginMember = (Member)session.getAttribute("loginMember");
		// 로그인이 안되었거나 관리자레벨이 1보다 작다면 인덱스로 go
		if(loginMember == null || loginMember.getMemberLevel() < 1){
			response.sendRedirect(request.getContextPath() + "/index.jsp");	
			return;
		}
		//검색어
		String searchMemberId = "";
		if(request.getParameter("searchMemberId") != null){
			searchMemberId = request.getParameter("searchMemberId");
		}
		System.out.println(searchMemberId + "<--searchMemberId");
		
		//페이지
		int currentPage = 1;
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		System.out.println(currentPage + "<--currentPage");
		int rowPerPage = 10;	// 상수 : rowPerPage변수 10으로 초기화되면 끝가지 10이다
		int beginRow = (currentPage-1)*10;
		
		MemberDao memberDao = new MemberDao();
		ArrayList<Member> memberList = null;
		if(searchMemberId.equals("") == true){
			memberList = memberDao.selectMemberListAllByPage(beginRow,rowPerPage);
		}else{
			memberList = memberDao.selectMemberListAllBySearchMemberId(beginRow,rowPerPage,searchMemberId);
		}
		
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
</head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<body>
<div class="container">
	<div>
	<jsp:include page="/partial/adminMenu.jsp"></jsp:include>
	</div>
	<h1>회원 목록</h1>
	<table border="1">
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<thead>
			<tr>
			
				<th>memberNo</th>
				<th>memberId</th>
				<th>memberLevel</th>
				<th>memberName</th>
				<th>memberAge</th>
				<th>memberGender</th>
				<th>updateDate</th>
				<th>createDate</th>
				<th>회원등급수정</th>
				<th>비밀번호수정</th>
				<th>회원탈퇴</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Member m : memberList){
					%>
					<tr>
						<td><%= m.getMemberNo() %></td>
						<td><%= m.getMemberId() %></td>
						<td>
							
							<%
								if(m.getMemberLevel() != 1){
							%>
								<span>일반회원</span>
							<%
								}else if(m.getMemberLevel() == 1){
							%>
								<span>관리자</span>
							<%
								}
							%>
							(<%=m.getMemberLevel() %>)
						</td>
						<td><%= m.getMemberName() %></td>
						<td><%= m.getMemberAge() %></td>
						<td><%= m.getMemberGender() %></td>
						<td><%= m.getUpdateDate() %></td>
						<td><%= m.getCreatedate() %></td>
						<td>
						<!--  특정회원의 등급을 수정  -->
							<a href = "<%=request.getContextPath()%>/admin/updateMemberLevelForm.jsp?memberNo=<%=m.getMemberNo()%>">회원등급수정</a>
						</td>
						<td>
							<!-- 특정회원의 비밀번호를 수정 -->
							<a href = "<%=request.getContextPath()%>/admin/updateMemberForm.jsp?memberNo=<%=m.getMemberNo()%>">비밀번호수정</a>
						</td>
						<td>
							<!--  특정회원을 강제탈퇴 -->
							<a href = "<%=request.getContextPath()%>/admin/deleteMemberForm.jsp?memberNo=<%=m.getMemberNo()%>">강제탈퇴</a>
							
						</td>
					</tr>
					<%
				}
			%>
			
		</tbody >
		
	</table>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark"></nav>
<%
	// ISSUE : 페이지 잘되었는데// 검색한 후 페이징하면 안된다 -> issue 해결
	// 이전으로 가는 if문 ex) 내가 2페이지라면 1페이지로 가게함
	if(currentPage > 1){
		%>
		<a href="./selectMemberList.jsp?currentPage=<%=currentPage-1%>&searchMemberId=<%=searchMemberId%>">이전</a>
		<%
	}
	

	int lastPage;
	// 검색한 값이 없다면 
	if(searchMemberId.equals("") == true) { 
		int totalCount = memberDao.totalList();
		lastPage = totalCount/rowPerPage;
	} 
	//검색한 값이 있다면
	else { 
		int totalCount = memberDao.totalSelectList(searchMemberId);
		lastPage = totalCount/rowPerPage;
	}

	
	System.out.println(lastPage + "<--lastPage");
	
	if(currentPage < lastPage){
%>
	<a href="./selectMemberList.jsp?currentPage=<%=currentPage+1%>&searchMemberId=<%=searchMemberId%>">다음</a>
<%
	}
%>
	<!--  memberId로 검색 -->
	<div>
		<form action="<%=request.getContextPath()%>/admin/selectMemberList.jsp" method = "get">
			memberId:
			<input type="text" name="searchMemberId">
			<button type="submit">검색</button>
		
		
		
		
		
		</form>
	</div>
	
	
	
	
	
</body>
</html>