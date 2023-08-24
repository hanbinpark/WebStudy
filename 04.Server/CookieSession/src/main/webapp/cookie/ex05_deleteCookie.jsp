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
// 		Cookie[] cookies = request.getCookies();
		
// 		if(cookies != null){
// 			for(int i=0; i<cookies.length; i++){
// 				cookies[i].setMaxAge(0);
// 				response.addCookie(cookies[i]);
// 			}
// 		}
		
		Cookie cookie = new Cookie("item","");
		
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		response.sendRedirect("ex05_readCookie.jsp");
	%>
</body>
</html>