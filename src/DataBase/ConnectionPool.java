package DataBase;

import java.io.InputStream;
import java.io.PrintWriter;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.SQLFeatureNotSupportedException;
import java.util.LinkedList;
import java.util.Properties;
import java.util.logging.Logger;

import javax.sql.DataSource;

public class ConnectionPool implements DataSource{
	
	
	/* 浣跨敤闈欐�佸揩浠ｇ爜锛屽垵濮嬪寲杩炴帴姹�
	 * 鍒涘缓linkedlist闆嗗悎锛屽皢杩炴帴鏀惧叆闆嗗悎涓�
	 */
	private static LinkedList<Connection> linkedlist = new LinkedList<Connection>();
	private static String driver;
	private static String url;
	private static String username;
	private static String password;
	private static int jdbcConnectionInitSize;
	private static int max = 1;	//褰撳墠鏈�澶ц繛鎺ユ暟閲�=max*jdbcConnectionInitSize
	
	static{
		/* 閫氳繃鍙嶅皠鏈哄埗鑾峰彇璁块棶鏁版嵁搴撻厤缃枃浠� */
		InputStream is = ConnectionPool.class.getResourceAsStream("/dbconfig.properties");
		Properties prop = new Properties();
		try{
			/* 鍔犺浇閰嶇疆鏂囦欢  */
			prop.load(is);
			/* 鑾峰彇鏁版嵁搴撹繛鎺ヤ俊鎭� */
			driver = prop.getProperty("driver");
			url = prop.getProperty("url");
			username = prop.getProperty("username");
			password = prop.getProperty("password");
			jdbcConnectionInitSize = Integer.parseInt(prop.getProperty("jdbcConnectionInitSize"));
			
			Class.forName(driver);
			
			addConnectionToPool();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	/* 添加connection到连接池中 */
	public static void addConnectionToPool(){
		for(int i=0;i<jdbcConnectionInitSize;++i){
			try {
				Connection conn = DriverManager.getConnection(url,username,password);
				System.out.println("Create Connection "+conn);
				/* 灏嗗垱寤哄ソ鐨勫璞℃坊鍔犲埌闆嗗悎涓� */
				linkedlist.add(conn);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	/*
	 * 瀹炵幇鏁版嵁搴撹繛鎺ョ殑鑾峰彇鍜屾柊鍒涘缓
	 */

	@Override
	public Connection getConnection() throws SQLException {
		
		/*
		 * 濡傛灉闆嗗悎涓病鏈夋暟鎹簱杩炴帴瀵硅薄涓旇繛鎺ュ璞℃病鏈夎揪鍒版渶澶ц繛鎺ユ暟閲忥紝鍙互鍐嶅垱寤轰竴缁勬暟鎹簱杩炴帴瀵硅薄澶囩敤
		 */
		if(linkedlist.size()==0&&max<5){
			addConnectionToPool();
			++max;
		}
		
		if(linkedlist.size()>0){
			/*
			 * 浠巐inkedlist闆嗗悎涓彇鍑轰竴涓暟鎹簱杩炴帴瀵硅薄浣跨敤
			 */
			final Connection connLinked = linkedlist.removeFirst();
			System.out.println("Using connection "+connLinked+";Now size of pool is "+linkedlist.size());
			
			/* 鍔ㄦ�佷唬鐞嗭紝杩斿洖涓�涓繛鎺ュ璞★紝骞朵笖璁剧疆杩炴帴瀵硅薄鏂规硶璋冪敤鐨勯檺鍒� 
			 * 绗簩涓弬鏁扮偣瑙ｄ竴瀹氳鐢ㄥ璞★紵锛�
			 */
			return (Connection)Proxy.newProxyInstance(this.getClass().getClassLoader(),
					connLinked.getClass().getInterfaces(), new InvocationHandler(){
					
					@Override
					public Object invoke(Object proxy,Method method,Object[] args) throws Throwable{
						
						if(!method.getName().equalsIgnoreCase("close")){
							return method.invoke(connLinked, args);
						}else{
							/* 鑻ヨ皟鐢╟lose鏂规硶锛屽垯鎶婅繛鎺ュ璞¤繕缁欒繛鎺ユ睜 */
							linkedlist.addLast(connLinked);
							System.out.println("Recycling connection "+connLinked+";Now size of pool is "+linkedlist.size());
							
							return null;
						}
					}
			});
			
		}else{
			System.out.println("DataBase busying!");
		}
		return null;
		
	}
	
	public void checkConnection(){

		System.out.println("Checking the valid of connection!");
		/* 检测connection是否有效 */
		for(int i=0;i<linkedlist.size();++i){
			/* 只要有一个connection过期就移除全部 */
			try {
				if(!linkedlist.get(i).isValid(5)){
					linkedlist.clear(); /* 清除全部元素 */
					max = 1;
					/* 加入连接对象 */
					addConnectionToPool();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	@Override
	public PrintWriter getLogWriter() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setLogWriter(PrintWriter out) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setLoginTimeout(int seconds) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int getLoginTimeout() throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Logger getParentLogger() throws SQLFeatureNotSupportedException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <T> T unwrap(Class<T> iface) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean isWrapperFor(Class<?> iface) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Connection getConnection(String username, String password) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	

}
