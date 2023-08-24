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
		유저가 선택한 상품들을 쿠키에 저장되도록 기능을 구현하시오.  
		- 넘겨받은 value값을 쿠키의 name으로 사용
		- 하나의 상품 또는 여러 개의 상품을 가져올 때 배열로 가져올 것
		 -> request.getParameterValues() 활용
		* 저장확인은 개발자도구 -> 애플리케이션 -> 쿠키로 확인해볼 것
	-->
	<%
		String[] products = request.getParameterValues("product");
		
		if(products != null){
			for(int i=0; i<products.length; i++){
				// 쿠키이름을 하나로 통일하게 되면 마지막에 저장된 값만 쿠키로 생성된다.
				// 여러 상품들이 저장되게 하려면 쿠키이름이 중복되면 안된다.
				Cookie cookie = new Cookie(products[i],products[i]);
				response.addCookie(cookie);
			}
		}
		response.sendRedirect("product_list.jsp");
		
		
	%>



</body>
</html>