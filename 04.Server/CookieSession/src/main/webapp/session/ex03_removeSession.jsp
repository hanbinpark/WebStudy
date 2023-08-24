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
		//세션영역에 저장된 특정 데이터를 삭제하는 방법
		session.removeAttribute("name");
		session.removeAttribute("age");
	
	%>
	<h1>세션영역에 저장된 데이터 삭제완료!</h1>



</body>
</html>