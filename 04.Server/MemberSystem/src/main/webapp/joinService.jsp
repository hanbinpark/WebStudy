<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
		
		// 넘어온 데이터를 기준으로 JDBC를 통해 테이블에 값 넣기(회원가입)
		// 이쪽으로 넘어오는 데이터
		// id, pw, nick, email, phone, gender, age
		request.setCharacterEncoding("EUC-KR");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String nick = request.getParameter("nick");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		int age = Integer.parseInt(request.getParameter("age"));
		
		// JDBC순서
		// 0.드라이버 파일 프로젝트에 넣기
		// 1.드라이버 동적로딩
		// 2.커넥션 연결
		// 3.SQL문 실행
		// 4.연결종료
		
		// 문제 - JSP는 try-catch 필요없음
		// 회원가입 후 main 페이지로 돌아가는 기능을 완성하시오.
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		// 1.데이터베이스 동적로딩
		Class.forName("oracle.jdbc.driver.OracleDriver");
		// 2.커넥션 열기
		// - DB가 존재하는 url, 아이디, 비밀번호
		String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
		String db_id = "shopping";
		String db_pw = "12345";
		
		// 권한 가져오기
		conn = DriverManager.getConnection(db_url,db_id, db_pw);
		
		// 3.SQL문 실행 - insert
		String sql = "insert into member values(?,?,?,?,?,?,?)";
		psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, id);
		psmt.setString(2, pw);
		psmt.setString(3, nick);
		psmt.setString(4, email);
		psmt.setString(5, phone);
		psmt.setString(6, gender);
		psmt.setInt(7, age);

		psmt.executeUpdate();
				
		// 역순으로 자원 반납
		// ResultSet, PreparedStament, Connection
		
		if (psmt != null) {
			psmt.close();
		}
		if (conn != null) {
			conn.close();
		}
		
		
		response.sendRedirect("main.jsp");
	
	%>
</body>
</html>