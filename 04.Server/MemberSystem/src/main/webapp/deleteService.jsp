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
	<!-- 
		ID와 PW값을 먼저 가져온 다음
		ID와 PW가 일치하는 회원의 정보를 삭제
		
		삭제 성공 -> main.jsp 이동
		삭제 실패 -> delete.jsp 이동
	  -->
	  
	  <%
	  	String id = request.getParameter("id");
	  	String pw = request.getParameter("pw");
	  	
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
 		
 		// 3.SQL문 실행 - delete
 		String sql = "DELETE FROM MEMBER WHERE ID = ? AND PW = ?";
 		psmt = conn.prepareStatement(sql);
 		
 		psmt.setString(1, id);
 		psmt.setString(2, pw);
 	

 		int cnt = psmt.executeUpdate();
 		
 		if (cnt > 0){
 			// 회원탈퇴 성공
 			out.print("<script>");
 			out.print("alert('회원탈퇴 성공!');");
 			out.print("location.href = 'main.jsp'");
 			out.print("</script>");
 			
 			//response.sendRedirect("main.jsp");
 		}else{
 			// 회원탈퇴 실패
 			response.sendRedirect("delete.jsp");
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