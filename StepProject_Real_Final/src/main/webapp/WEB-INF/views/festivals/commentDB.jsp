<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
String text=request.getParameter("comment_text");
Double grade=Double.parseDouble(request.getParameter("comment_grade"));
%>
text : <%=text %><br>
grade : <%=grade %>
<%
response.sendRedirect(request.getHeader("Referer"));
%>
</body>
</html>