<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
		// Page Scope
		// - �ϳ��� JSP ������ �� �����ϴ� ����
		// - ���� ���������� ���������� �����Ͽ� Ȱ���ϰų� ������ ���� ELǥ������� Ȱ���� ��
		pageContext.setAttribute("nickName","������");
	
	%>
	
	<%=pageContext.getAttribute("nickName") %>
</body>
</html>