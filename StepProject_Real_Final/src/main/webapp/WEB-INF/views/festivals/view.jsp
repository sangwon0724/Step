<%@page import="com.control.vo.ReviewVO"%>
<%@page import="com.control.dao.ReviewDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.control.vo.FestivalVO"%>
<%@page import="com.control.dao.FestivalDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>축제 | STEP</title>
</head>
<body>
<%String fno = request.getParameter("fno");%>
<%
	FestivalDAO dao=new FestivalDAO();
	FestivalVO vo=new FestivalVO();
	List<String> tags;
	dao.setOneFestival(fno); 

	for(int i=0;i<dao.list.size();i++){
		vo=dao.list.get(i);
		%>
		번호: <%out.println(vo.getFno());	%> <br>
		타이틀사진링크: <%out.println(vo.getTitle_image());	%> <br>
		행사명: <%out.println(vo.getFname());	%> <br>
		소개: <%out.println(vo.getText());	%> <br>
		대지역: <%out.println(vo.getBig_area()); %><br>
		소지역: <%out.println(vo.getSmall_area()); %><br>
		평점: <%out.println(vo.getGrade());	%> <br>
		전체투표수: <%out.println(vo.getGrade_num());	%> <br>
		전체평점합:<%out.println(vo.getGrade_total());	%> <br>
		조회수: <%out.println(vo.getViews());	%>  <br>
		등록일: <%out.println(vo.getRdate().toString());	%> <br>
		시작일: <%out.println(vo.getSdate().toString()); %><br>
		종료일: <%out.println(vo.getEdate().toString()); %><br>
		태그(단일문자열): <%out.println(vo.getTag()); %><br>
		태그(리스트형태): <%
		tags=vo.getTags();
		for(String item :tags){
			out.println(item+" ");
		}
		
		%>
		<br>리뷰쓰기:<a href="http://localhost:8080/review/write?fno=<%=vo.getFno()%>">리뷰쓰기 </a>
		<br><br>
		
		<%	
		
	}
	
	
	
	%>
	---------------------해당여행의 리뷰들---------------------
<%
	
	ReviewDAO rdao=new ReviewDAO();
	ReviewVO rvo=new ReviewVO();

	rdao.setfestivalReview(fno); 

	for(int i=0;i<rdao.list.size();i++){
	rvo=rdao.list.get(i);
	%>
	
	여행번호: <%out.println(rvo.getFno());	%> <br>
	글번호: <%out.println(rvo.getNo());	%> <br>		
	제목(리뷰보기): <a href="http://localhost:8080/review/view?no=<%=rvo.getNo()%>"><%out.println(rvo.getTitle());	%></a> <br>
	소개: <%out.println(rvo.getText());	%> <br>		
	평점: <%out.println(rvo.getGrade());	%> <br>		
	등록일: <%out.println(rvo.getRdate().toString());	%> <br>
	좋아요:<%out.println(rvo.getLikenum()); %>
	싫어요:<%out.println(rvo.getDislikenum()); %>
	조회수:<%out.println(rvo.getViews()); %>
	
	------------------------------------------------
	<br><br>
	
	<%	
	
}
	
	
	%>




</body>
</html>