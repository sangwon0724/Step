<%@page import="com.control.vo.CcommentVO"%>
<%@page import="com.control.dao.CcommentDAO"%>
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
<% if(session.getAttribute("ID") != null) 
   {
%>
<form action="./commentDB?no=<%=request.getParameter("no")%>">
	<div class="comment_form">
		<header class="comment_form_header">
			<span>&nbsp;
				<%=session.getAttribute("NAME")%>&nbsp;(<%=session.getAttribute("ID")%>)
			</span>
		</header>
		<textarea name="comment_text" class="comment_text"></textarea>
		<input type="hidden" name="no" value="<%=request.getParameter("no") %>">		
		<input type="hidden" name="id" value="<%=session.getAttribute("ID")%>"> 
		<input type="submit" value="등록" class="comment_submit" />
	</div>
</form>
<% } %>
	<!-- 반복 시작할 곳 -->
		<!-- DAO 처리 -->
		<%
		//FcommentDAO dao =new FcommentDAO();
		//FcommentVO vo = new FcommentVO();
		
		/*dao.setfestivalfcomment(request.getParameter("fno"));
		if(dao.list.size()==0){*/
			%>
			
		<%	
		/*}
		
		else{
		for(int i=0;i<dao.list.size();i++){
			vo=dao.list.get(i);	*/	

			%>
			
	
			<%-- DAO 설정 시작--%>
					<% 
						CcommentDAO cdao;
						CcommentVO cvo;
						
						cdao=new CcommentDAO();
						cdao.setccomment(Integer.parseInt((request.getParameter("no"))));
						
					%>
						<%-- DAO 설정 종료 --%>
						<!-- 반복 시작 -->
						<%

						
						if(cdao.list.size()==0){
						%>
							<div class="comment_none">
							<span>작성된 댓글이 없습니다.</span>
							</div>	
						<%
						}
						
						else{
						for(int i=0;i<cdao.list.size();i++){
							cvo=cdao.list.get(i);		
							
							%>
						<div class="comments">
							<header><span>작성자 : <%=cvo.getId() %></span></header>
							<main><span><%=cvo.getText() %></span></main>
							<footer><span>작성 시간 : <%=cvo.getRdate() %></span></footer>
						</div>
						<%	
							}
						}
						%>
					<!-- 반복 종료 -->
	
		<%	
			//}
		//}
		 %>
	<!-- 반복 종료 할 곳 -->
	
<div class="blank"></div>  <!-- 공간 짤리는 문제 해결용 -->
	
	<script src="https://kit.fontawesome.com/34a8d510cf.js" crossorigin="anonymous" ></script>
</body>
</html>