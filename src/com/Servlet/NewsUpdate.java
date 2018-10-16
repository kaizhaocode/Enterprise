package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.NewsDAO;
import com.StringUtil.StringUtil;

public class NewsUpdate extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public NewsUpdate() {
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

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		ServletContext application = this.getServletContext();
		
		String title = StringUtil.toUTF8(request.getParameter("title"));		
		String newsid = StringUtil.toUTF8(request.getParameter("newsid"));
		String content = StringUtil.toUTF8(request.getParameter("content"));
		String imgAddr = StringUtil.getImgAddress(content);
		
		System.out.println(content);
		
		NewsDAO newsDao = new NewsDAO();
		if(newsDao.updateNews(newsid, title, content,imgAddr)>0){
			out.print("update000");
			/* 更新applicaiton的内容 */
			try {
				application.setAttribute("carousel", newsDao.queryCarousel());
				application.setAttribute("latestNews", newsDao.queryLatestNews());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			out.print("update001");
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
