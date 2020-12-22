<%@page import="com.control.vo.CommunityVO"%>
<%@page import="com.control.vo.ReviewVO"%>
<%@page import="com.control.dao.CommunityDAO"%>
<%@page import="com.control.dao.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet">
	<meta charset="UTF-8">
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/images/stepIcon.png">
<title>마이페이지</title>
</head>
<body>
<!-- Header -->
			<header id="header" class="skel-layers-fixed">
				<h1><a href="/">Step</a></h1>
				<a href="#nav">Menu</a>
			</header>

		<!-- Nav -->
			<%@ include file="../../include/nav.jsp" %>
		<!-- Main -->
			<section id="main" class="wrapper">
				<div class="container">
                    <section>
						<form id="form1" runat="server">
							<h2><%= session.getAttribute("ID")%> 님</h2>
							<hr>
							<aside>
								<%@ include file="../../include/aside.jsp" %>
							</aside>
							<div>
								<table style="width:70%;">
									<tr style="text-align:center;">
										<td width="20%">게시판</td>
										<td width="50%">제목</td>
										<td width="20%">작성일</td>
										<td width="10%">조회수</td>
									</tr>
				<!------------------------------------ 커뮤니티 게시글 시작 --------------------------------------------->
									<tr align="center" bgcolor="#FFFFFF" height="30">
									<td colspan="4">작성 커뮤니티 게시글</td>
									</tr>
									<%
									CommunityDAO cdao=new CommunityDAO();
									CommunityVO cvo=new CommunityVO();
									cdao.setIdCommunity(session.getAttribute("ID").toString());									
									if(cdao.list.size()==0){
										%>
										<tr align="center" bgcolor="#FFFFFF" height="30">
										<td colspan="4">작성한 게시물이 없습니다</td>
										</tr>
										<%										
									}
									else{
										for(int i=0;i<cdao.list.size();i++){
											cvo=cdao.list.get(i);
											%>
											<tr align="center" bgcolor="#FFFFFF" height="30">
											<td></td>
											<td><a href="/community/view?no=<%=cvo.getNo() %>"><%= cvo.getTitle()%></a></td>
											<td><%=cvo.getSigndate()%></td>
											<td><%=cvo.getViews()%></td>								
											</tr>
											
											<% 
										}
										
									}
									%>
				<!------------------------------------ 커뮤니티 게시글 종료 --------------------------------------------->
				<!------------------------------------ 리뷰 게시글 시작 ----------------------------------------------->
									<tr align="center" bgcolor="#FFFFFF" height="30">
										<td colspan="4">작성 리뷰 게시글</td>
										</tr>
									<%
									ReviewDAO rdao=new ReviewDAO();
									ReviewVO rvo = new ReviewVO();
									rdao.setIdReview(session.getAttribute("ID").toString());
									if(rdao.list.size()==0){
										%>
										<tr align="center" bgcolor="#FFFFFF" height="30">
										<td colspan="4">작성한 리뷰가 없습니다</td>
										</tr>
										<%										
									}
									else{
										for(int i=0;i<rdao.list.size();i++){
											rvo=rdao.list.get(i);
											%>
											<tr align="center" bgcolor="#FFFFFF" height="30">
											<td></td>
											<td><a href="/Review/view?no=<%=rvo.getNo() %>"><%= rvo.getTitle()%></a></td>
											<td><%=rvo.getRdate()%></td>
											<td><%=rvo.getViews()%></td>								
											</tr>
											<% 
										}
									}
									%>
				<!------------------------------------ 리뷰 게시글 종료 ----------------------------------------------->
								</table>
							</div>
						</form>
						</section>
                 </div>
    		</section>
    		<br><br><br><br><br><br><br>
    <!-- Footer -->
			<footer id="footer">
				<%@ include file="../../include/footer.jsp" %>
			</footer>

	<!-- Scripts -->
	<script src="../../../../resources/js/jquery.min.js"></script>
	<script src="../../../../resources/js/skel.min.js"></script>
	<script src="../../../../resources/js/util.js"></script>
	<script src="../../../../resources/js/main.js"></script>
</body>
</html>