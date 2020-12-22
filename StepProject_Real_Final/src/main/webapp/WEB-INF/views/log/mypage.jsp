<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet">
	<meta charset="UTF-8">
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/images/stepIcon.png">
<title>내 정보 | STEP</title>
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
						<form id="form1" runat="server">
							<h2><%= session.getAttribute("ID")%> 님</h2>
							<hr>
							<aside>
								<%@ include file="../include/aside.jsp" %>
							</aside>
							<div>
								
							</div>
						</form>
						</section>
                 </div>
    		</section>
    		<br><br><br><br><br><br><br>
    <!-- Footer -->
			<footer id="footer">
				<%@ include file="../include/footer.jsp" %>
			</footer>
	<script src="../../../../resources/js/jquery.min.js"></script>
	<script src="../../../../resources/js/skel.min.js"></script>
	<script src="../../../../resources/js/util.js"></script>
	<script src="../../../../resources/js/main.js"></script>
</body>
</html>