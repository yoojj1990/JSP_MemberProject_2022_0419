package com.yjj.ex;

import java.sql.*;

public class MemberDao {
	
	static String driverName = "com.mysql.jdbc.Driver";
	static String url = "jdbc:mysql://localhost:3306/webdb";
	static String user = "root";
	static String password = "yoojj1990";
	
	public int insertMember(MemberDto dto) {
		
		String m_id = dto.getId();
		String m_pw = dto.getPw();
		String m_name = dto.getName();
		String m_email = dto.getEmail();
		String m_address = dto.getAddress();
		
		String sql = "INSERT INTO web_members(id, pw, name, email, address) VALUES('" + m_id + "','" + m_pw + "','" + m_name + "','" + m_email + "','"+ m_address +"')";
		
		int dbFlag = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;//sql 실행 객체
		
		try {
			Class.forName(driverName);//jdbc 드라이버 로딩
			conn = DriverManager.getConnection(url, user, password);//DB 연동			
			pstmt = conn.prepareStatement(sql);
			
			dbFlag = pstmt.executeUpdate();//sql실행->실행 성공시 1 반환
			
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}			
			
		}
		

		return dbFlag;
	}
	
	public int confirmId(String Id) { //가입여부 확인
		
		int dbFlag = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;//sql 실행 객체
		ResultSet rs = null;
		
		String sql = "SELECT * FROM web_members WHERE id = ?";
		
		try {
			Class.forName(driverName);//jdbc 드라이버 로딩
			conn = DriverManager.getConnection(url, user, password);//DB 연동			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, Id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) { // 조건이 참이면 이미 가입된 아이디
				dbFlag = 1;
			} else {
				dbFlag = 0;
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}			
			
		}
		
		return dbFlag; // 가입이 되있으면 1 아니면 0 반환
	}
	
}
