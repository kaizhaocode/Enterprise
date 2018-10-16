<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page language="java" import="com.Bean.*" %>
<%@ page language="java" import="com.DAO.*" %>

<%
	List<News> latestNews = (List<News>)application.getAttribute("latestNews");
	if(latestNews==null){
		//查询数据库得到carousel
		NewsDAO newsDao = new NewsDAO();
		latestNews = newsDao.queryLatestNews();
		application.setAttribute("latestNews", latestNews);
	}
	
 %>

    <!-- news -->
	<section id="blog" class="section">
		<div class="container">
		
			<div class="row">
				<div class="col-md-12">
					<div class="section-title">
						<h2>最新新闻</h2>
						<p>每一个新动态都是我们向前的新脚步</p>
					</div>
				</div>
			</div>
			
			<div class="row">
				<c:forEach items="${latestNews }" var="news">
				
					<!-- 新闻 -->
					<div class="col-md-4 col-sm-12 col-xs-12 wow fadeIn" data-wow-duration="0.8s" data-wow-delay="0.4s">
						<div class="single-news">
							<!-- 新闻头部-图片 -->
							<div class="news-head">
								<img style="width:100%;height:240px" src="${news.imgAddr }" alt="${news.title }">
							</div>
							<!-- 新闻主体 -->
							<div class="news-body">
								<h3 class="date"></h3>
								<h2>
									<a href="/Enterprise/news.jsp?newsid=${news.newsid}">
										${news.title }	
									</a>
								</h2>
								<div class="title">
									<span class="user"><i class="fa fa-user" aria-hidden="true"></i>${news.publisher }</span>
									
									<span class="badge">${news.time }</span>
								</div>
								<div class="text-right">
									<span style="display:inline"><i class="fa fa-comment-o"></i>9999+</span>
									<a href="/Enterprise/news.jsp?newsid=${news.newsid}" class="btn">阅读全文<i class="fa fa-carrt right"></i></a>
								</div>
							</div>
							
						</div>
					</div>
					
				</c:forEach>
			</div>
			
			<div class="row">
				<div class="col-md-12">
					<div class="button-head">
						<div class="button">
							<span></span>
							<a href="/Enterprise/newsList.jsp" class="btn">更多新闻>></a>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</section>
	<!--/ End Newslatter -->
    
  
