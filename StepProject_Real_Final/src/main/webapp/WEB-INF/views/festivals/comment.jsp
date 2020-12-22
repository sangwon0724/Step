
<%@page import="com.control.vo.FcommentVO"%>
<%@page import="com.control.dao.FcommentDAO"%>
<%@page import="java.beans.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.control.vo.FestivalVO"%>
<%@page import="com.control.dao.FestivalDAO"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta charset="UTF-8">
	<link href="${pageContext.request.contextPath}/resources/css/comment.css" rel="stylesheet">
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/images/stepIcon.png">
<title>리뷰 | STEP</title>
</head>
<body>
<%
	



%>
<% if(session.getAttribute("ID") != null) 
   {{
	FcommentDAO fcdao=new FcommentDAO();
	String disabled="";
	String disabledtext="";
	if(fcdao.checkfcomment(request.getParameter("fno"), session.getAttribute("ID").toString())=="Y"){
		disabled="disabled";
		disabledtext="이미 평가한 글은 평가할 수 없습니다.";
	};
%>
<form action="./commentDB?fno=<%=request.getParameter("fno")%>">
	<div class="comment_form">
		<header class="comment_form_header">
			<span>&nbsp;
				<%--request.getParameter("codeNo") --%>
				<%=session.getAttribute("NAME")%>&nbsp;(<%=session.getAttribute("ID")%>)
			</span>
			<select name="comment_grade" <%=disabled%>>
				<option value=5 selected>
					&#xf005;
					&#xf005;
					&#xf005;
					&#xf005;
					&#xf005;
				</option>
				<option value=4.5>
					&#xf005;
					&#xf005;
					&#xf005;
					&#xf005;
					&#xf5c0;
				</option>
				<option value=4>
					&#xf005;
					&#xf005;
					&#xf005;
					&#xf005;
				</option>
				<option value=3.5>
					&#xf005;
					&#xf005;
					&#xf005;
					&#xf5c0;
				</option>
				<option value=3>
					&#xf005;
					&#xf005;
					&#xf005;
				</option>
				<option value=2.5>
					&#xf005;
					&#xf005;
					&#xf5c0;
				</option>
				<option value=2>
					&#xf005;
					&#xf005;
				</option>
				<option value=1.5>
					&#xf005;
					&#xf5c0;
				</option>
				<option value=1>
					&#xf005;
				</option>
				<option value=0.5>
					&#xf5c0;
				</option>
				<option value=0>
					0점
				</option>
			</select>
		</header>
		<textarea name="comment_text" class="comment_text" <%=disabled%>><%=disabledtext %></textarea>
		<input type="hidden" name="fno" value="<%=request.getParameter("fno") %>">		
		<input type="hidden" name="id" value="<%=session.getAttribute("ID")%>"> 
		<input type="submit" value="등록" class="comment_submit" <%=disabled%> />
	</div>
</form>
<% } %>
	<!-- 반복 시작할 곳 -->
		<%
		FcommentDAO dao =new FcommentDAO();
		FcommentVO vo = new FcommentVO();
		
		dao.setfestivalfcomment(request.getParameter("fno"));
		if(dao.list.size()==0){
			%>
			<div class="comment_none">
				<span>작성된 한줄평이 없습니다.</span>
			</div>
		<%	
		}
		
		else{
		for(int i=0;i<dao.list.size();i++){
			vo=dao.list.get(i);		

			%>
			
	<div class="comments">
			<header>
				<span><%=vo.getName()%>&nbsp;(<%=vo.getId()%>)</span>
				<span>
				<% 
				double grade=vo.getGrade();
				if(grade==5.0){
					%>
					<i class="fas fa-star"></i>
					<i class="fas fa-star"></i>
					<i class="fas fa-star"></i>
					<i class="fas fa-star"></i>
					<i class="fas fa-star"></i>
				<%
				}
				else if(grade>=4.5){
					%>
					<i class="fas fa-star"></i>
					<i class="fas fa-star"></i>
					<i class="fas fa-star"></i>
					<i class="fas fa-star"></i>
					<i class="fas fa-star-half-alt"></i>
				<%
				}
				else if(grade>=4){
					%>
					<i class="fas fa-star"></i>
					<i class="fas fa-star"></i>
					<i class="fas fa-star"></i>
					<i class="fas fa-star"></i>
					<i class="far fa-star"></i>
				<%
				}
				else if(grade>=3.5){
					%>
					<i class="fas fa-star"></i>
					<i class="fas fa-star"></i>
					<i class="fas fa-star"></i>
					<i class="fas fa-star-half-alt"></i>
					<i class="far fa-star"></i>
				<%
				}
				else if(grade>=3){
					%>
					<i class="fas fa-star"></i>
					<i class="fas fa-star"></i>
					<i class="fas fa-star"></i>
					<i class="far fa-star"></i>
					<i class="far fa-star"></i>
				<%
				}
				else if(grade>=2.5){
					%>
					<i class="fas fa-star"></i>
					<i class="fas fa-star"></i>
					<i class="fas fa-star-half-alt"></i>
					<i class="far fa-star"></i>
					<i class="far fa-star"></i>
				<%
				}
				else if(grade>=2){
					%>
					<i class="fas fa-star"></i>
					<i class="fas fa-star"></i>
					<i class="far fa-star"></i>
					<i class="far fa-star"></i>
					<i class="far fa-star"></i>
				<%
				}
				else if(grade>=1.5){
					%>
					<i class="fas fa-star"></i>
					<i class="fas fa-star-half-alt"></i>
					<i class="far fa-star"></i>
					<i class="far fa-star"></i>
					<i class="far fa-star"></i>
				<%
				}
				else if(grade>=1){
					%>
					<i class="fas fa-star"></i>
					<i class="far fa-star"></i>
					<i class="far fa-star"></i>
					<i class="far fa-star"></i>
					<i class="far fa-star"></i>
				<%
				}
				else if(grade>=0.5){
					%>
					<i class="fas fa-star-half-alt"></i>
					<i class="far fa-star"></i>
					<i class="far fa-star"></i>
					<i class="far fa-star"></i>
					<i class="far fa-star"></i>
				<%
				}
				else{
					%>
					<i class="far fa-star"></i>
					<i class="far fa-star"></i>
					<i class="far fa-star"></i>
					<i class="far fa-star"></i>
					<i class="far fa-star"></i>
				<%
				}
				%>
				</span>
			</header>
			<main>
			<div><%=vo.getText()%><br><br>등록일 <%=vo.getRdate()%></div>
			</main>
			</div>
		<%	}
			}
		}
		 %>
		 
	<!-- 반복 종료 할 곳 -->
	
<div class="blank"></div>  <!-- 공간 짤리는 문제 해결용 -->
	
	<script src="https://kit.fontawesome.com/34a8d510cf.js" crossorigin="anonymous" ></script>
</body>
</html>