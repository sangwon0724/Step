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
	
	response.sendRedirect("/");
	 %>
	<!-- <script>alert("로그인 하셨습니다.");window.history.go(-1)</script> --> 
    <!-- 앞에 메시지는 삭제해도 됨 이거 쓰면 세션 적용 안된 메인으로 돌아가서 새로고침해야 로그인 된걸로 뜸 -->
	
</html>