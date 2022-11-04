package com.bitacademy.emaillist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bitacademy.emaillist.vo.EmaillistVo;

public class EmaillistDao {
	public Boolean insert(EmaillistVo vo) {
		return false;
	}
	
	public Boolean deleteByEmail(String email) {
		return false;
	}
	
	public List<EmaillistVo> findAll() {
		List<EmaillistVo> result = new ArrayList<>();
	
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			
			String url = "jdbc:mysql://127.0.0.1:3306/webdb?charset=utf8";
			conn = DriverManager.getConnection(url, "webdb", "webdb");
			
			stmt = conn.createStatement();
			
			String sql = 
				"   select frst_name, last_name, emaill" + 
			    "     from emaillist" + 
				" order by no desc";
			
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				String firstName = rs.getString(1);
				String lastName = rs.getString(2);
				String email = rs.getString(3);
				
				EmaillistVo vo = new EmaillistVo();
				vo.setFitstName(firstName);
				vo.setLastName(lastName);
				vo.setEmail(email);
				
				result.add(vo);
			}
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패:" + e);
		} catch (SQLException e) {
			System.out.println("Error:" + e);
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				
				if(stmt != null) {
					stmt.close();
				}
				
				if(conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}		
		
		return result;
	}

//
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.sql.Statement;
//
//public class EmaillistDao {
//	public List<EmaillistVo> findAll() {
//		List<EmaillistVo> result =new ArryList<>();
//		
//		
//		
//		
//		
//		
//		
//		
//		
//		
//		
//		return result;
//	}
	
}

//private static void search(String keyword) {
//	Connection conn = null;
//	Statement stmt = null;
//	ResultSet rs = null;
//	
//	try {
//		//1. JDBC Driver Class Loading
//		Class.forName("org.mariadb.jdbc.Driver");
//		
//		//2. 연결하기
//		String url = "jdbc:mysql://127.0.0.1:3306/webdb?charset=utf8";
//		conn = DriverManager.getConnection(url, "webdb", "webdb");
//		
//		//3. Statement 생성
//		stmt = conn.createStatement();
//		
//		//4. SQL 실행
//		String sql = 
//			"select first_name, last_name"+
//					"from emillist"+
//					"order by no desc"
//		
//		rs = stmt.executeQuery(sql);
//		while(rs.next()) {
//			String firstName = rs.getString(1);
//			String lasttName = rs.getString(2);
//			String email = rs.getString(3);
//
//			EmaillistVo vo= new EmaillistVo();
//			no.setFirstName();
//			no.setLasttName();
//			no.set();
//			
//			reslt.add(vo)
//		}
//		
//	} catch (ClassNotFoundException e) {
//		System.out.println("드라이버 로딩 실패:" + e);
//	} catch (SQLException e) {
//		System.out.println("Error:" + e);
//	} finally {
//		try {
//			if(rs != null) {
//				rs.close();
//			}
//			
//			if(stmt != null) {
//				stmt.close();
//			}
//			
//			if(conn != null) {
//				conn.close();
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//	}
//		return Result;
//	}
//}