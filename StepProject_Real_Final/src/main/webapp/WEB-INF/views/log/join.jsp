<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet">
<title>회원가입 | STEP</title>
</head>
<body>
	<!-- Header -->
			<header id="header" class="skel-layers-fixed">
				<h1><a href="/">Step</a></h1>
				<a href="#nav">Menu</a>
			</header>

		<!-- Nav -->
			<%@ include file="../include/nav.jsp" %>
			
			<!-- 아이디 중복시 알림 -->
			
	<% 
	String messege = (String)request.getAttribute("messege"); 
	%>
			
	<!-- Main -->
    	<section id="main" class="wrapper">
				<div class="container">
                    <section>
                        <h3>회원가입</h3>
                        <hr />
                        			<%
                        			
									if(messege == "Join fail:sameid exists")
									{
									%>
									<h1 style="color:red;">중복된 아이디입니다.</h1> <br>
									<%} %>
                        <form method="post" name="join__form" action="joinDB" acept-charset="UTF-8">
                            <div class="row uniform 50%">
                                <div class="6u 12u$(small)">
                                    <h3>아이디</h3>
                                    <input type="text" placeholder="4~8자 내외" name="id" />	
                                </div>
                                 <ul class="actions">
					                    <li><input type="button" value="중복확인 " name="confirm_id" onClick="confirmID(this.form)"/></li>
				                    </ul>
                                <br /><br /><br /><br /><br />
                                <div class="6u 12u$(small)">
                                    <h3>비밀번호</h3>
                                    <input type="password" placeholder="비밀번호" name="pw"/>
			                    </div>
                                <div class="6u 12u$(small)">
                                    <h3>비밀번호 확인</h3>
                                    <input type="password" placeholder="비밀번호확인" name="pwcheck"/>
			                    </div>
                                <br /><br /><br /><br />
                                <div class="6u 12u$(small)">
                                    <h3>이름</h3>
                                    <input type="text" placeholder="이름" name="name" />	
			                    </div>
                                <br /><br /><br /><br /><br />
                                <div class="6u 12u$(small)">
                                    <h3>연락처</h3>
                                    <input type="text" placeholder="-은빼고 입력해주세요." name="phone" />	                                    
			                    </div>
                            </div>
                            
                        </form>
                        <div class="12u$">
				                    <ul class="actions">
					                    <li><button OnClick="Button1_Click()">회원가입</button></li>
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

function confirmID(){
	var id = join__form.id.value;
	if(!id){
		alter("ID를 입력하세요");
		return;
	}
	
	url = "idCheck?id=" + id;
	open(url, "ChkForm", "width=500, height=300, resizable=no, scrollbars=no, menubar=no, status=no, location=no, toolbar=no");
}


function Button1_Click(){
	   var Jf = document.join__form;
	   var id = join__form.id.value;
	   var pw = join__form.pw.value;
	   var pwCheck = join__form.pwcheck.value;
	   var name = join__form.name.value;
	   var phone = join__form.phone.value;
		
	   if(!id)
	   {
	      alert("아이디를 입력해 주세요.");
	      id = "";
	      join__form.id.focus();
	      return false;
	   }
	   
	   if(!pw)
	   {
	      alert("비밀번호를 입력해 주세요.");
	      pw = "";
	      join__form.pw.focus();
	      return false;
	   }
	   
	   if(pwCheck != pw)
	   {
	      alert("비밀번호 확인이 동일하지 않습니다.");
	      return false;
	   }
	   
	   if(!name)
	   {
	      alert("이름을 입력해 주세요.");
	      name = "";
	      join__form.name.focus();
	      return false;
	   }
	   
	   if(!phone)
	   {
	      alert("전화번호를 입력해 주세요.");
	      phone = "";
	      join__form.phone.focus();   
	      return false;      
	   }
	   if(isNaN(phone)) //문자인지 숫자인지 체크
	   {
	      alert("연락처는 숫자만 입력가능합니다.");
	      phone = "";
	      join__form.phone.focus();   
	      return false;
	   }
	
	
	   Jf.submit();
}
</script>		
	<script src="../../../../resources/js/jquery.min.js"></script>
	<script src="../../../../resources/js/skel.min.js"></script>
	<script src="../../../../resources/js/util.js"></script>
	<script src="../../../../resources/js/main.js"></script>
</body>
</html>