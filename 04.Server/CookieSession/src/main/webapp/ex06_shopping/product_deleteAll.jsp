<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		모든 상품정보를 삭제한 후에 product_basket.jsp로 이동하는 기능을 구현하시오.
	 -->
	<%
		Cookie[] cookies = request.getCookies();
	
		if(cookies != null){
			
			for(int i = 0; i<cookies.length; i++){
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
			}
		}
		response.sendRedirect("product_basket.jsp");
	%>
</body>
</html>