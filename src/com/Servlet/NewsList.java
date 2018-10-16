package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Bean.News;
import com.DAO.NewsDAO;

public class NewsList extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	int curPage = 1;	/* 当前页  */
	final int pageSize = 9;	/* 页面记录条数  */
	int newsPage = 0;	/* 新闻总页数 */
	int beginPage = 0;	/* 起始业 */
	int endPage = 0;	/* 结束页 */
	
	public NewsList() {
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

		System.out.println("It's servlet of NewsList!");
		
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		NewsDAO newsDao = new NewsDAO();
		
		String curPageStr = request.getParameter("curPage");
		
		try {
			newsPage = newsDao.getNewsPageCount(pageSize);
			
			if(curPageStr==null||curPageStr.equals(""))
				curPage = 1;
			else
				curPage = Integer.parseInt(curPageStr);
			
			if(curPage<1)
				curPage = 1;
			
			if(curPage > newsPage)
				curPage = newsPage;
			
			if(curPage<=5)
				beginPage = 1;
			else
				beginPage = curPage-5;
			
			endPage = beginPage+10;
			if(endPage>newsPage)
				endPage = newsPage;
			
			List<News> newsList = newsDao.queryNewsListByPage(curPage, pageSize);
			
			
			session.setAttribute("newsList",newsList);
			session.setAttribute("curPage", curPage);
			session.setAttribute("beginPage", beginPage);
			session.setAttribute("endPage", endPage);
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
