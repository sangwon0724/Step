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
%>
text : <%=text %><br>

<%
response.sendRedirect(request.getHeader("Referer"));
%>
</body>
</html>