<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>Application 영역</h1>
	<% 
		// Application Scope
		// - 모든 사용자들에게 공통적으로 사용하는 값을 유지시키는 영역
		// - ex)방문자 수
		application.setAttribute("nickName","스코프");
		response.sendRedirect("ex08_getApplicationScope.jsp");
	%>

</body>
</html>