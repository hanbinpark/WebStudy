<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
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
			String sql = "SELECT ID,NICK,EMAIL,PHONE,GENDER,AGE FROM MEMBER";
			PreparedStatement psmt = conn.prepareStatement(sql);

			// ResultSet : sql select문을 실행시 돌아오는 테이블 형태를 담을 수 있는 객체
			ResultSet rs = psmt.executeQuery();
			
			out.print("<table border='1'>");
			out.print("<tr><th>ID</th><th>NICK</th><th>EMAIL</th><th>PHONE</th><th>GENDER</th><th>AGE</th></tr>");
			
			// rs.next() : 커서를 한칸씩 이동시키면서 데이터가 있는지 없는지 결과값을 t/f로 받아오는 메서드
			while(rs.next()) {
				String id = rs.getString(1);
				String nick = rs.getString(2);
				String email = rs.getString(3);
				String phone = rs.getString(4);
				String gender = rs.getString(5);
				int age = rs.getInt(6);
				
// 				System.out.println(id+"/"+nick+"/"+email+"/"+phone+"/"+gender+"/"+age);

				// id가 "admin"이 아닌 회원만 출력하는 조건
				if(!id.equals("admin")){
					out.print("<tr>");
					out.print("<td>"+id+"</td>");
					out.print("<td>"+nick+"</td>");
					out.print("<td>"+email+"</td>");
					out.print("<td>"+phone+"</td>");
					out.print("<td>"+gender+"</td>");
					out.print("<td>"+age+"</td>");
					out.print("</tr>");
				}
			} //end while
			out.print("</table>");
			
			
			
			
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