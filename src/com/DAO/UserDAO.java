package com.DAO;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Bean.User;

import DataBase.BaseDAOImpl;

public class UserDAO extends BaseDAOImpl{
	
	public UserDAO(){}
	
	public User isValid(String username,String password) throws SQLException{
		User user = new User();
		
		String sql = "select * from user where username=? and password=?;";
		
		user = super.querySingle(User.class, sql, username,password);
		
		System.out.println(user);
		return user;
	}

}
