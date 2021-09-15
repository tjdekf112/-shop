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
<body>
	<div>
	<jsp:include page="/partial/adminMenu.jsp"></jsp:include>
	</div>
	<h1>회원 목록</h1>
	<table border="1">
		<thead>
			<tr>
				<th>memberNo</th>
				<th>memberLevel</th>
				<th>memberName</th>
				<th>memberAge</th>
				<th>memberGender</th>
				<th>updateDate</th>
				<th>createDate</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Member m : memberList){
					%>
					<tr>
						<td><%= m.getMemberNo() %></td>
						<td>
							<%=m.getMemberLevel() %>
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
						
						</td>
						<td><%= m.getMemberName() %></td>
						<td><%= m.getMemberAge() %></td>
						<td><%= m.getMemberGender() %></td>
						<td><%= m.getUpdateDate() %></td>
						<td><%= m.getCreatedate() %></td>
					</tr>
					<%
				}
			%>
		</tbody>
	</table>
<%
	// ISSUE : 페이지 잘되었는데// 검색한 후 페이징하면 안된다 -> issue 해결
	// 이전으로 가는 if문 ex) 내가 2페이지라면 1페이지로 가게함
	if(currentPage > 1){
		%>
		<a href="./selectMemberList.jsp?currentPage=<%=currentPage-1%>&searchMemberId=<%=searchMemberId%>">이전</a>
		<%
	}
	
	int totalCount = memberDao.totalList();
	int lastPage = totalCount / rowPerPage; // 마지막 페이지 수를 계산
	if(totalCount%rowPerPage != 0){
		lastPage+=1;
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