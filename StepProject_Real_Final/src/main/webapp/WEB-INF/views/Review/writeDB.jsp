<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=request.getAttribute("title")%>
<%=request.getAttribute("id")%>
<%=(String)request.getAttribute("editordata")%>

<%response.sendRedirect("./list?fno="+request.getParameter("fno")); %>

</body>
</html>