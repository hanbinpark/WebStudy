<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.ResultSet"%>
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
		ID, PW 두개의 정보를 받아서
		로그인을 한 다음 
		로그인 성공한 사람의 닉네임 콘솔에 출력
	  -->
	  
	  <%
	  	String id = request.getParameter("id");
	  	String pw = request.getParameter("pw");
	  	
	  	String nick=null;
	  	
		
		// 1.데이터베이스 동적로딩
		Class.forName("oracle.jdbc.driver.OracleDriver");
		// 2.커넥션 열기
		// - DB가 존재하는 url, 아이디, 비밀번호
		String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
		String db_id = "shopping";
		String db_pw = "12345";
		
		// 권한 가져오기
		Connection conn = DriverManager.getConnection(db_url,db_id, db_pw);
		
		// 3.SQL문 실행 - select
		String sql = "select nick from member where (id = ? and pw = ?) ";
		PreparedStatement psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, id);
		psmt.setString(2, pw);
	

		// ResultSet : sql select문을 실행시 돌아오는 테이블 형태를 담을 수 있는 객체
		ResultSet rs = psmt.executeQuery();
		// rs.next() : 커서를 한칸씩 이동시키면서 데이터가 있는지 없는지 결과값을 t/f로 받아오는 메서드
		/* while(rs.next()) {
			String nick = rs.getString("nick");
			System.out.println(nick);
		} */
		if(rs.next()){
			// 로그인 성공
			nick = rs.getString("nick");
		}
		// 로그인 성공 시 -> loginSuccess.jsp
		// 로그인 실패 시 -> login.jsp
		if(nick != null){
			// 로그인 성공
			nick = URLEncoder.encode(nick,"EUC-KR");
			response.sendRedirect("loginSuccess.jsp?nick="+nick);
		}else {
			// 로그인 실패
			response.sendRedirect("login.jsp");
		}
		
		// 역순으로 자원 반납
		// ResultSet, PreparedStament, Connection
		if(rs != null){
			rs.close();
		}
		if (psmt != null) {
			psmt.close();
		}
		if (conn != null) {
			conn.close();
		}
		
		
	  	
	  %>
</body>
</html>