package testself;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class InsertTest {

	public static void main(String[] args) {
		insert("시스템");
		insert("마켓팅");
		insert("운영");
		

	}

	public static boolean main(String[] args) {
		boolean resilt =false;
		
	Connection conn = null;
	Statement stmt=null;
	
	try {
		// 1. JDBC Drive Class Loading
		Class.forName("org.mariadb.jdbc.Driver");

		// 2.연결하기
		String url = "jdbc:mysql://127.0.0.1:3306/webdb?charset=utf8";
		conn = DriverManager.getConnection(url, "webdb", "webdb");
		//3. Statement 생성
		 stmt =conn.createStatement();
		
		//4.실행
		String sql=
				"insert"+
				"into dept"+
				"values(null,'디자인')";

		int count= stmt.executeUpdate(sql);
				
		return resilt;
		
	} catch (ClassNotFoundException e) {
		System.out.println("드라이버로딩 실패:" + e);
	} catch (SQLException e) {
		System.out.println("Error:" + e);
	} finally {
		try {
			if (stmt != null) {
				stmt.close();
			}if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}
}
