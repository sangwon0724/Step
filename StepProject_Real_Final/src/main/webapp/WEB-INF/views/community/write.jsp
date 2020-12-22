<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet">
	<meta charset="UTF-8">
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/images/stepIcon.png">
<title>글 작성 | STEP</title>
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
                        <form method="post" name="write__form" action="writeDB" class="write__form">
                            <div>
                                <h3><%=session.getAttribute("ID")%>님 게시판 글쓰기</h3>
                                <hr />
                                <table>
                                    <tr>
                                        <td style="background-color:lightgray; width:210px; height:30px;" align="center">글 제목</td>
                                        <td><input type="text" name="title" width="400px"></td>
                                    </tr>
                                    <tr>
                                        <td style="background-color:lightgray; width:210px; height:300px;" align="center">글 내용</td>
                                        <td><textarea name="comment" style="height:300px; width:1000px;"></textarea></td>
                                    </tr>
                                </table>                                
                                <input type="hidden" name="id" value="<%=session.getAttribute("ID")%>">
                                <hr />
                            </div>
                        </form>
                        <button OnClick="write_submit()" >글작성</button>
                        <a href="list"><button OnClick="Button2_Click">작성취소</button></a>
                        <a href="list"><button OnClick="Button3_Click">글목록</button></a>
                        </section>
                    </div>
        </section>
	<!-- Footer -->
			<footer id="footer">
				<%@ include file="../include/footer.jsp" %>
			</footer>
			
	<script>
		function write_submit(){
			var Lf = document.write__form;
			var title = write__form.title.value;
			var comment = write__form.comment.value;
			if (!title)
			{
				alert("제목을 입력해주세요");
				write__form.title.focus();
				if (!comment)
				{
					alert("글 내용을 입력해주세요");
					write__form.comment.focus();
				}
			}
			else
			{
				Lf.submit();
			}
		}
	</script>


	<!-- Scripts -->
	<script src="../../../../resources/js/jquery.min.js"></script>
	<script src="../../../../resources/js/skel.min.js"></script>
	<script src="../../../../resources/js/util.js"></script>
	<script src="../../../../resources/js/main.js"></script>
</body>
</html>