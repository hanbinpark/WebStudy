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
		ID�� PW���� ���� ������ ����
		ID�� PW�� ��ġ�ϴ� ȸ���� ������ ����
		
		���� ���� -> main.jsp �̵�
		���� ���� -> delete.jsp �̵�
	  -->
	  
	  <%
	  	String id = request.getParameter("id");
	  	String pw = request.getParameter("pw");
	  	
 		// JDBC����
 		// 0.����̹� ���� ������Ʈ�� �ֱ�
 		// 1.����̹� �����ε�
 		// 2.Ŀ�ؼ� ����
 		// 3.SQL�� ����
 		// 4.��������
 		
 		// ���� - JSP�� try-catch �ʿ����
 		// ȸ������ �� main �������� ���ư��� ����� �ϼ��Ͻÿ�.
 		
 		Connection conn = null;
 		PreparedStatement psmt = null;
 		
 		// 1.�����ͺ��̽� �����ε�
 		Class.forName("oracle.jdbc.driver.OracleDriver");
 		// 2.Ŀ�ؼ� ����
 		// - DB�� �����ϴ� url, ���̵�, ��й�ȣ
 		String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
 		String db_id = "shopping";
 		String db_pw = "12345";
 		
 		// ���� ��������
 		conn = DriverManager.getConnection(db_url,db_id, db_pw);
 		
 		// 3.SQL�� ���� - delete
 		String sql = "DELETE FROM MEMBER WHERE ID = ? AND PW = ?";
 		psmt = conn.prepareStatement(sql);
 		
 		psmt.setString(1, id);
 		psmt.setString(2, pw);
 	

 		int cnt = psmt.executeUpdate();
 		
 		if (cnt > 0){
 			// ȸ��Ż�� ����
 			out.print("<script>");
 			out.print("alert('ȸ��Ż�� ����!');");
 			out.print("location.href = 'main.jsp'");
 			out.print("</script>");
 			
 			//response.sendRedirect("main.jsp");
 		}else{
 			// ȸ��Ż�� ����
 			response.sendRedirect("delete.jsp");
 		}
 				
 		// �������� �ڿ� �ݳ�
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