<%@page import="com.control.vo.FestivalApplyVO"%>
<%@page import="com.control.dao.FestivalApplyDAO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet">
	<meta charset="UTF-8">
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/images/stepIcon.png">
<title>축제 승인 | STEP</title>
</head>
	<style>
		.ok {	
			width:60%;
			text-align:center;
			margin: 0 auto;
		}
		table{
			text-align:left;
		}
		
		/* 게시글 수 */
		.review_count{width: 100%; height: 10vh; display: flex; padding-left: 2vw; align-items: center;}
		.review_count>span:nth-child(odd) { color: black; font-size: 17px; font-weight: bold;}
		.review_count>span:nth-child(2) {  color: #0984e3; font-size: 25px; font-weight: bold; margin: 0 3px;}
	</style>
<body>
		<%
			FestivalApplyDAO trip=new FestivalApplyDAO();
			FestivalApplyVO vo;
			List<String> tags;
			trip.setallFestival();
		%>
		<!-- Header -->
			<header id="header" class="skel-layers-fixed">
				<h1><a href="/">Step</a></h1>
				<a href="#nav">Menu</a>
			</header>

		<!-- Nav -->
			<%@ include file="../include/nav.jsp" %>

		<!-- Main -->
    	<section id="main" class="wrapper">
				<div class="container">
                    <section>
                        <form method="post" action="write">
                            <div>
                                <h3>홍보문의</h3>
                                <hr />
								 <header class="review_count"><span>총 게시물 : </span><span><%=trip.list.size() %></span><span>개</span></header>
								 <br><br>
								<div class="ok">
								<%
								for(int i=0;i<trip.list.size();i++){
									vo=trip.list.get(i);
								%>
									<table>
										<tr>
											<td>번호 : <%out.println(vo.getNo());	%> </td>
											<td>등록일 : <%out.println(vo.getRdate().toString());	%> </td>
										</tr>
										<tr>
											<td colspan="2">행사명 : <%out.println(vo.getFname());	%></td>
										</tr>
										<tr>
											<td colspan="2">소개 <%out.println(vo.getText());	%></td>
										</tr>
										<tr>
											<td>지역대분류 : <%out.println(vo.getBig_area()); %></td>
											<td>지역소분류 : <%out.println(vo.getSmall_area()); %></td>
										</tr>
										<tr>
											<td>시작일 : <%out.println(vo.getSdate().toString()); %></td>
											<td>종료일 : <%out.println(vo.getEdate().toString()); %></td>
										</tr>
										<tr>
											<td colspan="2">태그(리스트형태) : <%
												tags=vo.getTags();
												for(String item :tags){
													out.println(item+" ");
												}
												%>
											</td>
										</tr>
										<tr>
											<td colspan="2">신청자이메일 : <%out.println(vo.getEmail()); %></td>
										</tr>
									</table>
									<div>
										승인여부<a href="/admin/apply_festivalDB?no=<%=vo.getNo()%>&checkcode=Y">수락 </a>, <a href="/admin/apply_festivalDB?no=<%=vo.getNo()%>&checkcode=N">거절</a>
									<br><br>	
									</div>
												<hr/>
											<%
											}	
										%>
									</div>
								</div>
                            </div>
                        </form>
                     </section>
                 </div>
        </section>
		<!-- Footer -->
			<footer id="footer">
				<%@ include file="../include/footer.jsp" %>
			</footer>
	
	<!-- Scripts -->
	<script src="../../../../resources/js/jquery.min.js"></script>
	<script src="../../../../resources/js/skel.min.js"></script>
	<script src="../../../../resources/js/util.js"></script>
	<script src="../../../../resources/js/main.js"></script>


</body>
</html>