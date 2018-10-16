package DataBase;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DataBaseUtil {

	public static ConnectionPool pool = new ConnectionPool();
	
	/*
	 * 从连接池中获得数据库连接对象
	 */
	public static Connection getConnection()throws SQLException{
		return pool.getConnection();
	}
	
	/*
	 * 释放资源，包括连接对象、负责执行sql命令的statement对象、存储查询结果的ResultSet对象
	 */
	public static void release(Connection conn,Statement st,ResultSet rs){
		if(rs!=null){
			try {
				//关闭存储结果对象
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			rs = null;
		}
		
		if(st!=null){
			try {
				st.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(conn!=null){
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	/*
	 * other function
	 */
}
