package testself;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DeleteTest {

	public static void main(String[] args) {
		boolean result = delete(7L);
		System.out.println(result ? "성공" : "실패");
	}

	
	private static boolean delete(Long no) {
//		boolean result=false;		
//		return result;
//		public static boolean main(String[] args) {
//			boolean resilt =false;
//			
//		Connection conn = null;
//		Statement stmt=null;
		
		boolean result = false;
		Connection conn = null;
		Statement stmt = null;
		
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
				"delete"
				+ "from dept"
				+ "where no ="+no;	
			
			int count= stmt.executeUpdate(sql);
					
			result = count==1;
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버로딩 실패:" + e);
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
	
	
		return result;
	}
	
}
