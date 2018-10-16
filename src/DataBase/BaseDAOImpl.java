package DataBase;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*
 * 基本实现操作类
 */
public class BaseDAOImpl {

	/*
	 * function:更新操作(包括增加、删除、修改)
	 * @return 影响的行数
	 * @param sql,sql语句
	 * @param args,参数数组
	 */
	public int update(String sql,Object...args){
		int row = 0;
		try{
			Connection connection = DataBaseUtil.getConnection();
			PreparedStatement pstm = connection.prepareStatement(sql);
			//填充sql占位符
			for(int i=0;i<args.length;++i){
				pstm.setObject(i+1, args[i]);
			}
			row = pstm.executeUpdate();
			
			/* 释放资源 */
			pstm.close();
			connection.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return row;
	}
	
	/*
	 * function:查询操作
	 * 遍历结果集然后创建对应的javabean，然后返回。从结果集红获取结果的别名（别名和javabean属性名对应）
	 * 然后利用反射创建对象并为属性赋值，返回一个javabean对象
	 * @return javabean
	 * @param sql
	 * @param args
	 */
	
	public <T> T querySingle(Class<T> clazz,String sql,Object... args) throws SQLException{
		
		T entity = null;
		Connection connection = null ;
		ResultSet rs = null;
		
		try {
			/* 获取resultSet */
			connection = DataBaseUtil.getConnection();
			PreparedStatement pstm = connection.prepareStatement(sql);
			
			for(int i=0;i<args.length;++i){
				pstm.setObject(i+1, args[i]);
			}
			
			/* 结果集 */
			rs = pstm.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			Map<String,Object> values = new HashMap<String,Object>();
			
			/* 处理结果集，填充Map */
			while(rs.next()){
				for(int i=0;i<rsmd.getColumnCount();++i){
					String columnLable = rsmd.getColumnLabel(i+1);
					
					Object columnValue = rs.getObject(i+1);
					values.put(columnLable, columnValue);
				}
			}
			
			/* 如果map不为空，利用反射创建对象 */
			if(values.size()>0){
				/* 反射创建对象 */
				entity = clazz.newInstance();
				/* 遍历map利用反射为属性赋值 */
				for(Map.Entry<String, Object> entry:values.entrySet()){
					String fieldName = entry.getKey();
					Object value = null;
					/*
					 * 因为java中和mysql中数据类型不一致
					 * mysql中int对应java中的long，所以当查询出int类型数据时候需要转换
					 */
					if(entry.getValue() instanceof Long){
						value = Integer.parseInt(entry.getValue().toString());
					}else{
						value = entry.getValue();
					}
					
					/* 这三句 ??? */
					Field field = clazz.getDeclaredField(fieldName);
					field.setAccessible(true);
					field.set(entity, value);
					
				}
			}
			
			
			
		} catch (SQLException | InstantiationException | IllegalAccessException | NoSuchFieldException | SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(rs!=null)
				rs.close();
			if(connection!=null)
				connection.close();
		}
		
		return entity;
		
	}
	
	/*
	 * 通过反射机制查询多条记录
	 * @param sql
	 * @param params
	 * @param cls
	 * @return list<T>
	 * @throws Exception
	 */
	public <T> List<T> queryMore(Class<T> cls,String sql,Object...args) throws SQLException{
		
		List<T> list = new ArrayList<T>();
		Connection connection = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		try{
			connection = DataBaseUtil.getConnection();
			pstm = connection.prepareStatement(sql);
			
			/* 设置参数 */
			for(int i=0;i<args.length;++i){
				pstm.setObject(i+1, args[i]);
			}
			
			rs = pstm.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			int col_count = rsmd.getColumnCount();
			
			while(rs.next()){
				//通过反射机制创建一个实例
				T resultObject =  cls.newInstance();
				for(int i=0;i<col_count;++i){
					String col_name = rsmd.getColumnName(i+1);
					Object col_value = rs.getObject(col_name);
					if(col_value == null)
						col_value = "";
					Field field = cls.getDeclaredField(col_name);
					field.setAccessible(true);
					field.set(resultObject, col_value);
				}
				list.add(resultObject);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(rs!=null)
				rs.close();
			if(connection!=null)
				connection.close();
		}
		
		return list;
	}
	
	/*
	 * @param sql String,sql语句
	 * @param pageSize int,页面大小即一页几条
	 * @return pageCount int,页数
	 */
	//得到需要分几页
	public int getPageCount(String sql,int pageSize) throws SQLException{
		int pageCount = 0;
		Connection conn = null;
		try{
			conn = DataBaseUtil.getConnection();
			Statement statement = conn.createStatement(ResultSet.TYPE_FORWARD_ONLY,ResultSet.CONCUR_READ_ONLY);
			ResultSet rs = statement.executeQuery(sql);
			rs.last();	//跳转到最后一条记录
			int size = rs.getRow();	//得到总记录条数
			System.out.println("RecordSize:"+size);
			pageCount = (size%pageSize==0)?(size/pageSize):(size/pageSize+1);
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(conn!=null)
				conn.close();
		}
		
		return pageCount;
	}
	
	/*
	 * 查询从某一页开始的n条数据
	 *@param sql String,sql语句
	 *@param curPage int,当前页面数即第几页
	 *@param pageSize int, 页面大小即一页几条
	 */
	//查询指定条数的数据
	public <T> List<T> queryPage(Class<T> cls,String sql,int curPage,int pageSize,Object...args) throws SQLException{
		
		List<T> list = new ArrayList<T>();
		Connection connection = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		try{
			connection = DataBaseUtil.getConnection();
			pstm = connection.prepareStatement(sql);
			
			/* 设置参数 */
			for(int i=0;i<args.length;++i){
				pstm.setObject(i+1, args[i]);
			}
			
			rs = pstm.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			
			int col_count = rsmd.getColumnCount();
			int rowBegin = (curPage-1)*pageSize+1;
			System.out.println("RowBegin:"+rowBegin);
			rs.absolute(rowBegin-1);      //把结果集指针调整到当前页应该显示的记录的开始的前一条
			
			while(rs.next()&&pageSize>0){
				//通过反射机制创建一个实例
				T resultObject =  cls.newInstance();
				for(int i=0;i<col_count;++i){
					String col_name = rsmd.getColumnName(i+1);
					Object col_value = rs.getObject(col_name);
					if(col_value == null)
						col_value = "";
					Field field = cls.getDeclaredField(col_name);
					field.setAccessible(true);
					field.set(resultObject, col_value);
				}
				list.add(resultObject);
				--pageSize;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(rs!=null)
				rs.close();
			if(connection!=null)
				connection.close();
		}
		
		return list;
	}
	
}
