<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=request.getAttribute("title")%>
	<%=request.getAttribute("id")%>
	<%=(String)request.getAttribute("comment")%>
	<% 
		String userid = request.getParameter("id");
		String userpwd = request.getParameter("pw");
		String username = (String)request.getAttribute("name");
		
		response.sendRedirect("/community/list");
	%>
</body>
</html>