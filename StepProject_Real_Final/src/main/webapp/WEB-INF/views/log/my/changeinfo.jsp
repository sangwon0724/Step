<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet">
	<meta charset="UTF-8">
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/images/stepIcon.png">
<title>마이페이지</title>
<style type="text/css">
	.actions{display: flex; justify-content: center;}
</style>
</head>
<body>
<!-- Header -->
			<header id="header" class="skel-layers-fixed">
				<h1><a href="/">Step</a></h1>
				<a href="#nav">Menu</a>
			</header>

		<!-- Nav -->
			<%@ include file="../../include/nav.jsp" %>
		<!-- Main -->
			<section id="main" class="wrapper">
				<div class="container">
                    <section>
						<form name="form1" action="changeinfoDB" method="post" runat="server">
							<h2><%= session.getAttribute("ID")%> 님</h2>
							<input type="hidden" name="id" value="<%= session.getAttribute("ID")%>"/> 
							<hr>
							<aside>
								<%@ include file="../../include/aside.jsp" %>
							</aside>
							<div>
							<h3>개인정보 수정</h3>
								<%= session.getAttribute("ID") %>님 개인정보
								<br><br>
								<table style="width:50%;">
									<tr>
										<td style="width:20%">비밀번호</td>
										<td><input type="password" name="pw"></td>
									</tr>
									<tr>
										<td>비밀번호확인</td>
										<td><input type="password" name="pwcheck"></td>
									</tr>
									<tr>
										<td>핸드폰번호</td>
										<td><input type="text" name="phone"></td>
									</tr>
								</table>
								  <input type="hidden" name="jobtype" value=""/> 
								   
							</div>
						</form>
						
                 <div class="12u$">
				                    <ul class="actions">
				                    <li><button OnClick="Button1_Click()">비밀번호 수정</button></li>
								   <li><button OnClick="Button2_Click()">핸드폰 번호 수정</button></li>
								   </ul>
				</div>
						</section>
                 </div>
    		</section>
    		<br><br><br><br><br><br><br>
    <!-- Footer -->
			<footer id="footer">
				<%@ include file="../../include/footer.jsp" %>
			</footer>

	<!-- Scripts -->
	
	
<script>
function Button1_Click(){
	   
	   var Jf = document.form1;	   
	   var pw = form1.pw.value;
	   var pwCheck = form1.pwcheck.value;
	   var phone = form1.phone.value;
	   var jobtype = form1.jobtype.value;
	   
	   form1.jobtype.value ="pw";
	   
	   if(!pw)
	   {
	      alert("비밀번호를 입력해 주세요.");
	      pw = "";
	      join__form.pw.focus();
	      return false;
	   }
	   
	   else if(pwCheck != pw)
	   {
	      alert("비밀번호 확인이 동일하지 않습니다.");
	      return false;
	   }
	   else{
		   
	   }
	   form1.submit();
	   
	   
	   
}

function Button2_Click(){
	   
	   var Jf = document.form1;	   
	   var pw = form1.pw.value;
	   var pwCheck = form1.pwcheck.value;
	   var phone = form1.phone.value;
	   var jobtype = form1.jobtype.value;
	   
	   form1.jobtype.value ="phone";
	   
	   if(!phone)
	   {
	      alert("전화번호를 입력해 주세요.");
	      phone = "";
	      join__form.phone.focus();   
	      return false;      
	   }
	   else if(isNaN(콜)) //문자인지 숫자인지 체크
	   {
	      alert("연락처는 숫자만 입력가능합니다.");
	      phone = "";
	      join__form.phone.focus();   
	      return false;
	   }
	   else{		   
		  
	   }
	   form1.submit();
}
</script>	
	<script src="../../../../resources/js/jquery.min.js"></script>
	<script src="../../../../resources/js/skel.min.js"></script>
	<script src="../../../../resources/js/util.js"></script>
	<script src="../../../../resources/js/main.js"></script>
</body>
</html>