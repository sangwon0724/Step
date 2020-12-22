<%@page import="com.control.vo.FestivalApplyVO"%>
<%@page import="com.control.dao.ApplyTripDAO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/images/stepIcon.png">    

<!DOCTYPE html>
<html lang="kr">
<head>
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
<form method="post" action="writeDB">
제목:<input type="text" name="title"><br>
내용:<textarea id="summernote" name="editordata"></textarea><br>
올리기:<input type="submit">
<input type="hidden" name="id" value="test">
</form>
        



</body>
</html>