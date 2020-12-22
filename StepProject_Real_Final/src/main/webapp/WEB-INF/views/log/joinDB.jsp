<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	String userid = request.getParameter("id");
	String userpwd = request.getParameter("pw");
	String username = (String)request.getAttribute("name");
	session.setAttribute("ID", userid);
	session.setAttribute("PW", userpwd);
	session.setAttribute("NAME", username);
	 %>
	
	<%
		String id = (String)session.getAttribute("ID");
		String pwd = (String)session.getAttribute("PW");
		out.print("ID = " + id + "<br>");
		out.print("PW = " + pwd);
		out.print(username);
		
		System.out.println(username);
		response.sendRedirect("/");
	%>
</body>
</html>