<%@page import="com.control.vo.FestivalApplyVO"%>
<%@page import="com.control.dao.ApplyTripDAO"%>
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

<script type="text/javascript">
$(document).ready(function(){

    $("#button").click(function(){
        callAjax();
    });

  });

  function callAjax(){
	  var m = 30;
      $.ajax({
	       type: "get",
	       url : "jsontest1",
	       dataType:'json',
	       async: false,
	       data: {"xdata": 10},
	       success: function(data) {
		    	//항상 업로드된 파일의 url이 있어야 한다.
		    	alert("수정되었습니다");
		    	},
	       error: function(request,status,error){
	    	   alert("수정되었습니다????????");
	    	   alert("code = "+ request.status);
				alert(" message = " + request.responseText);
				alert(" error = " + error);		
	       }
   	});

  }



</script>






<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<input id="button" type="button" value="버튼">


        



</body>
</html>