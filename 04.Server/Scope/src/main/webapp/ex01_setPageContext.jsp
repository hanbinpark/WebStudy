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
		// - 하나의 JSP 페이지 내 저장하는 영역
		// - 현재 페이지에서 지역변수로 저장하여 활용하거나 저장한 값을 EL표기법으로 활용할 때
		pageContext.setAttribute("nickName","스코프");
	
	%>
	
	<%=pageContext.getAttribute("nickName") %>
</body>
</html>