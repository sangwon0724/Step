<%@page import="java.beans.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.control.vo.FestivalVO"%>
<%@page import="com.control.dao.FestivalDAO"%>
<%@page import="com.my.app.transText" %>

<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet">
	<meta charset="UTF-8">
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/images/stepIcon.png">
<title>축제리스트 | STEP</title>
</head>
<body class="tag_list_body">

<%
    // 쿠키값 가져오기
    Cookie[] cookies = request.getCookies() ;

    String cValue_big_area="";
    String cValue_city_area="";
    
    if(cookies != null){
         
        for(int i=0; i < cookies.length; i++){
        	
            Cookie c = cookies[i] ;
            
            // 저장된 쿠키 이름을 가져온다
            String cName = c.getName();
            
            // 쿠키값을 가져온다
            String cValue = c.getValue() ;
            
            //지역 설정용 변수에 저장
            if(cName.equals("big_area")){ cValue_big_area=cValue;}
            else if(cName.equals("city_area")){ cValue_city_area=cValue;}
        }
    }
    
    //쿠키 값을 텍스트로 변환
    transText ttt=new transText();
    String orderBigArea=ttt.setOrderByBigArea(cValue_big_area);
    String orderCityArea=ttt.setOrderByCityArea(cValue_city_area);
    
    if(orderBigArea.equals(null)) orderBigArea="지역빔";
    if(orderCityArea.equals(null)) orderCityArea="도시빔";
%>

