<%@page import="com.control.vo.FestivalApplyVO"%>
<%@page import="com.control.dao.ApplyTripDAO"%>
<%@page import="com.control.vo.FestivalVO"%>
<%@page import="com.control.dao.FestivalDAO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    

<!DOCTYPE html>
<html lang="kr">
<head>
<script src="${pageContext.request.contextPath}/resources/js/summernote/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/summernote/summernote-lite.css">
<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/images/stepIcon.png">

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

	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet">
	<meta charset="UTF-8">
<title>글 작성 | STEP</title>
	<style type="text/css">
		.note-toolbar>div>div>button>i{color: black;}
		.note-toolbar>div>div>button>span{color: black;}
		.note-toolbar>div>button>i{color: black;}
	</style>
</head>
<body>
<!-- Header -->
			<header id="header" class="skel-layers-fixed">
				<h1><a href="/">Step</a></h1>
				<a href="#nav">Menu</a>
			</header>

		<% 
			String fno=request.getParameter("fno"); 
		
			FestivalDAO trip=new FestivalDAO();
			FestivalVO vo;
			trip.setOneFestival(fno);
			
			vo=trip.list.get(0);
		%>
		
		<!-- Nav -->
			<%@ include file="../include/nav.jsp" %>
			<!-- Main -->
    <section id="main" class="wrapper">
				<div class="container">
                    <section>
                        <form method="post" name="write__form" action="writeDB" class="write__form">
                            <div>
                                <h3>리뷰 작성</h3>
                                <hr />
                                <table>
                                    <tr>
                                        <td style="background-color:lightgray; width:210px; height:30px;" align="center">대상 축제</td>
                                        <td><input type="text" name="festival_name" class="fes_name" width="400px" value="<%=vo.getFname() %>" readonly></td>
                                    </tr>
                                    <tr>
                                        <td style="background-color:lightgray; width:210px; height:30px;" align="center">글 제목</td>
                                        <td><input type="text" name="title" width="400px"></td>
                                    </tr>
                                    <tr>
                                        <td style="background-color:lightgray; width:210px; height:300px;" align="center">글 내용</td>
                                        <td><textarea id="summernote" name="editordata" class="editordata"></textarea></td>
                                    </tr>
                                </table>
                                <input type="hidden" name="fno" value="<%=request.getParameter("fno")%>"><br>
								<input type="hidden" name="id" value="<%=session.getAttribute("ID")%>">
                                <hr />
                            </div>
                        </form>
                        <button OnClick="write_submit()" >글작성</button>
                        <a href="list?fno=<%=request.getParameter("fno")%>"><button OnClick="Button2_Click">작성취소</button></a>
                        <a href="list?fno=<%=request.getParameter("fno")%>"><button OnClick="Button3_Click">관련글목록</button></a>
                        <a href="list"><button>전체글목록</button></a>
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
			var comment = write__form.editordata.value;
			if (!title)
			{
				alert("제목을 입력해주세요");
				write__form.title.focus();
				if (!comment)
				{
					alert("글 내용을 입력해주세요");
					write__form.editordata.focus();
				}
			}
			else
			{
				Lf.submit();
			}
		}
	</script>
			
	<!-- Scripts -->
	<!-- <script src="../../../../resources/js/jquery.min.js"></script> -->
	<script src="../../../../resources/js/skel.min.js"></script>
	<script src="../../../../resources/js/util.js"></script>
	<script src="../../../../resources/js/main.js"></script>
</body>
</html>