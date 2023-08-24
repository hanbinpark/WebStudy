<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%--
		선언문
		- JSP안에서 필드 또는 메서드를 만들고 싶을 때 사용
	 --%>
	 
	 <%!
	 	// 선언문 
	 	// 필드 -> 전역변수
	 	public String name = "박병관";
	 
	 	public int plus(int num1, int num2){
	 		return num1 + num2;
	 	}
	 	
	 
	 %>
	 <%
	 	// 스크립트릿
	 	// service 메소드로 들어감 -> 지역변수
	 	// - 접근제한자 사용 불가능
	 	String name2 = "조준용";
	 	
	 %>
	 <%=plus(30,40) %>

</body>
</html>