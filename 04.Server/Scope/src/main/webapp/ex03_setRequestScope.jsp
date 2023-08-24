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
		// Request Scope
		// - 하나 이상의 JSP 페이지에서 정보를 유지시키는 영역
		// - forward방식으로 이동할 때 정보를 유지시킬 수 있음
		request.setAttribute("nickName", "스코프");
	
		// 다음 페이지로 이동하는 방법 : redirect
		// - 페이지 이동(단순이동, 데이터베이스에 변화를 주는 이동)
		// - 요청이 두 번 발생(정보전달X)
		// - 내부 or 외부 페이지 접근 가능
		// 예) 로그인
		//response.sendRedirect("ex04_getRequestScope.jsp");
		
		// 다음 페이지로 정보를 전달할 때 사용하는 방법 : forward
		// - 페이지 이동(조회된 정보를 유지할 때)
		// - 요청을 한 번만 발생
		// - 내부 페이지만 접근 가능
		RequestDispatcher dispatcher = request.getRequestDispatcher("ex04_getRequestScope.jsp");
		dispatcher.forward(request, response);
	%>
	<h1>Request영역</h1>
	<%=request.getAttribute("nickName") %>
	
</body>
</html>