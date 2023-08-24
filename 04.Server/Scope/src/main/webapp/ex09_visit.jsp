<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>누적 방문자 수</h1>
	<% 
		Integer visit = (Integer)application.getAttribute("visit");
		
		if(visit == null){
			application.setAttribute("visit", 0);
			visit = 0;
		}else{
			visit += 1;
			application.setAttribute("visit", visit );
		}
	
	
	%>
	<h1><%=visit %>명</h1>
</body>
</html>