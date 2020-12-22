<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet">
	<meta charset="UTF-8">
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/images/stepIcon.png">
<title>로그인 | STEP</title>
</head>
<body>
	<!-- Header -->
			<header id="header" class="skel-layers-fixed">
				<h1><a href="/">Step</a></h1>
				<a href="#nav">Menu</a>
			</header>

		<!-- Nav -->
			<%@ include file="../include/nav.jsp" %>
			
	<!-- 아이디 비밀번호 틀릴시 알림 -->
	<% 
	String messege = (String)request.getAttribute("messege"); 
	%>
	<!-- Main -->
    <section id="main" class="wrapper">
				<div class="container">
                    <section>
                        <form method="post" name="login__form" action="loginDB" class="login__form">
                            <div class="row uniform 50%">
                                <div class="6u 12u$(small)">
    								<%
									if(messege == "login fail")
									{
									%>
									<h1>아이디와 비밀번호를 다시 입력해주세요.</h1>
									<%}%>
                                    <h3>아이디</h3>
                                    <input onkeyup="login__submit2()" type="text" placeholder="아이디" name="id" />
			                    </div>
                                <br /><br /><br /><br /><br/>
                                <div class="6u 12u$(small)">
                                    <h3>비밀번호</h3>
                                    <input onkeyup="login__submit2()" type="password" placeholder="비밀번호" name="pw"/>
			                    </div>
                            </div>
                        </form>
                        <div class="12u$">
				                    <ul class="actions">
					                    <li><button OnClick="login__submit()">로그인</button></li>
					                    <li><a href="/log/join"><button OnClick="Button2_Click">회원가입</button></a></li>
				                    </ul>
			                    </div>
                    </section>
                 </div>
    </section>
    <!-- Footer -->
			<footer id="footer">
				<%@ include file="../include/footer.jsp" %>
			</footer>
			
	

	<script>
	function login__submit(){
		var Lf = document.login__form;
		var id2 = login__form.id.value;
		var pw2 = login__form.pw.value;
	
		if(!id2 || !pw2){
			alert("아이디와 비밀번호를 모두 입력해주세요.")
		}
		else{
			Lf.submit();
		}
	}
	
	function login__submit2(){
		   
		   var Lf = document.login__form;
		   var id2 = login__form.id.value;
		    var pw2 = login__form.pw.value;
		    
		    if (window.event.keyCode == 13) {
		        
		        // 엔터키가 눌렸을 때 실행할 내용
		        if(!id2 || !pw2)
		        {
		           alert("아이디와 비밀번호를 모두 입력해주세요.")
		        }
		        else
		        {
		           Lf.submit();
		        }     
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