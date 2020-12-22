<%@page import="java.beans.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.control.vo.FestivalVO"%>
<%@page import="com.control.dao.FestivalDAO"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link href="${pageContext.request.contextPath}/resources/css/swiper-bundle.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet">
	<meta charset="UTF-8">
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/images/stepIcon.png">
<title>통합검색결과 | STEP</title>
</head>
<body>
		<!-- Header -->
			<header id="header" class="skel-layers-fixed">
				<h1><a href="/">Step</a></h1>
				<a href="#nav">Menu</a>
			</header>

		<!-- Nav -->
			<%@ include file="../include/nav.jsp" %>
						
			<!-- 검색되어서 건너온 값 설정  -->
			<% String searchText=request.getParameter("search"); if(searchText.equals(null)){searchText="없어";}%>
			
			
			<%
					FestivalDAO trip=new FestivalDAO();
					FestivalVO vo;
					
					String order=request.getParameter("order");
					
					//정렬하기
					if(order==null){
						trip.searchByWord(searchText);
						trip.order_desc("rdate");
					}
					else{
						trip.searchByWord(searchText);
						trip.order_desc(order);
					}
			%>
			
			<!-- Content -->	
			<section class="search_section">
				<header class="search_form_pannel">
					<!-- 검색 부분 -->
					<form method="get" name="searchForm" action="/festivals/search" accept-charset="utf-8">
							<table class="search_input_table">
								<colgroup>
          					 	 	<col width="90%" />
            						<col width="10%" />
								</colgroup>
								<tr style="background-color: white;">
									<td class="search_input">
										<input type="text" name="search" placeholder="검색할  단어를 입력하세요" value="<%= searchText %>" class="search_input_text" style="background-color: white; border: none; width: 100%; height: 100%;">
									</td>
									<td class="search_submit"><i class="fas fa-search"></i></td></tr>
							</table>
					</form>
				</header>
				<header class="search_guide_pannel">
						<span class="search_guide_text">입력하신 <span class="search_guide_text_point"><%= searchText %></span> 에 대한 검색 결과입니다.</span>
				</header>
				<header class="search_setting_pannel">
				<div class="search_fes_count"> 총&nbsp;<span class="tfc_span"><%=trip.list.size()%></span>&nbsp;건</div>
				<div class="search_fes_order">
					<span class="sfo_rdate">최근 등록순</span>
					&nbsp;|&nbsp;
					<span class="sfo_views">조회순</span>
					&nbsp;|&nbsp;
					<span class="sfo_grade">평점순</span>
				</div>
				</header>
				<!--										 본문 내용                                  					 -->
				<main class="search_resultPannel">
				
						<%
						if(trip.list.size()==0){out.println("<br>검색하신 결과가 존재하지 않습니다.");}
						else{
					for(int i=0;i<trip.list.size();i++){
						vo=trip.list.get(i);
						%>
							<div class="search_fes_info">
								<div class="sfi_image_pannel" onclick="goto_info('<%=vo.getFno()%>')" style="background-image: url('${pageContext.request.contextPath}/resources/images/<%=vo.getTitle_image()%>');"></div>
								<div class="sfi_info_pannel">
									<div class="sfi_text_top_line">
										<div class="sfi_text_name"><span onclick="goto_info('<%=vo.getFno()%>')"><%=vo.getFname() %></span></div>
										<div class="sfi_text_views"><span><span class="sfi_text_views_bold">조회수 : </span><%=vo.getViews()%></span></div>
									</div>
									<div class="sfi_not_link">
										<div class="sfi_text_date">[ <%=vo.getSdate() %> ~ <%=vo.getEdate() %> ]</div>
										<div class="sfi_text_content"><%=vo.getText() %></div>
										<div class="sfi_text_area">진행 지역 : <%=vo.getBig_area() %> <%=vo.getSmall_area() %></div>
										<div clas="sfi_text_grade">
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
										</div>
									</div>
								</div>
							</div>
						<%
					}
			}
			%>
				</main>
			</section>
			
		<!-- Footer -->
			<footer id="footer">
				<%@ include file="../include/footer.jsp" %>
			</footer>
			
	<script src="../../../../resources/js/search.js"></script>
	<script src="https://kit.fontawesome.com/34a8d510cf.js" crossorigin="anonymous" ></script>
	<script src="../../../../resources/js/jquery.min.js"></script>
	<script src="../../../../resources/js/skel.min.js"></script>
	<script src="../../../../resources/js/util.js"></script>
	<script src="../../../../resources/js/main.js"></script>
</body>
</html>