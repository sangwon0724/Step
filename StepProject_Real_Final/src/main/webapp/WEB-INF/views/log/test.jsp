<%@page import="com.control.connector.*"%>

<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	값 1 : ${test } <br/> 값 2 : ${test }<br/>

	<%=request.getParameter("test") %>sdfasd
	
</body>
</html>