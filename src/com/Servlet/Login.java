package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Bean.User;
import com.DAO.UserDAO;


public class Login extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public Login() {
		super();
	}

	/**
		 * Destruction of the servlet. <br>
		 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
		 * The doGet method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to get.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request,response);
	}

	/**
		 * The doPost method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to post.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("It's LoginServlet!");
		
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String verification = request.getParameter("verification");
		System.out.println(username+"/"+password+"/"+verification);
		
		String correctCode = (String)session.getAttribute("verification");
		

		if(!correctCode.equalsIgnoreCase(verification)){

			out.print("login002");
		}else{

			User user = new User();
			UserDAO userDao = new UserDAO();
			
			//从数据库中查询记录
			try {
				user = userDao.isValid(username, password);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			if(user==null){
				//账号或密码错误
				out.print("login001");
			}else{
				//登陆成功，session保存信息
				session.setAttribute("user", user);
				//session.setMaxInactiveInterval(1800);
				out.print("login000");
				session.setMaxInactiveInterval(3600);
			}
		}
	}

	/**
		 * Initialization of the servlet. <br>
		 *
		 * @throws ServletException if an error occurs
		 */
	public void init() throws ServletException {
		// Put your code here
	}

}
