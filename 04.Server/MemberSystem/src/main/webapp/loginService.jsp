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
		ID, PW �ΰ��� ������ �޾Ƽ�
		�α����� �� ���� 
		�α��� ������ ����� �г��� �ֿܼ� ���
	  -->
	  
	  <%
	  	String id = request.getParameter("id");
	  	String pw = request.getParameter("pw");
	  	
	  	String nick=null;
	  	
		
		// 1.�����ͺ��̽� �����ε�
		Class.forName("oracle.jdbc.driver.OracleDriver");
		// 2.Ŀ�ؼ� ����
		// - DB�� �����ϴ� url, ���̵�, ��й�ȣ
		String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
		String db_id = "shopping";
		String db_pw = "12345";
		
		// ���� ��������
		Connection conn = DriverManager.getConnection(db_url,db_id, db_pw);
		
		// 3.SQL�� ���� - select
		String sql = "select nick from member where (id = ? and pw = ?) ";
		PreparedStatement psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, id);
		psmt.setString(2, pw);
	

		// ResultSet : sql select���� ����� ���ƿ��� ���̺� ���¸� ���� �� �ִ� ��ü
		ResultSet rs = psmt.executeQuery();
		// rs.next() : Ŀ���� ��ĭ�� �̵���Ű�鼭 �����Ͱ� �ִ��� ������ ������� t/f�� �޾ƿ��� �޼���
		/* while(rs.next()) {
			String nick = rs.getString("nick");
			System.out.println(nick);
		} */
		if(rs.next()){
			// �α��� ����
			nick = rs.getString("nick");
		}
		// �α��� ���� �� -> loginSuccess.jsp
		// �α��� ���� �� -> login.jsp
		if(nick != null){
			// �α��� ����
			nick = URLEncoder.encode(nick,"EUC-KR");
			response.sendRedirect("loginSuccess.jsp?nick="+nick);
		}else {
			// �α��� ����
			response.sendRedirect("login.jsp");
		}
		
		// �������� �ڿ� �ݳ�
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