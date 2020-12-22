<%@page import="com.control.vo.ReviewVO"%>
<%@page import="com.control.dao.ReviewDAO"%>
<%@page import="java.beans.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet">
	<meta charset="UTF-8">
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/images/stepIcon.png">
<title>리뷰 | STEP</title>
<style type="text/css">
	h3 {cursor: pointer;}
</style>
</head>
<body>
<%String strPg = request.getParameter("pg"); //list.jsp?pg=? %>
	<!-- Header -->
			<header id="header" class="skel-layers-fixed">
				<h1><a href="/">Step</a></h1>
				<a href="#nav">Menu</a>
			</header>

		<!-- Nav -->
			<%@ include file="../include/nav.jsp" %>
			
			 <%
                               
                                	String searchText=request.getParameter("search");//검색 값
                                	String fno=request.getParameter("fno");//축제 번호
                                	
                                	if(searchText==null){searchText="X";}
                                	else if(searchText.equals("")){searchText="X";}
                                	
                                	if(fno==null){fno="X";}
                                
									ReviewDAO dao = new ReviewDAO();
									ReviewVO vo = new ReviewVO();
									
		
                                	if(searchText.equals("X") && fno.equals("X")){dao.setallReview("rdate","desc");}//검색 없고, fno가 없을 때
                                	else if(searchText.equals("X") && !fno.equals("X")){dao.setFnoReview(fno,"rdate","desc");}//검색 없고, fno가 있을 때
                                	else if(!searchText.equals("X") && fno.equals("X")){dao.setallReview(searchText,"rdate","desc");}//검색 있고, fno가 없을 때
								%>
			
			<!-- 페이징 -->
        <%
      //--------------------추가본-------------------
		
    	int rowSize = 9; //한페이지에 보여줄 글의 수
   		int pg = 1; //페이지 , list.jsp로 넘어온 경우 , 초기값 =1
      
    	if(strPg != null){ //list.jsp?pg=2
           pg = Integer.parseInt(strPg); //.저장
    	}   
   		
   		int from = (pg * rowSize) - (rowSize-1); //(1*10)-(10-1)=10-9=1 //from
   		int to=(pg * rowSize); //(1*10) = 10 //to
   		
		int total = dao.list.size(); //총 게시물 수
		if(total<to){to=total;}
		int allPage = (int) Math.ceil(total/(double)rowSize); //페이지수
		//int totalPage = total/rowSize + (total%rowSize==0?0:1);
		int block = 10; //한페이지에 보여줄  범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9] [10] >>
		
		int fromPage = ((pg-1)/block*block)+1;  //보여줄 페이지의 시작
		int toPage = ((pg-1)/block*block)+block; //보여줄 페이지의 끝
		if(toPage> allPage){ // 예) 20>17
		           toPage = allPage;
		       };

		//-----------------------------------
        %>
        
	<!-- search -->
    	<section id="main" class="wrapper">
				<div class="container">
                    <section>
                                <h3 class="board">리뷰 게시판</h3>
                                <hr />
                               
								<header class="review_count"><span>총 게시물 : </span><span><%=dao.list.size() %></span><span>개</span></header>
                                <main class="review_list">
                                	<% 
                                	if(dao.list.size()==0){
                                		
                                		
                                	}
                                		
                                	else{
                                		for(int i=from-1;i<to;i++){
							 			vo=dao.list.get(i);
							 			%>
                                	<div class="review_post">
                                		<a href="./view?no=<%=vo.getNo()%>">
                                			<img src="${pageContext.request.contextPath}/resources/images/review_preview.png" alt="">
                                		</a>
                                		<div class="review_post_content">
	                                		<div>제목 : <span><%=vo.getTitle()%></span></div>
	                                		<div>조회수 : <span><%=vo.getViews() %></span></div>
	                                		<div>작성자 : <span><%=vo.getId() %></span></div>
	                                		<div>등록일 : <span><%=vo.getRdate().toString() %></span></div>
                                		</div>
                                	</div>
                                	<%
                                		}//for문 종료
                                		
                                		if(to%3==2){
                                			//남는 공간이 한 칸인 경우
                                			%>
                                			<div class="review_post_none"></div>
                                			<%
                                		}
                                		else if(to%3==1){
                                			//남는 공간이 두 칸인 경우
                                			%>
                                			<div class="review_post_none"></div>
                                			<div class="review_post_none"></div>
                                			<%
                                		}
                                	}
                                	%>
                                	
							  </main>
							 <%--if(CONTENTS.length()>40){
							  CONTENTS=CONTENTS.substring(0,40);
							  //40자 이상일 경우엔 substring 으로 짜르고 ... 을 덧 붙인다.
							  CONTENTS=CONTENTS+"...";
							 }--%>
                         <footer class="section_footer">
                        <% if(session.getAttribute("ID") == null) 
                        {
                        %>
                        	<div></div>
                        <%
                        }
                        else if(session.getAttribute("ID") != null && request.getParameter("fno") != null){
                        	%>
                        	<a href="write?fno=<%=request.getParameter("fno") %>"><input type=button value="글쓰기"></a>
                        	<%
                        	}else{
                        %>
                        	<div></div>
                        <%
                        }
                        %>
                        <div class="review_search_box">
                        	<form name="searchForm" class="searchForm">
                        	<% if(searchText.equals("X")){ %>
                        		<input type="text" name="search" class="rsb_text" value=""/>
                        	<%} else{ %>
                        		<input type="text" name="search" class="rsb_text" value="<%=searchText%>"/>
                        	<%} %>
                        		<div class="rsb_button"><i class="fas fa-search"></i></div>
                        	</form>
                        	</div>
                        </footer>
                        </section>
                    </div>
        </section>
        
        
        
        <table width="600">
