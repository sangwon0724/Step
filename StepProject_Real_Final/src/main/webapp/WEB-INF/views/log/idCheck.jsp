<%@page import="com.control.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name = "form1">

<% 
	String id = request.getParameter("id");
	UserDAO dao = new UserDAO();
	String result = dao.checkid(id);
	
	if(result == "yes") {
%>
	<center>
	<br/><br/>
	<h4>이미 사용중인 아이디 입니다.</h4>
	<input type="button" value="닫기" name="close" onclick="CLform()"/>
	</center>
	<%} else if(result == "no") { %>
	<center>
	<br/><br/>
	<h4><%= id %>는 사용 가능한 아이디입니다.</h4>
	<input type="button" value="닫기" name="close2" onclick="CLform2()"/>
	</center>
	<%} %>
	
	</form>
	<script type="text/javascript">
	function CLform(){
		window.close();
	}
	
	function CLform2(){
		window.close();
		

	}
	</script>
</body>
</html>