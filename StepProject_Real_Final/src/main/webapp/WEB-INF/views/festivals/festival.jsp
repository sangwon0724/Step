<%@page import="java.util.Comparator"%>
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
<%
	FestivalDAO dao=new FestivalDAO();
	FestivalVO vo=new FestivalVO();
	List<String> tags;
	dao.searchByTag("전체","전체");
	dao.order_desc("views");
	

	for(int i=0;i<dao.list.size();i++){
		vo=dao.list.get(i);
		%>
		
		번호: <%out.println(vo.getFno());	%> <br>
		타이틀사진링크: <%out.println(vo.getTitle_image());	%> <br>
		행사명: <a href="./view?fno=<%=vo.getFno()%>"><%out.println(vo.getFname());	%></a> <br>
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
		
		<br><br>
		
		<%	
		
	}
	
	
	
	%>
</body>
</html>