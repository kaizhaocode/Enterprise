
package com.Bean;

public class User {

	private String username;
	private String password;
	private String grade;
	
	public User(){}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	public String toString(){
		return "User[username="+username+";password="+password
				+";grade="+grade+"]";
	}
	
	
}
