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
	<h2>������÷����</h2>
	<fieldset>
		<legend>������÷���</legend>
		<!-- ������ ����ϰ�, ������ �� �ϳ��� �������� �����ؼ� ���  -->
		
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