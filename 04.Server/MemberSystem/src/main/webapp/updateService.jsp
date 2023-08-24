<%@page import="java.sql.DriverManager"%>
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
		// id, pw, nick, email, phone, gender, age
		// 위의 값을 먼저 다 가져온 다음
		// id와 pw가 일치하는 계정을 찾아
		// 입력한 nick, email, phone, gender,age를 수정하시오
		
		// 수정 성공 시 -> main.jsp로 이동
		// 수정 실패 시 -> update.jsp로 이동
		
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
		String sql = "UPDATE MEMBER SET NICK = ?, EMAIL = ?, PHONE = ?, GENDER = ?, AGE = ? WHERE ID = ? AND PW = ?";
		psmt = conn.prepareStatement(sql);
		
		
		psmt.setString(1, nick);
		psmt.setString(2, email);
		psmt.setString(3, phone);
		psmt.setString(4, gender);
		psmt.setInt(5, age);
		psmt.setString(6, id);
		psmt.setString(7, pw);

		int cnt = psmt.executeUpdate();
				
		if(cnt > 0){
			// 수정 성공
			response.sendRedirect("main.jsp");
		}else{
			// 수정 실패			
			response.sendRedirect("update.jsp");
		} 
		
		
		// 역순으로 자원 반납
		// ResultSet, PreparedStament, Connection
		
		if (psmt != null) {
			psmt.close();
		}
		if (conn != null) {
			conn.close();
		}
		
		
	

		
	%>
</body>
</html>