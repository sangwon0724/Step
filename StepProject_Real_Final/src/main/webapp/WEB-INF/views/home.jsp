<%@page import="com.control.vo.FratingVO"%>
<%@page import="com.control.dao.FratingDAO"%>
<%@page import="com.control.vo.FestivalVO"%>
<%@page import="com.control.dao.FestivalDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>STEP</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet" type="text/css">
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/images/stepIcon.png">
</head>
<body class="landing">
    <!-- Header -->
			<header id="header" class=" alt skel-layers-fixed">
				<h1><a href="/">Step</a></h1>
				<a href="#nav">Menu</a>
			</header>

		<!-- Nav -->
			<nav id="nav">
				<ul class="links">
					<li><a href="/">Home</a></li>
					<li><a href="/festivals/list?category=all">Festivals</a></li>
					<li><a href="/community/list">Community</a></li>
					<li><a href="/Review/list">Review</a></li>
					<% if(session.getAttribute("ID") == null)
                        {
                    %>
                    <br>
					<li>Guest 님 환영합니다.</li>
					<li><a href="/log/login">Login</a></li>
					<%
					}
					else
					{%>
					<br>
					<li><%= session.getAttribute("NAME")%> 님</li>
					<li><a href="/log/logout">LogOut</a></li>
                    <li><a href="/log/mypage">MyPage</a></li>
					<%
							if(session.getAttribute("ID").equals("yuhan2020"))
							{
							%>
								<li><a href="/admin/apply_festival">Apply</a></li>
							<%
							}
                        }
                    %>
				</ul>
				<a href="#nav" class="close" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></a>
			</nav>

		<!-- Banner -->
		    <section id="banner">
				<form method="get" action="/festivals/search" accept-charset="utf-8">
					<div style="align:center; display:inline-block;">
						<input type="text" name="search" placeholder="검색할  단어를 입력하세요" style="width:300px">
						<ul class="actions">
							<li><input type="submit" class="button big special" value="search"/></li>
						</ul>
					</div>
				</form>
			</section>
			
			
			<!--  제목 패널 -->
			<header class="two_title_pannel">
				<div class="two_title"><span class="two_title_span">지금 핫한 축제가 궁금해?</span><hr></div>
			</header>
			
			<!-- Two -->
			<section id="two">
			
			<!-- 태그 상자와 랭크 상자 정렬용 -->
			<div class="two_top">
			
			<!-- 태그 상자 -->
			<div class="tag_pannel">
				<div class="tag_box">
					<div><span class="tag_link">#액티비티</span></div>
					<div><span class="tag_link">#문화</span></div>
					<div><span class="tag_link">#음악</span></div>
					<div><span class="tag_link">#자연</span></div>
				</div>
			</div>
	
			<!-- 행사 종류별 인기 순위 부분 (네이버 웹툰 순위표 참고) -->
			<div class="rank_list">
				<header class="rank_title">
					<span class="rl_title"><span>최근 여기가 HOT하다!!! TOP 10</span></span>
				</header>
				<main class="rank_list_main">
				<!-- 반복 시작 -->
				<%
					FratingDAO trip_rank=new FratingDAO();
					FratingVO vo_rank;
					FestivalDAO fdao_r=new FestivalDAO();
					FestivalVO fvo_r;
				
					trip_rank.setallrating();
					
					int num;
					if(trip_rank.list.size()<10){
						num=trip_rank.list.size();
					}
					else{
						num=10;
						
					}
					
					
					for(int i=0;i<num;i++){
						if(trip_rank.list.size()>i){
							vo_rank=trip_rank.list.get(i);
							fdao_r.setOneFestival(vo_rank.getFno());
							fvo_r=fdao_r.list.get(0);
						}
						else{
							fvo_r=new FestivalVO();
							
							fvo_r.setFname("");
							fvo_r.setTitle_image("");
							fvo_r.setGrade_num(1);
							fvo_r.setGrade_total(0.0);
							fvo_r.setGrade();
							fvo_r.setViews(0);
						}
						
				%>
					<div class="recommend recommend_none">
						<header class=" recommend_header">
							<div class="recommend_header_rank"><span><%=i+1 %></span></div>
							<span class="recommend_header_span"><%=fvo_r.getFname() %></span>
						</header>
						<main class="recommend_main img_cover"  style="background-image: url('${pageContext.request.contextPath}/resources/images/<%=fvo_r.getTitle_image() %>');" onclick="goto_info('<%=fvo_r.getFno()%>')"></main>
						<footer class="recommend_footer">
							<i class="fas fa-star"></i><span><%=fvo_r.getGrade() %></span>
							<i class="far fa-eye"></i><span><%=fvo_r.getViews() %></span>
						</footer>
					</div>
					<%
					}
					%>
				<!-- 반복 종료 -->
				</main>
				<footer class="rank_list_footer">
					<div class="recommend_show_left"><i class="fas fa-chevron-left"></i></div>
					<div class="recommend_show_right"><i class="fas fa-chevron-right"></i></div>
					<div class="recommend_show_start"><i class="fas fa-play"></i></div>
					<div class="recommend_show_stop"><i class="fas fa-square-full"></i></div>
				</footer>
			</div>
			
			</div>
			
			<!-- two_top 종료 부분 -->
			
			<!-- 계절별 축제 리스트 상자-------------------------------------------------------------------------->
			<%
				FestivalDAO trip=new FestivalDAO();
				FestivalVO vo;
			%>
			<div class="season_fes_list">
				<header class="season_title"><span>어떤 계절을 원해?</span></header>
				<header class="season_tap">
					<div class="season_tap_box stb_1"><span class="stb_title">#봄</span></div>
					<div class="season_tap_box stb_2"><span class="stb_title">#여름</span></div>
					<div class="season_tap_box stb_3"><span class="stb_title">#가을</span></div>
					<div class="season_tap_box stb_4"><span class="stb_title">#겨울</span></div>
				</header>
				<main class="season_fes_main">
				<%for (int i=1; i<=4; i++){%>
					<div class="sfm sfm_<%=i %> sfm_none">
					<% 
						trip.searchBySeason(i); //계절별 축제 탐색
					  	trip.order_asc("sdate");
					%>
						<div class="sfm_grid_<% if(trip.list.size()>5){out.print(5);}else{out.print(trip.list.size());}%>">
							<%
								if(trip.list.size()>0){
								for(int j=0;j<trip.list.size();j++){//이 부분에서 축제 개수 필요
								if(j==5) break;
								vo=trip.list.get(j);
							%>
								<div class="sfm_grid_cell_<%=j+1 %>">
									<div class="sfm_cell_img img_cover" style="background-image: url('${pageContext.request.contextPath}/resources/images/<%=vo.getTitle_image()%>');" onclick="goto_info('<%=vo.getFno()%>')">
										<div class="sfm_cell_info">
											<div class="sfm_cell_name"><span><%=vo.getFname() %></span></div>
											<div class="sfm_cell_date"><span>(<%=vo.getSdate() %> ~ <%=vo.getEdate() %>)</span></div>
											<div class="sfm_cell_area"><span><%=vo.getBig_area() %>&nbsp;<%=vo.getSmall_area() %></span></div>
										</div>
									</div>
								</div>
							<%
								}
							}//if (trip.list.size()>0)
							else{
								//개수가 0인 경우
								%>
								<div class="sfm_grid_0">
									<div class="sfm_grid_cell_0">
										<span>축제가 없습니다.</span>
									</div>
								</div>
								<%
							}
							%>
						</div>
					</div>
				<% } %>
					
				</main>
			</div>
			
			<!-- 월별 축제 상자-------------------------------------------------------------------------------->
			<%
				FestivalDAO trip2=new FestivalDAO();
				FestivalVO vo2;
			%>
			<div class="monthly_fes_pannel">
					<header class="monthly_fes_title"><span>나는 이 달에 놀러가고싶어 ~</span></header>
					<header class="monthly_fes_header">
						<div class="monthly_fes_ctrl">
						<span class="move_left mfm_ctrl"><</span>
						<span class="monthly_span">몇월?</span>
						<span class="move_right mfm_ctrl">></span>
						</div>
					</header>
					<main class="monthly_fes_main">
					<% for(int j=1;j<=12;j++){ %>
						<div class="mfm mfm_<%=j %> mfm_none">
							<%
								trip2.searchByMonth(j); //계절별 축제 탐색
								trip2.order_asc("sdate");
							%>
							<div class="mfm_grid_<% if(trip2.list.size()>5){out.print(5);}else{out.print(trip2.list.size());}%>">
							<%
								if(trip2.list.size()>0){
								for(int i=0;i<trip2.list.size();i++){//이 부분에서 축제 개수 필요
								if(i==5) break;
								vo2=trip2.list.get(i);
							%>
								<div class="mfm_grid_cell_<%=i+1 %>">
									<div class="mfm_cell_img img_cover" style="background-image: url('${pageContext.request.contextPath}/resources/images/<%=vo2.getTitle_image()%>');" onclick="goto_info('<%=vo2.getFno()%>')">
										<div class="mfm_cell_info">
											<div class="mfm_cell_name"><span><%=vo2.getFname() %></span></div>
											<div class="mfm_cell_date"><span>(<%=vo2.getSdate() %> ~ <%=vo2.getEdate() %>)</span></div>
											<div class="mfm_cell_area"><span><%=vo2.getBig_area() %>&nbsp;<%=vo2.getSmall_area() %></span></div>
										</div>
									</div>
								</div>
							<%
								}
							}//if (trip2.list.size()>0)
							else{
								//개수가 0인 경우
								%>
								<div class="mfm_grid_0">
									<div class="mfm_grid_cell_0">
										<span>축제가 없습니다.</span>
									</div>
								</div>
							<%
							}
							%>
							</div>
						</div>
					<%
						}
					%>
					</main>
				</div>
				
		</section>
		
	<!-- Contents -->
			<section id="one" class="wrapper style1">
				<div class="inner">	
					<!-- 홍보 문의 -->
					<article class="feature right">
						<span class="image"><img src="${pageContext.request.contextPath}/resources/images/Communicate.jpg" alt="" /></span>
						<div class="content">
							<h2>홍보문의</h2>
							<p>축제관계자께서 홍보해주셨으면 하는 축제를 저희에게 알려주세요 !</p>
							<ul class="actions">
								<li>
								<% if(session.getAttribute("ID") == null)
                        			{
                   				 %>
									<a href="/log/login" class="button alt">More</a>
								<% 	
								}
									else
									{ %>
									<a href="/festivals/regist" class="button alt">More</a>
								<%  } %>
								</li>
							</ul>
						</div>
					</article>
				</div>
			</section>
	<!-- Footer -->
			<footer id="footer">
				<%@ include file="include/footer.jsp" %>
			</footer>


	<!-- Scripts -->
	<script src="../../../../resources/js/home.js"></script>
	<script src="https://kit.fontawesome.com/34a8d510cf.js" crossorigin="anonymous" ></script>
	<script src="<c:url value="/resources/js/jquery.min.js" />"></script>
	<script src="../../../../resources/js/skel.min.js"></script>
	<script src="<c:url value="/resources/js/util.js" />"></script>
	<script src="<c:url value="/resources/js/main.js" />"></script>
</body>
</html>
