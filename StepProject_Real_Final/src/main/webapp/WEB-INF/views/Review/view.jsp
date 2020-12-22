<%@page import="com.control.vo.ReviewVO"%>
<%@page import="com.control.dao.ReviewDAO"%>
<%@page import="com.control.vo.FestivalVO"%>
<%@page import="com.control.dao.FestivalDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%int no = Integer.parseInt(request.getParameter("no"));%>
<%
	ReviewDAO dao=new ReviewDAO();
	ReviewVO vo=new ReviewVO();
	
	dao.setoneReview(no); 

	for(int i=0;i<dao.list.size();i++){
		vo=dao.list.get(i);
	}
		%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet">
	<meta charset="UTF-8">
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/images/stepIcon.png">
<title><%=vo.getTitle() %></title>
<style type="text/css">
	/* 댓글 */
	.comment_pannel{width: 73%; height: auto; margin-bottom: 10vh;}
	
	/* 댓글 제목 */
	.comment_header{
		width: 100%; height: 9vh;
		display: flex; justify-content: space-between; align-items: flex-end;
		border-bottom: 1px solid #EEEEEE;
		margin-bottom: 3vh;
	}
	.comment_header>span{font-size: 150%; color: black; margin-left: 1vw; margin-bottom: 5.3vh;}
	
	/* 댓글 목록 화면*/
	.comment_main{ width: 100%; height: auto; min-height: 300px;}
</style>
<script>
  function resizeIframe(obj) {
    obj.style.height = obj.contentWindow.document.documentElement.scrollHeight + 'px';
  }
</script>
</head>
<body>
		<!-- Header -->
			<header id="header" class="skel-layers-fixed">
				<h1><a href="/">Step</a></h1>
				<a href="#nav">Menu</a>
			</header>

		<!-- Nav -->
			<%@ include file="../include/nav.jsp" %>

		<!-- 
		여행번호: <%--out.println(vo.getFno());	--%> <br>
		글번호: <%--out.println(vo.getNo());	--%> <br>
		제목: <%--out.println(vo.getTitle());	--%> <br>
		소개: <%--out.println(vo.getText());	--%> <br>		
		평점: <%--out.println(vo.getGrade());	--%> <br>		
		등록일: <%--out.println(vo.getRdate().toString());	--%> <br>
		좋아요:<%--out.println(vo.getLikenum()); --%>
		싫어요:<%--out.println(vo.getDislikenum()); --%>
		조회수:<%--out.println(vo.getViews()); --%>
		 -->
		
		<!-- Main -->
    	<section id="main" class="wrapper">
				<div class="container">
                    <section>
                        <form id="form1" runat="server">
                            <div>
                                <h3>게시판 글보기</h3>
                                <hr />
                                            <div class="box">
                                                <span>작성자 : <%=vo.getId() %>&nbsp;&nbsp;&nbsp;&nbsp; 
                                                	     작성일 : <%=vo.getRdate().toString() %>&nbsp;&nbsp;&nbsp;&nbsp;
                                                	     평점 :  <%= vo.getGrade() %> &nbsp;&nbsp;&nbsp;&nbsp;
                                                	     좋아요 : <%=vo.getLikenum() %>&nbsp;&nbsp;&nbsp;&nbsp;
                                                	     싫어요 : <%=vo.getDislikenum() %>&nbsp;&nbsp;&nbsp;&nbsp;
                                                	     조회수 : <%=vo.getViews() %>
                                                </span>
                                            </div>
                                            <% 
												String fno=vo.getFno();
		
												FestivalDAO trip=new FestivalDAO();
												FestivalVO voTrip;
												trip.setOneFestival(fno);
												
												voTrip=trip.list.get(0);
											%>
									<table>
	                                    <tr>
	                                        <td style="background-color:lightgray; width:210px; height:30px;" align="center">대상 축제</td>
	                                        <td><input type="text" name="festival_name" class="fes_name" width="400px" value="<%=voTrip.getFname() %>" readonly></td>
	                                    </tr>
                                </table>
                                <table>
                                    <tr style="text-align:center; font-size:25px; font-weight:bold;">
                                        <td style="background-color:lightgray;"><%=vo.getTitle() %></td><!-- 제목 -->
                                    </tr>
                                    <tr>
                                        <td><p style="font-size:20px; font-weight:bold;">내용</p><%=vo.getText() %></td>
                                    </tr>
                                 </table>
                                 <br>
                            </div>
                            </form>
                            
                            <!-- 댓글 -->
							<article class="comment_pannel">
								<header class="comment_header">
									<span>댓글 목록</span>
	                			</header>
								<main class="comment_main">
									<iframe id="comment_iframe" width="100%" height="auto" onload="resizeIframe(this)" scrolling="no" src="./comment?no=<%=request.getParameter("no")%>"></iframe>
								</main>
							</article>
							
                            <% if(session.getAttribute("ID") == null) 
	                        { }
	                        else if(session.getAttribute("ID") != null && request.getParameter("fno") != null){
	                        %>
	                        <a href="write?fno=<%=vo.getFno()%>"><input type=button value="글쓰기"></a>
	                        <%
	                        }
	                        if(vo.getId().equals(session.getAttribute("ID")))
	                        {
	                        %>
                        	<a href="delete?no=<%=vo.getNo()%>"><input type=button value="글 삭제"></a>
	                        <%
	                        }
	                        %>
                        	<a href="list?fno=<%=vo.getFno()%>"><button>관련글목록</button></a>
                        	<a href="list"><button>전체글목록</button></a>
                        </section>
                    </div>
        </section>
        <!-- Footer -->
			<footer id="footer">
				<%@ include file="../include/footer.jsp" %>
			</footer>
			
		<!-- Scripts -->
		<script src="../../../../resources/js/index.js"></script>		
		<script src="../../../../resources/js/jquery.min.js"></script>
		<script src="../../../../resources/js/skel.min.js"></script>
		<script src="../../../../resources/js/util.js"></script>
		<script src="../../../../resources/js/main.js"></script>

</body>
</html>