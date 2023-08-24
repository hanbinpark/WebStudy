<%@page import="java.util.ArrayList"%>
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
		// 세션(Session)
		// - 사용자의 정보를 유지시켜주는 기술
		// - 서버PC에 저장
		// - 다양한 자료형 데이터를 저장 --> Object객체로 변환되어 저장(업캐스팅)
		// - 데이터 저장 시, 개수나 용량 제한이 없음(서버 용량에 따라 달라질 수 있음)
		// - 웹 브라우저에 의존하지 않음
		// * 세션에 데이터를 무분별하게 저장하면 안된다!
		//   사용자가 서비스를 이용하는데 필요한 정보들을 저장해야 한다! ex)로그인
		
		// 세션영역에 데이터를 저장하는 방법
		// - setAttrubute(name,value)
		// - name은 문자열
		// - value는 기본자료형, 참조형 모두 저장 가능
		session.setAttribute("name", "Justin");
		session.setAttribute("age", 25);
		
		ArrayList<String> list = new ArrayList<String>();
		list.add("cookie");
		list.add("session");
		
		session.setAttribute("list", list);
	%>
	
	<h1>세션영역에 데이터 저장 완료</h1>
	
	
</body>
</html>