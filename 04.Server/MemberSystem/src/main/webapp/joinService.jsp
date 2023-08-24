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
		
		// �Ѿ�� �����͸� �������� JDBC�� ���� ���̺� �� �ֱ�(ȸ������)
		// �������� �Ѿ���� ������
		// id, pw, nick, email, phone, gender, age
		request.setCharacterEncoding("EUC-KR");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String nick = request.getParameter("nick");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		int age = Integer.parseInt(request.getParameter("age"));
		
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
		
		// 3.SQL�� ���� - insert
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
				
		// �������� �ڿ� �ݳ�
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