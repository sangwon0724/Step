<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/images/stepIcon.png">
<title>홍보 문의 | STEP</title>
<meta charset="utf-8">
<style>
	option {background-color: #29333C;}
	.contanier {display:flex; flex-warp:warp; justify-content: space-around;}
	.div_image{
		width: 100%; height: 7.8vh;
		margin: 10px auto 0 auto;
		background-color: #29333C;
		border-radius: 2.5px;
		display: flex; justify-content: center; align-items: center;
	}
	.div_sdate, .div_edate{width: 45%; height: 80px; display: inline-block; margin: 20px auto 0 auto;}
	.div_location{margin-top: 20px;}
	.div_url{/*margin-top: 10px;*/}
	input[type="date"]{background-color: #29333C; width: 45%; heigth: 63.75%; border: none; border-radius: 5px; display: inline-block;}
	.div_tag{width: 60%; height: 80px; margin: 20px auto 0 auto;}
	.div_email{width: 60%; height: 80px; margin: 20px auto 50px auto;}
	.note-editable{color: white; font-size: 13px; min-height: 170px;}
	
	@media screen and (max-width: 980px) {
			input[type="date"]{width: 55%;}
	}
	@media screen and (max-width: 930px) {
			.div_image, .div_tag, .div_email{width: 100%;}
	}
	@media screen and (max-width: 587px) {
			input[type="date"]{width: 65%;}
	}
	@media screen and (max-width: 517px) {
			input[type="date"]{width: 75%;}
	}
</style>
</head>
<body>
<%@page import="com.control.vo.FestivalApplyVO"%>
<%@page import="com.control.dao.ApplyTripDAO"%>
<%@page import="java.util.List"%>


    
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    

<!DOCTYPE html>
<html lang="kr">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/resources/js/summernote/summernote-lite.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/summernote/summernote-lite.css">
	
<script type="text/javascript">
function uploadImageFile(file, editor) {
	data = new FormData();
	data.append("file", file);
	
	$.ajax({
		data : data,
		type : "POST",
		url : "image",	
		dataType:'json',
	    async: true,
		processData: false,		
		contentType: false,				
		success : function(data) {
	    	//항상 업로드된 파일의 url이 있어야 한다.
	    	alert("업로드에 지연시간이 있습니다..");
	    	setTimeout(function(){
	    		   // 1초 후 작동해야할 코드
	    		alert(data.url);
	    		$(editor).summernote('insertImage', data.url);   
	    		   }, 1000);  	
	    	
		},
		error:function(request,status,error){			
			alert("code = "+ request.status);
			alert(" message = " + request.responseText);
			alert(" error = " + error);			 	
			$(editor).summernote('insertImage', 'https://portal.yuhan.ac.kr/yuhan2020/images/login/logo.gif');
		}
	
	});
	}
	
$(document).ready(function() {
	$('#summernote').summernote({
		height: 300,                 // 에디터 높이
		minHeight: null,             // 최소 높이
		maxHeight: null,             // 최대 높이
		focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		lang: "ko-KR",					// 한글 설정
		placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
		callbacks: {	//여기 부분이 이미지를 첨부하는 부분
			onImageUpload : function(files) {
				uploadImageFile(files[0],this);				
			},
			onPaste: function (e) {
				var clipboardData = e.originalEvent.clipboardData;
				if (clipboardData && clipboardData.items && clipboardData.items.length) {
					var item = clipboardData.items[0];
					if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
						e.preventDefault();
					}
				}
			}
		}
});


});

</script>





<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<!-- Header -->
			<header id="header" class="skel-layers-fixed">
				<h1><a href="/">Step</a></h1>
				<a href="#nav">Menu</a>
			</header>

		<!-- Nav -->
			<%@ include file="../include/nav.jsp" %>
			
			<!-- Four -->
			<section id="four" class="wrapper style2 special">
				<div class="inner">
					<header class="major narrow">
						<h2>홍보문의</h2>
						<p>저희 사이트에 소개가 안 되어있거나, 
						<br>추가적으로 홍보하시고 싶은 내용을 보내주세요.</p>
					</header>
					<form method="post" action="registDB">
						<div>
							<div>
								제목<input type="text" name="fname"><br>
								이미지<div class="div_image">
									<input type="file" name="title_image"><br>
								</div><br>
								<div>
									대분류
									<select name="big_area" class="big_area">
										<option value="X">선택하세요</option>
										<option value="서울">서울</option>
										<option value="부산">부산</option>
										<option value="대구">대구</option>
										<option value="인천">인천</option>
										<option value="광주">광주</option>
										<option value="대전">대전</option>
										<option value="울산">울산</option>
										<option value="세종">세종</option>
										<option value="경기">경기</option>
										<option value="강원">강원</option>
										<option value="충북">충북</option>
										<option value="충남">충남</option>
										<option value="경북">경북</option>
										<option value="경남">경남</option>
										<option value="전북">전북</option>
										<option value="전남">전남</option>
										<option value="제주">제주</option>
									</select>
								</div><br>
								<div>
									소분류
									<select name="small_area" class="small_area">
										<option value="X">선택하세요</option>
									</select>
								</div>
								<div class="div_location">
									전체 주소<input type="text" name="location" placeholder="예시 : 충청남도 태안군 남면 마검포길 200 (네이처월드)"><br>
								</div><!-- <br> -->
								<div class="div_url">
									홈페이지 주소<input type="text" name="url" placeholder="예시 : http://www.ffestival.co.kr"><br>
								</div><br>
								<div class="div_sdate">
									시작일<br>
									<input type="date" name="sdate" class="sdate"><br>
								</div>
								<div class="div_edate">
									종료일<br>
									<input type="date" name="edate" class="edate"><br>
								</div>
								<div class="div_tag">
									태그<br>
									 <input type="checkbox" name="category1" value="#액티비티" id="category_activity"><label for="category_activity">액티비티</label>
									 <input type="checkbox" name="category2" value="#문화" id="category_cultrue"><label for="category_cultrue">문화</label>
									 <input type="checkbox" name="category3" value="#음악" id="category_music"><label for="category_music">음악</label>
									 <input type="checkbox" name="category4" value="#자연" id="category_nature"><label for="category_nature">자연</label>
								</div>
								<div class="div_email">
									이메일<input type="email" name="email" class="input_email"><br>
								</div>
								<div class="12u$" style="text-align:left;">
									<textarea id="summernote" name="editordata"></textarea><br>
								</div>
							</div>
						</div>
					<input type="submit">
					<input type="hidden" name="id" value="<%=session.getAttribute("ID") %>">
				</form>
       		</div>
       	</section>
		<!-- Footer -->
			<footer id="footer">
				<%@ include file="../include/footer.jsp" %>
			</footer>
		<!-- Scripts -->
		<script src="../../../../resources/js/regist.js"></script>
		<script src="../../../../resources/js/skel.min.js"></script>
		<script src="../../../../resources/js/util.js"></script>
		<script src="../../../../resources/js/main.js"></script>
	</body>
	</html>
</body>
</html>