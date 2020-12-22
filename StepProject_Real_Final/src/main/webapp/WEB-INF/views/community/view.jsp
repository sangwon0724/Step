<%@page import="com.control.vo.CommunityVO"%>
<%@page import="com.control.dao.CommunityDAO"%>
<%@page import="com.control.vo.ReviewVO"%>
<%@page import="com.control.dao.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%int no = Integer.parseInt(request.getParameter("no"));%>
<%
	CommunityDAO dao=new CommunityDAO();
	CommunityVO vo=new  CommunityVO();
	
	dao.setoneCommunity(no);
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
<title><%= vo.getTitle() %></title>
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
		글번호: <%--out.println(vo.getNo());	--%> <br>
		제목: <%--out.println(vo.getTitle());	--%> <br>
		내용: <%--out.println(vo.getCom());	--%> <br>		
		좋아요:<%--out.println(vo.getLikenum());--%>
		싫어요:<%--out.println(vo.getDislikenum()); --%>
		조회수:<%--out.println(vo.getViews()); --%>
		
		
		<br><br>
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
                                                	     작성일 : <%=vo.getSigndate() %>&nbsp;&nbsp;&nbsp;&nbsp;
                                                	     좋아요 : <%=vo.getLikenum() %>&nbsp;&nbsp;&nbsp;&nbsp;
                                                	     싫어요 : <%=vo.getDislikenum() %>&nbsp;&nbsp;&nbsp;&nbsp;
                                                	     조회수 : <%=vo.getViews() %>
                                                </span>
                                            </div>
                                <table>
                                    <tr style="text-align:center; font-size:25px; font-weight:bold;">
                                        <td style="background-color:lightgray;"><%=vo.getTitle() %></td><!-- 제목 -->
                                    </tr>
                                    <tr>
                                        <td><p style="font-size:20px; font-weight:bold;">내용</p><%=vo.getCom() %></td>
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
	                        if(vo.getId().equals(session.getAttribute("ID")))
	                        {
	                       	%>
                        		<a href="delete?no=<%=vo.getNo()%>"><input type=button value="글 삭제"></a>
                        		<a href="list"><input type=button value="글 목록"></a>
	                        <%
	                        }
	                        else
	                        {
	                        %>
	                        	<a href="list"><input type=button value="글 목록"></a>
	                        <%
	                        } 
	                        %>
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