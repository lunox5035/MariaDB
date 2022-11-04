package com.bitacademy.emaillist.app;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class SQL {
//	private static String[] getSql() {
//		String[] Sql=null;
//		Sql= getSql();
//		return Sql;	
//	}

	private void Sql();
	
	
	
	public static void main(String[] args) {
	boolean result = false;
	
	Connection conn = null;
	Statement stmt = null;
	
	try {
		//1. JDBC Driver Class Loading
		Class.forName("org.mariadb.jdbc.Driver");
		
		//2. 연결하기
		String url = "jdbc:mysql://127.0.0.1:3306/webdb?charset=utf8";
		conn = DriverManager.getConnection(url, "webdb", "webdb");
		
		//3. Statement 생성
		stmt = conn.createStatement();

		//4. SQL 실행
		String[] sql= Sql();
		
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패:" + e);
		} catch (SQLException e) {
			System.out.println("Error:" + e);
		} finally {
			try {
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
	}
}

