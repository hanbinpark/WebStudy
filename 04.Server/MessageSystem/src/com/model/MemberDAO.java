package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

public class MemberDAO {
	
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	
	// 데이터베이스 연결메소드
	public void getConnection() {
		
		// JDBC순서
		// 0.드라이버 파일 프로젝트에 넣기
		// 1.드라이버 동적로딩
		// 2.커넥션 연결
		// 3.SQL문 실행
		// 4.연결종료
		
		
		// 1.데이터베이스 동적로딩
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 2.커넥션 열기
			// - DB가 존재하는 url, 아이디, 비밀번호
			String db_url = "jdbc:oracle:thin:@project-db-stu3.smhrd.com:1524:xe";
			String db_id = "Insa4_Spring_hacksim_4";
			String db_pw = "aishcool4";
			
			// 권한 가져오기
			conn = DriverManager.getConnection(db_url,db_id, db_pw);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.err.println("ojdbc6.jar 또는 경로를 체크하세요!");
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("DB연결에 필요한 정보가 맞는지 체크하세요!");
		}
	}
	
	// 데이터베이스 종료메소드
	public void close() {
		// 역순으로 자원 반납
		// ResultSet, PreparedStament, Connection
		try {
			if(rs != null) {
				rs.close();
			}
			if(psmt != null) {
				psmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
	}

	public int join(MemberDTO dto) {
		getConnection();
		
		int cnt = 0;
		String sql = "INSERT INTO MSGMEMBER VALUES(?,?,?,?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getEmail());
			psmt.setString(2, dto.getPw());
			psmt.setString(3, dto.getPhone());
			psmt.setString(4, dto.getAddr());
			
			cnt = psmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return cnt;
		
	}

	public MemberDTO login(MemberDTO dto) {
		MemberDTO info = null;
		getConnection();
		
		String sql = "SELECT * FROM MSGMEMBER WHERE EMAIL=? AND PW=?";
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, dto.getEmail());
			psmt.setString(2, dto.getPw());
			
			rs = psmt.executeQuery();
			if(rs.next()) {
				String email = rs.getString(1);
				String pw = rs.getString(2);
				String phone = rs.getString(3);
				String addr = rs.getString(4);
				info = new MemberDTO(email, pw,phone,addr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return info;
	}

	public int update(MemberDTO changeInfo) {
		
		
		getConnection();
		
		int cnt = 0;
		String sql = "UPDATE MSGMEMBER SET PW = ?, PHONE = ?, ADDR = ? WHERE EMAIL = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, changeInfo.getPw());
			psmt.setString(2, changeInfo.getPhone());
			psmt.setString(3, changeInfo.getAddr());
			psmt.setString(4, changeInfo.getEmail());
			
			
			cnt = psmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return cnt;
	}
	
	
}
