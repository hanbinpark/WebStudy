<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	div,h2,fieldset,input{
		margin: auto;
		text-align: center;
		margin-top: 10px;
	}

</style>
</head>
<body>
	<h2>랜덤당첨게임</h2>
	<fieldset>
		<legend>랜덤당첨결과</legend>
		<!-- 주제를 출력하고, 아이템 중 하나를 랜덤으로 선택해서 출력  -->
		
		<%
			request.setCharacterEncoding("EUC-KR");
			String title = request.getParameter("title");
			String[] item = request.getParameterValues("item");
			Random rd= new Random();
			int rand= rd.nextInt(item.length);
		%>
		<%=title %><br>
		<%= item[rand] %>
		
	
	</fieldset>
</body>
</html>