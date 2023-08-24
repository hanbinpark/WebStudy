<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>쿠키삭제완료</h1>
	<%
		// 쿠키 삭제하는 방법
		Cookie cookie = new Cookie("name","");
	
		// setMaxAge()를 0으로 설정 -> 삭제
		cookie.setMaxAge(0);
		
		response.addCookie(cookie);
	%>
</body>
</html>