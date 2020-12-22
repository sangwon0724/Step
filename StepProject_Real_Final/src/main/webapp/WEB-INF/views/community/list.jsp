<%@page import="com.control.vo.CommunityVO"%>
<%@page import="com.control.dao.CommunityDAO"%>
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
<title>자유게시판 | STEP</title>
<style type="text/css">
	h3 {cursor: pointer;}
	.section_footer{width: 100%; height: 60px; display: flex; justify-content: space-between; align-items: center;}
	.community_search_box{width: 28%; height: 50px; border: none; background-color: #63C1AE;}
	.searchForm{width: 100%; height: 100%; display: flex; justify-content: center; align-items: center;}
	.csb_text{width: 72%;  border: 1px solid black;}
	.searchForm>input{ height: 100%; border-radius: none; background-color: white; border: 1px solid #63C1AE;}
	.csb_button{width: 28%; height: 100%; display: flex; justify-content: center; align-items: center; cursor: pointer;}
	.csb_button>i{font-size: 20px;}
	
	@media screen and (max-width: 1265px) {
			.community_search_box{width: 37%;}
	}
	@media screen and (max-width: 975px) {
			.community_search_box{width: 46%;}
	}
	@media screen and (max-width: 675px) {
			.community_search_box{width: 55%;}
	}
	@media screen and (max-width: 585px) {
			.community_search_box{width: 60%;}
	}
</style>
</head>
<body>
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
                                <h3 class="board">게시판</h3>
                                <hr />
                                <%
                                	String searchText=request.getParameter("search");
                                	if(searchText==null){searchText="X";}
                                	else if(searchText.equals("")){searchText="X";}
                                
									CommunityDAO dao = new CommunityDAO();
                                	CommunityVO vo = new CommunityVO();
                                	
                                	if(searchText.equals("X")){dao.selectCommunity();}
                                	else{dao.selectCommunity(searchText);}
                                	
                                	//페이지설정부
                                	 String strPg = request.getParameter("pg"); //list.jsp?pg=?
                                	 int rowSize = 10; //한페이지에 보여줄 글의 수
                                	 int pg = 1; //페이지 , list.jsp로 넘어온 경우 , 초기값 =1
                                	      
                                	 if(strPg != null){ //list.jsp?pg=2
                                	           pg = Integer.parseInt(strPg); //.저장
                                	 }   
                                	 int from = (pg * rowSize) - (rowSize-1); //(1*10)-(10-1)=10-9=1 //from
                                	 int to=(pg * rowSize); //(1*10) = 10 //to
                                	int total = dao.list.size();
                                    if(total<to){to=total;};
                                    int allPage = (int) Math.ceil(total/(double)rowSize); //페이지수
                                    //int totalPage = total/rowSize + (total%rowSize==0?0:1);
                                    int block = 10; //한페이지에 보여줄  범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9] [10] >>
                                   int fromPage = ((pg-1)/block*block)+1;  //보여줄 페이지의 시작
                                   int toPage = ((pg-1)/block*block)+block; //보여줄 페이지의 끝
                                   if(toPage> allPage){ // 예) 20>17
                                           toPage = allPage;
                                       };
                                  //페이지설정부
									out.print("총 게시물 : " + dao.list.size()+ "개");
								%>
									<table width="100%" cellpadding="0" cellspacing="0" border="0">
									  <tr height="5">
									  </tr>
									  <tr style="text-align:center;">
									   <td width="10%">번호</td>
									   <td width="45%">제목</td>
									   <td width="15%">작성자</td>
									   <td width="180">작성일</td>
									   <td width="10%">조회수</td>
									  </tr>
										<%
										if(dao.list.size()==0) {
										%>
								 		<tr align="center" bgcolor="#FFFFFF" height="30">
								 	   <td colspan="6">등록된 글이 없습니다.</td>
								 	  </tr>
									<%
								 	} else {
								 		for(int i=from-1;i<to;i++){
								 			vo=dao.list.get(i);
								 			%>
								 			<tr height="25" align="center">
											<td><%= vo.getNo() %></td>
											<td align="left"><a href="view?no=<%=vo.getNo() %>"><%= vo.getTitle()%></a></td>
											<td align="center"><%=vo.getId() %></td>
											<td align="center"><%=vo.getSigndate() %></td>
											<td align="center"><%=vo.getViews() %></td>
											<td>&nbsp;</td>
										</tr>							 			
								 			<%	
								 		}	
								 	}
									%>	
								</table>
								
								<br>
								
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
                            </div>
                        </form>
                        <footer class="section_footer">
                        <% if(session.getAttribute("ID") == null) 
                        {
                        %>
                        <a href="/log/login"><input type=button value="글쓰기"></a>
                        <%
                        }
                        else{
                        %>
                        <a href="write"><input type=button value="글쓰기"></a>
                        <%
                        }
                        %>
                        <div class="community_search_box">
                        	<form name="searchForm" class="searchForm">
                        		<% if(searchText.equals("X")){ %>
                        		<input type="text" name="search" class="csb_text" value=""/>
                        	<%} else{ %>
                        		<input type="text" name="search" class="csb_text" value="<%=searchText%>"/>
                        	<%} %>
                        		<div class="csb_button"><i class="fas fa-search"></i></div>
                        	</form>
                        	</div>
                        </footer>
                     </section>
                 </div>
        </section>
    <!-- Footer -->
			<footer id="footer">
				<%@ include file="../include/footer.jsp" %>
			</footer>
	
	<!-- Scripts -->
	<script type="text/javascript">
		const csb_button= document.querySelector(".csb_button");

		csb_button.onclick=function(){document.searchForm.submit();};
		

		var board=document.querySelector(".board");
		board.onclick=function(){location.href="/community/list";};
	</script>
	<script src="../../../../resources/js/index.js"></script>
	<script src="https://kit.fontawesome.com/34a8d510cf.js" crossorigin="anonymous" ></script>		
	<script src="../../../../resources/js/jquery.min.js"></script>
	<script src="../../../../resources/js/skel.min.js"></script>
	<script src="../../../../resources/js/util.js"></script>
	<script src="../../../../resources/js/main.js"></script>
</body>
</html>