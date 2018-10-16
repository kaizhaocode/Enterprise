package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Bean.User;
import com.DAO.NewsDAO;
import com.StringUtil.StringUtil;

public class NewsRelease extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public NewsRelease() {
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

		System.out.println("It's servlet of NewsRelease!");
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		ServletContext application = this.getServletContext();
		
		User user = (User)session.getAttribute("user");
		
		String title = StringUtil.toUTF8(request.getParameter("title"));		
		String isShow = StringUtil.toUTF8(request.getParameter("isShow"));
		String content = StringUtil.toUTF8(request.getParameter("content"));
		String imgAddr = StringUtil.getImgAddress(content);
		String publisher = user.getUsername();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = sdf.format(new Date());
		
		System.out.println(title);
		System.out.println(content);
		
		/* 插入数据库 */
		NewsDAO newsDao = new NewsDAO();
		if(newsDao.release(title,content,isShow,imgAddr,publisher,time)>0){//更新成功
			out.print("release000");
			
			/* 更新applicaiton的内容 */
			try {
				application.setAttribute("carousel", newsDao.queryCarousel());
				application.setAttribute("latestNews", newsDao.queryLatestNews());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}else{
			out.print("release001");
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