<!-- Header -->
			<header id="header" class="skel-layers-fixed">
				<h1><a href="/">Step</a></h1>
				<a href="#nav">Menu</a>
			</header>

		<!-- Nav -->
			<%@ include file="../include/nav.jsp" %>
			
		<!-- 지역 및 도시 선택 메뉴 -->
			<nav class="tag_select_open"><i class="fas fa-chevron-left"></i></nav>
		
			<nav class="tag_select">
				<header class="tag_select_header"><span class="tag_select_close">X</span></header>
				<div class="tag_area_order">
				<div class="big_area_pannel">
					<div class="bap_tag bap_tag_all" name="bt_all">전체</div>
					<div class="bap_tag bap_tag_name" name="bt_seoul">#서울</div>
					<div class="bap_tag bap_tag_name" name="bt_busan">#부산</div>
					<div class="bap_tag bap_tag_name" name="bt_daegu">#대구</div>
					<div class="bap_tag bap_tag_name" name="bt_incheon">#인천</div>
					<div class="bap_tag bap_tag_name" name="bt_gwangju">#광주</div>
					<div class="bap_tag bap_tag_name" name="bt_daejeon">#대전</div>
					<div class="bap_tag bap_tag_name" name="bt_ulsan">#울산</div>
					<div class="bap_tag bap_tag_name" name="bt_sejong">#세종</div>
					<div class="bap_tag bap_tag_name" name="bt_gyonggi">#경기</div>
					<div class="bap_tag bap_tag_name" name="bt_gangwon">#강원</div>
					<div class="bap_tag bap_tag_name" name="bt_chungcung_north">#충북</div>
					<div class="bap_tag bap_tag_name" name="bt_chungcung_south">#충남</div>
					<div class="bap_tag bap_tag_name" name="bt_kyongsang_north">#경북</div>
					<div class="bap_tag bap_tag_name" name="bt_kyongsang_south">#경남</div>
					<div class="bap_tag bap_tag_name" name="bt_jeonla_north">#전북</div>
					<div class="bap_tag bap_tag_name" name="bt_jeonla_south">#전남</div>
					<div class="bap_tag bap_tag_name" name="bt_jeju">#제주</div>
				</div>
				<div class="city_area_pannel"></div>
			</div>
			</nav>
			
		<!-- Content -->	
	
	<!-- 패널 정렬용 -->
	<section class="tag_section">
		<article class="tag_left_pannel">
			<header class="tag_group_pannel_top">
				<div class="tag_tap_All"><span class="tt_all">#전체보기</span></div>
			</header>
			<header class="tag_group_pannel">
				<div class="tag_tap"><span class="tt_activity">#액티비티</span></div>
				<div class="tag_tap"><span class="tt_culture">#문화</span></div>
				<div class="tag_tap"><span class="tt_music">#음악</span></div>
				<div class="tag_tap"><span class="tt_nature">#자연</span></div>
			</header>
			<%
					String category=request.getParameter("category");
					String category_str="";
					
					if(category.equals("all")){
						category_str="전체";
					}
					else if(category.equals("activity")){
						category_str="액티비티";
					}
					else if(category.equals("culture")){
						category_str="문화";
					}
					else if(category.equals("music")){
						category_str="음악";
					}
					else if(category.equals("nature")){
						category_str="자연";
					}
					
					FestivalDAO trip=new FestivalDAO();
					FestivalVO vo;
					
					String order=request.getParameter("order");
					
					//태그 값은 주소에 있으니 먼저 실행
					
					
					//정렬하기
					if(category_str.equals("전체")&&order==null){
						trip.searchByTag(orderBigArea,orderCityArea);
						trip.order_desc("rdate");
					}
					else if(category_str.equals("전체")&&order!=null){
						trip.searchByTag(orderBigArea,orderCityArea);
						trip.order_desc(order);
					}
					else if(!category_str.equals("전체")&&order==null){
						trip.searchByTag(category_str,orderBigArea,orderCityArea);
						trip.order_desc("rdate");
					}
					else if(!category_str.equals("전체")&&order!=null){
						trip.searchByTag(category_str,orderBigArea,orderCityArea);
						trip.order_desc(order);
					}
			%>
			<header class="tag_setting_pannel">
				<div class="tag_fes_count"> 총&nbsp;<span class="tfc_span"><%=trip.list.size()%></span>&nbsp;건</div>
				<div class="tag_fes_order">
					<span class="tfo_rdate">최근 등록순</span>
					&nbsp;|&nbsp;
					<span class="tfo_views">조회순</span>
					&nbsp;|&nbsp;
					<span class="tfo_grade">평점순</span>
				</div>
			</header>
			<main class="info_group_pannel">
			<%
					for(int i=0;i<trip.list.size();i++){
						vo=trip.list.get(i);
						
						/*String[] array;
						String previewText="";
						
						if(vo.getText().length()>100){
							array = vo.getText().split("<br>");
							for(int j=0;j<array.length;j++) {
								previewText+=array[j];
							}
							vo.setText(previewText.substring(0,100)+"...");
						}*/
						
						
						
						%>
							<div class="tag_fes_info">
								<div class="tfi_image_pannel" onclick="goto_info('<%=vo.getFno()%>')" style="background-image: url('${pageContext.request.contextPath}/resources/images/<%=vo.getTitle_image()%>');"></div>
								<div class="tfi_info_pannel">
									<div class="tfi_text_name"><span onclick="goto_info('<%=vo.getFno()%>')"><%=vo.getFname() %></span></div>
									<div class="tfi_text_date">[ <%=vo.getSdate() %> ~ <%=vo.getEdate() %> ]</div>
									<div class="tfi_text_content"><%=vo.getText()%></div>
								</div>
							</div>
						<%
					}
			%>
			</main>
		</article>
		
		<article class="tag_right_pannel"></article>
	</section>
	
	
	
	
	
	
	<!-- Footer -->
			<footer id="footer">
				<%@ include file="../include/footer.jsp" %>
			</footer>

	<script src="../../../../resources/js/fes_list.js"></script>
	<script src="https://kit.fontawesome.com/34a8d510cf.js" crossorigin="anonymous" ></script>
	<script src="../../../../resources/js/jquery.min.js"></script>
	<script src="../../../../resources/js/skel.min.js"></script>
	<script src="../../../../resources/js/util.js"></script>
	<script src="../../../../resources/js/main.js"></script>
</body>
</html>