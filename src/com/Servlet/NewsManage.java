package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.NewsDAO;

public class NewsManage extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public NewsManage() {
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

		System.out.println("It's servlet of NewsManage!");
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		ServletContext application  = this.getServletContext();
		HttpSession session = request.getSession();
		
		NewsDAO newsDao = new NewsDAO();
		
		String action = request.getParameter("action");
		String newsid = request.getParameter("newsid");
		
		if(action==null)
			response.sendRedirect("/Enterprise/404.jsp");
		
		switch(action){
			
			case "open":
				if(newsDao.openShow(newsid)>0){
					try {
						out.print("open000");
						application.setAttribute("carousel", newsDao.queryCarousel());
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				else
					out.print("open001");
				break;
			case "close":
				if(newsDao.closeShow(newsid)>0){
					try {
						out.print("close000");
						application.setAttribute("carousel", newsDao.queryCarousel());
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}	
				else
					out.print("close001");
				break;
			case "delete":
				if(newsDao.deleteNews(newsid)>0){
					out.print("delete000");
				}	
				else
					out.print("delete001");
				break;
			
			case "update":
					try {
						if(newsid!=null||!newsid.equals("")){
							session.setAttribute("updateNews", newsDao.querySingleNews(newsid));
							response.sendRedirect("/Enterprise/console/newsUpdate.jsp");
						}else{
							response.sendRedirect("/Enterprise/404.jsp");
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				break;
				
			default:
				response.sendRedirect("/Enterprise/404.jsp");
				break;
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