<tr>
    <td align="center">
    
    		
        <%
            if(pg>block){ //처음, 이전 링크
       
        %>
                [<a href="list?pg=1">◀◀</a>]
                [<a href="list?pg=<%=fromPage-1%>">◀</a>]    
        <%     
            }else{
        %>             
                [<span style="color:gray">◀◀</span>]   
                [<span style="color:gray">◀</span>]
        <%
            }
        %>
       
       
        <%
            for(int i=fromPage; i<= toPage; i++){
                if(i==pg){
        %>         
                    [<%=i%>]
       
        <%     
                }else{
        %>
                    [<a href="list?pg=<%=i%>"><%=i%></a>]
        <%
                }
            }
       
        %>
       
       
        <%
            if(toPage<allPage){ //다음, 이후 링크
       
        %>
                [<a href="list?pg=<%=toPage+1%>">▶</a>]
                [<a href="list?pg=<%=allPage%>">▶▶</a>]
                       
        <%     
            }else{
        %>             
                   
                [<span style="color:gray">▶</span>]
                [<span style="color:gray">▶▶</span>]
        <%
            }
        %>
       
       
    </td>
</tr>
</table>
        
    <!-- Footer -->
			<footer id="footer">
				<%@ include file="../include/footer.jsp" %>
			</footer>
	
	<!-- Scripts -->
	<script type="text/javascript">
		const rsb_button= document.querySelector(".rsb_button");

		rsb_button.onclick=function(){document.searchForm.submit();};

		var board=document.querySelector(".board");
		board.onclick=function(){location.href="/Review/list";};
	</script>
	<script src="../../../../resources/js/index.js"></script>		
	<script src="https://kit.fontawesome.com/34a8d510cf.js" crossorigin="anonymous" ></script>		
	<script src="../../../../resources/js/jquery.min.js"></script>
	<script src="../../../../resources/js/skel.min.js"></script>
	<script src="../../../../resources/js/util.js"></script>
	<script src="../../../../resources/js/main.js"></script>
</body>
</html>