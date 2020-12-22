<%@page import="com.control.vo.ReviewVO"%>
<%@page import="com.control.dao.ReviewDAO"%>
<%@page import="java.beans.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.control.vo.FestivalVO"%>
<%@page import="com.control.dao.FestivalDAO"%>
<%@page import="java.util.List"%> <!-- 상세 정보 패널 최하단의 태그용 -->
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link href="${pageContext.request.contextPath}/resources/css/swiper-bundle.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet">
	<meta charset="UTF-8">
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/images/stepIcon.png">
<title>여행 정보 | STEP</title>
</head>
<body>

		<!-- Header -->
			<header id="header" class="skel-layers-fixed">
				<h1><a href="/">Step</a></h1>
				<a href="#nav">Menu</a>
			</header>

		<!-- Nav -->
			<%@ include file="../include/nav.jsp" %>
		<!-- page move -->
		<div class="info_ctrl">
			<div class="info_ctrl_screen">
				<div class="info_ctrl_line"><span>● TOP</span></div>
				<div class="info_ctrl_line"><span>● 미리보기</span></div>
				<div class="info_ctrl_line"><span>● 상세정보</span></div>
				<div class="info_ctrl_line"><span>● 한줄평</span></div>
				<div class="info_ctrl_line"><span>● 추천축제</span></div>
				<div class="info_ctrl_line"><span>● 리뷰목록</span></div>
			</div>
		</div>
			
		<!-- Data Setting -->
		<% 
			String fno=request.getParameter("fno"); 
		
			FestivalDAO trip=new FestivalDAO();
			FestivalVO vo;
			trip.setOneFestival(fno);
			
			vo=trip.list.get(0);
		%>
		
		<!-- Content -->	
		<section class="info_section">
		
			<!-- 기본 정보  -->
			<article class="info_basic_paneel">
				<div class="ib_basic_name"><span><%=vo.getFname() %></span></div>
				<div class="ib_basic_area"><span><%=vo.getBig_area() %> <%=vo.getSmall_area() %></span></div>
				<%
					//동일 지역 축제 패널용
					String settingAreaStr=vo.getBig_area(); 
				%>
				<div class="ib_basic_other">
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
				<span>조회수 : <%=vo.getViews() %></span></div>
			</article>
			
			<!-- 사진 미리보기 -->
			<article class="info_picture_pannel">
				<header class="info_picture_header"><span>사진 미리보기</span></header>
				<main class="info_picture_main">
					<div class="swiper-container swc_picture">
      					<div class="swiper-wrapper">
      						<%
      							for(int i=1;i<=10;i++){
      								%>
      								<div class="ipm_picture_box swiper-slide" style="background-image: url('${pageContext.request.contextPath}/resources/images/fes_A<%=i %>.jpg');"></div>
      								<%
      							}
      						%>
     					 </div>
    					 <div class="swiper-pagination"></div>
     					 <div class="swiper-button-next sbn_picture"></div>
     					 <div class="swiper-button-prev sbp_picture"></div>
    				</div>
				</main>
			</article>
		
			<!-- 상세 정보 -->
			<article class="info_detail_pannel">
				<header class="info_detail_header"><span>축제 정보</span></header>
				<main class="info_detail_main">
					<div class="info_detail_intro"><%=vo.getText() %><br></div>
					<div class="info_detail_map">
						<% if(vo.getLoaction_image()==null) {vo.setLoaction_image("online.png");}%>
						<div class="img_cover" style="background-image: url('${pageContext.request.contextPath}/resources/images/<%=vo.getLoaction_image()%>');"></div>
					</div>
					<div class="info_detail_other">
						<div>시작일: <%=vo.getSdate() %></div>
						<div>종료일: <%=vo.getEdate() %></div>
						<div>축제 홈페이지 : <a href="<%=vo.getUrl() %>"><%=vo.getUrl() %></a></div>
						<div>축제 장소 : <%=vo.getLocation()%></div>
					</div>
					<div class="info_detail_tag">
						<%List<String> tags;
						tags=vo.getTags();
						for(String item :tags){
							if(!item.equals("")){
								switch(item){
									case "액티비티":
										out.println("<div class='idt_box idt_activity'><span># "+item+"</span></div>");
										break;
									case "문화":
										out.println("<div class='idt_box idt_culture'><span># "+item+"</span></div>");
										break;
									case "음악":
										out.println("<div class='idt_box idt_music'><span># "+item+"</span></div>");
										break;
									case "자연":
										out.println("<div class='idt_box idt_nature'><span># "+item+"</span></div>");
										break;
									default:
										out.println("<div class='idt_box'><span># "+item+"</span></div>");
										break;
								}
							}
						} %>
					</div>
				</main>
			</article>
			
			<!-- 한줄평 -->
			<article class="info_review_pannel">
				<header class="info_review_header"><span>한줄평</span>
				
				<% if(session.getAttribute("ID") == null) 
                        {
                        %>
                        	<span class="go_review" onclick="go_login()">리뷰 남기기 ▶</span>
                        <%
                        }else{%>
                        	<span class="go_review" onclick="go_review('<%=fno%>')">리뷰 남기기 ▶</span>
                        <%} %>
                </header>
				<main class="info_review_main">
					<iframe id="info_review_iframe" width="100%" height="auto" scrolling="no"></iframe>
				</main>
			</article>
		
			<!-- 추천 축제 -->
			<article class="info_recommend_pannel">
				<!-- 같은 지역의 축제 -->
				<div class="info_same_area_fes_pannel">
					<header class="isa_header"><span>같은 지역의 축제</span></header>
					<main class="isa_main">
						<div class="swiper-container swc_area">
      						<div class="swiper-wrapper">
      							<%
      								trip.setAreaTrip(settingAreaStr);
      								for(int i=0;i<trip.list.size();i++)
      								{
      									vo=trip.list.get(i);
      									if(!fno.equals(vo.getFno())){
									%>
       									 <div class="swiper-slide">
       									 	<div class="isa_fes_box img_cover" style="background-image: url('${pageContext.request.contextPath}/resources/images/<%=vo.getTitle_image()%>');" onclick="goto_info('<%=vo.getFno()%>')">
												<div class="info_cover_menu">
													<div class="icm_date"><span><%=vo.getSdate() %> ~ <%=vo.getEdate() %></span></div>
													<div class="icm_name"><span><%=vo.getFname() %></span></div>
												</div>
											</div>
       									 </div>
       								<%
										}
									} 
								%>
      							</div>
     							<div class="swiper-button-next sbn_area"></div>
    							<div class="swiper-button-prev sbp_area"></div>
   						</div>
					</main>
				</div>
				
				<!-- 카테고리별 시험 -->
				<%
						for(String item :tags){
						if(item.equals("액티비티")){
				%>
					<div class="info_same_category_fes_pannel">
					<header class="isc_header"><span>이런 체험들은 어떠신가요?</span></header>
					<main class="isc_main">
    							<div class="swiper-container swc_activity">
      								<div class="swiper-wrapper">
      								<%
									trip.searchByTag("액티비티","전체","전체");
      								trip.order_desc("rdate");
      								
									for(int i=0;i<trip.list.size();i++)
									{
										vo=trip.list.get(i);
										if(!fno.equals(vo.getFno())){
									%>
       									 <div class="swiper-slide">
       									 	<div class="isc_fes_box img_cover" style="background-image: url('${pageContext.request.contextPath}/resources/images/<%=vo.getTitle_image()%>');" onclick="goto_info('<%=vo.getFno()%>')">
												<div class="info_cover_menu">
													<div class="icm_date"><span><%=vo.getSdate() %> ~ <%=vo.getEdate() %></span></div>
													<div class="icm_name"><span><%=vo.getFname() %></span></div>
												</div>
											</div>
       									 </div>
       								<%
										}
									} 
								%>
      								</div>
     								 <div class="swiper-button-next sbn_activity"></div>
    								 <div class="swiper-button-prev sbp_activity"></div>
   								 </div>
   					</main>
				</div>
				<%
						}//if - 액티비티
						else if(item.equals("문화")){
							%>
							<div class="info_same_category_fes_pannel">
							<header class="isc_header"><span>이런 문화들은 어떠신가요?</span></header>
							<main class="isc_main">
    							<div class="swiper-container swc_culture">
      								<div class="swiper-wrapper">
      								<%
									trip.searchByTag("문화","전체","전체");
      								trip.order_desc("rdate");
      								
									for(int i=0;i<trip.list.size();i++)
									{
										vo=trip.list.get(i);
										if(!fno.equals(vo.getFno())){
									%>
       									 <div class="swiper-slide">
       									 	<div class="isc_fes_box img_cover" style="background-image: url('${pageContext.request.contextPath}/resources/images/<%=vo.getTitle_image()%>');" onclick="goto_info('<%=vo.getFno()%>')">
												<div class="info_cover_menu">
													<div class="icm_date"><span><%=vo.getSdate() %> ~ <%=vo.getEdate() %></span></div>
													<div class="icm_name"><span><%=vo.getFname() %></span></div>
												</div>
											</div>
       									 </div>
       								<%
										}
									} 
								%>
      								</div>
     								 <div class="swiper-button-next sbn_culture"></div>
    								 <div class="swiper-button-prev sbp_culture"></div>
   								 </div>
							</main>
						</div>
						<%
								}//if - 문화
						else if(item.equals("음악")){
							%>
							<div class="info_same_category_fes_pannel">
							<header class="isc_header"><span>이런 음악들은 어떠신가요?</span></header>
							<main class="isc_main">
    							<div class="swiper-container swc_music">
      								<div class="swiper-wrapper">
      								<%
									trip.searchByTag("음악","전체","전체");
      								trip.order_desc("rdate");
      								
									for(int i=0;i<trip.list.size();i++)
									{
										vo=trip.list.get(i);
										if(!fno.equals(vo.getFno())){
									%>
       									 <div class="swiper-slide">
       									 	<div class="isc_fes_box img_cover" style="background-image: url('${pageContext.request.contextPath}/resources/images/<%=vo.getTitle_image()%>');" onclick="goto_info('<%=vo.getFno()%>')">
												<div class="info_cover_menu">
													<div class="icm_date"><span><%=vo.getSdate() %> ~ <%=vo.getEdate() %></span></div>
													<div class="icm_name"><span><%=vo.getFname() %></span></div>
												</div>
											</div>
       									 </div>
       								<%
										}
									} 
								%>
      								</div>
     								 <div class="swiper-button-next sbn_music"></div>
    								 <div class="swiper-button-prev sbp_music"></div>
   								 </div>
							</main>
						</div>
						<%
								}//if - 음악
						else if(item.equals("자연")){
							%>
							<div class="info_same_category_fes_pannel">
							<header class="isc_header"><span>이런 풍경들은 어떠신가요?</span></header>
							<main class="isc_main">
    							<div class="swiper-container swc_nature">
      								<div class="swiper-wrapper">
      								<%
									trip.searchByTag("자연","전체","전체");
      								trip.order_desc("rdate");
      								
									for(int i=0;i<trip.list.size();i++)
									{
										vo=trip.list.get(i);
										if(!fno.equals(vo.getFno())){
									%>
       									 <div class="swiper-slide">
       									 	<div class="isc_fes_box img_cover" style="background-image: url('${pageContext.request.contextPath}/resources/images/<%=vo.getTitle_image()%>');" onclick="goto_info('<%=vo.getFno()%>')">
												<div class="info_cover_menu">
													<div class="icm_date"><span><%=vo.getSdate() %> ~ <%=vo.getEdate() %></span></div>
													<div class="icm_name"><span><%=vo.getFname() %></span></div>
												</div>
											</div>
       									 </div>
       								<%
										}
									} 
								%>
      								</div>
     								 <div class="swiper-button-next sbn_nature"></div>
    								 <div class="swiper-button-prev sbp_nature"></div>
   								 </div>
							</main>
						</div>
						<%
								}//if - 자연
					}//for문
				%>
			</article>
			
			<!-- 리뷰 목록-->
			<article class="info_review_list_pannel">
				<header class="info_review_list_header"><span>리뷰 목록</span></header>
				<main class="info_review_list_main">
					<%-- DAO 설정 시작--%>
					<% 
						ReviewDAO rdao;
						ReviewVO rvo;
						
						rdao=new ReviewDAO();
						rdao.setfestivalReview(fno);
						
					%>
						<%-- DAO 설정 종료 --%>
						<!-- 반복 시작 -->
						<%

						
						if(rdao.list.size()==0){
						%>
							<div class="review_preview_none">
								<span>작성된 리뷰가 없습니다.</span>
							</div>		
						<%
						}
						
						else{
						for(int i=0;i<rdao.list.size();i++){
							rvo=rdao.list.get(i);		
							if(i==5){ break; }
							%>
						<div class="review_preview">
							<header><span>작성자 : <%=rvo.getId() %></span></header>
							<main><span>제목 : <a href="/Review/view?no=<%=rvo.getNo() %>&fno=<%=fno%>"><%= rvo.getTitle()%></a></span></main>
							<footer><span>작성 시간 : <%=rvo.getRdate() %></span></footer>
						</div>
						<%	
							}
						}
						%>
					<!-- 반복 종료 -->
				</main>
				<% if(rdao.list.size()>5){ %>
					<footer class="info_review_list_footer"><span class="go_review_list" onclick="go_review_list('<%=fno%>')">더보기 ▶</span></footer>
				<% } %>
			</article>
		</section>
	
	<!-- Footer -->
			<footer id="footer">
				<%@ include file="../include/footer.jsp" %>
			</footer>

	<script src="../../../../resources/js/swiper-bundle.min.js"></script>
	<script>
	var swiper_picture = new Swiper(".swc_picture", {
        navigation: {
          nextEl: ".sbn_picture",
          prevEl: ".sbp_picture",
        },
      });
	var swiper_area = new Swiper(".swc_area", {
        slidesPerView: 3,
        spaceBetween: 30,
        navigation: {
          nextEl: ".sbn_area",
          prevEl: ".sbp_area",
        },
      });
	var swiper_activity = new Swiper(".swc_activity", {
        slidesPerView: 3,
        spaceBetween: 30,
        navigation: {
          nextEl: ".sbn_activity",
          prevEl: ".sbp_activity",
        },
      });
	var swiper_culture = new Swiper(".swc_culture", {
        slidesPerView: 3,
        spaceBetween: 30,
        navigation: {
          nextEl: ".sbn_culture",
          prevEl: ".sbp_culture",
        },
      });
	var swiper_music= new Swiper(".swc_music", {
        slidesPerView: 3,
        spaceBetween: 30,
        navigation: {
          nextEl: ".sbn_music",
          prevEl: ".sbp_music",
        },
      });
	var swiper_nature= new Swiper(".swc_nature", {
        slidesPerView: 3,
        spaceBetween: 30,
        navigation: {
          nextEl: ".sbn_nature",
          prevEl: ".sbp_nature",
        },
      });
    </script>
	<script src="../../../../resources/js/info.js"></script>
	<script src="https://kit.fontawesome.com/34a8d510cf.js" crossorigin="anonymous" ></script>
	<script src="../../../../resources/js/jquery.min.js"></script>
	<script src="../../../../resources/js/skel.min.js"></script>
	<script src="../../../../resources/js/util.js"></script>
	<script src="../../../../resources/js/main.js"></script>
</body>
</html>