<%@page import="com.control.vo.CcommentVO"%>
<%@page import="com.control.dao.CcommentDAO"%>
<%@page import="com.control.vo.RcommentVO"%>
<%@page import="com.control.dao.RcommentDAO"%>
<%@page import="com.control.vo.FcommentVO"%>
<%@page import="com.control.dao.FcommentDAO"%>
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
									<%--
										if(size()==0) {
										--%>
									<tr align="center" bgcolor="#FFFFFF" height="30">
										<td colspan="4">작성 한줄평</td>
										</tr>
									<%
									FcommentDAO fcdao=new FcommentDAO();
									FcommentVO fcvo = new FcommentVO();
									fcdao.setidfcomment(session.getAttribute("ID").toString());
									if(fcdao.list.size()==0){
										%>
										<tr align="center" bgcolor="#FFFFFF" height="30">
										<td colspan="4">작성한 한줄평이 없습니다</td>
										</tr>
										<%										
									}
									else{
										for(int i=0;i<fcdao.list.size();i++){
											fcvo=fcdao.list.get(i);
											%>
											<tr align="center" bgcolor="#FFFFFF" height="30">
											<td></td>
											<td><a href="/festival/info?fno=<%=fcvo.getFno() %>"><%= fcvo.getText()%></a></td>
											<td><%=fcvo.getRdate()%></td>
											<td></td>																
											</tr>
											
											<% 
										}
										
									}
									%>
									<tr align="center" bgcolor="#FFFFFF" height="30">
									<td colspan="4">작성 리뷰댓글</td>
									</tr>
									<%
									RcommentDAO rcdao=new RcommentDAO();
									RcommentVO rcvo = new RcommentVO();
									rcdao.setidrcomment(session.getAttribute("ID").toString());
									if(rcdao.list.size()==0){
										%>
										<tr align="center" bgcolor="#FFFFFF" height="30">
										<td colspan="4">작성한 리뷰댓글이 없습니다</td>
										</tr>
										<%										
									}
									else{
										for(int i=0;i<rcdao.list.size();i++){
											rcvo=rcdao.list.get(i);
											%>
											<tr align="center" bgcolor="#FFFFFF" height="30">
											<td></td>
											<td><a href="/Review/view?no=<%=rcvo.getRno() %>"><%= rcvo.getText()%></a></td>
											<td><%=rcvo.getRdate()%></td>
											<td></td>																
											</tr>
											
											<% 
										}
										
									}
									%>
									
									
									<tr align="center" bgcolor="#FFFFFF" height="30">
									<td colspan="4">작성 리뷰댓글</td>
									</tr>
									<%
									CcommentDAO ccdao=new CcommentDAO();
									CcommentVO ccvo = new CcommentVO();
									ccdao.setidccomment(session.getAttribute("ID").toString());
									if(ccdao.list.size()==0){
										%>
										<tr align="center" bgcolor="#FFFFFF" height="30">
										<td colspan="4">작성한 커뮤니티댓글이 없습니다</td>
										</tr>
										<%										
									}
									else{
										for(int i=0;i<ccdao.list.size();i++){
											ccvo=ccdao.list.get(i);
											%>
											<tr align="center" bgcolor="#FFFFFF" height="30">
											<td></td>
											<td><a href="/community/view?no=<%=ccvo.getCno() %>"><%= ccvo.getText()%></a></td>
											<td><%=rcvo.getRdate()%></td>
											<td></td>																
											</tr>
											
											<% 
										}
										
									}
									%>
									 
									 
									
								 		
								 	
								 	<%--
								 	} else {
								 		for(int i=0;i<dao.list.size();i++){
								 			vo=dao.list.get(i);
								 			--%>
								 	<tr height="25" align="center">
										<td><%--= vo.getNo() --%></td>
										<td align="left"><a href="view?no=<%--=vo.getNo() --%>"><%--= vo.getTitle()--%></a></td>
										<td align="center"><%--=vo.getSigndate() --%></td>
										<td align="center"><%--=vo.getViews() --%></td>
									</tr>							 			
								 			<%--
								 		}	
								 	}
									--%>
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