<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>장바구니</h1>
	
	<fieldset>
		<legend>상품리스트</legend>
		<!-- 
			쿠키에 저장된 상품들을 출력하는 기능을 구현하시오. 
			- "product" -> "상품"변환 (replace() 활용)
		 -->
		<ul>
		<%
	
		Cookie[] cookies = request.getCookies();
		
		if(cookies != null){
			for(int i = 0; i<cookies.length; i++){
				// JSESSIONID를 제외한 쿠키정보만 출력
				if(cookies[i].getName().contains("product")){
					String product = cookies[i].getValue().replace("product", "상품");
					out.print("<li>"+product+"</li>");
				}
			}
		}
		%>
		</ul>
		
	
	</fieldset>
	<p><a href="product_list.jsp">계속쇼핑하기</a></p>
	<p><a href="product_deleteAll.jsp">모든상품삭제</a></p>
</body>
</html>