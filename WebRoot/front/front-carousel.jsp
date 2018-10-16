<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page language="java" import="com.Bean.*" %>
<%@ page language="java" import="com.DAO.*" %>

<%
	List<News> carousel = (List<News>)application.getAttribute("carousel");
	if(carousel==null){
		//查询数据库得到carousel
		NewsDAO newsDao = new NewsDAO();
		carousel = newsDao.queryCarousel();
		application.setAttribute("carousel", carousel);
	}

 %>

<section style="padding-top:5px;padding-bottom:0px" class="section">
	<div id="carousel" class="carousel slide">
    	<!-- 指示符 -->
    	<ol class="carousel-indicators">
    		<li data-target="#carousel" data-slide-to="0" class="active"></li>
    		<li data-target="#carousel" data-slide-to="1"></li>
    		<li data-target="#carousel" data-slide-to="2"></li>
    	</ol>
    	
    	<div class="carousel-inner">
	    	<c:forEach items="${carousel }" var="news" varStatus="s">
	    	
	    		<c:if test="${s.index == 0 }">
		    		<!-- first carousel-item -->
		    		<div class="item active">
		    			<img alt="${news.title }" src="${news.imgAddr }">
		    			<!-- 描述 -->
		    			<div class="carousel-caption">
		    				<a href="/Enterprise/news.jsp?newsid=${news.newsid}">
		    					<h3>${news.title }</h3>
		    				</a>
		    			</div>
		    		</div>
	    		</c:if>
	    		
	    		<c:if test="${s.index >0 }">
		    		<!-- first carousel-item -->
		    		<div class="item">
		    			<img alt="${news.title }" src="${news.imgAddr }">
		    			<!-- 描述 -->
		    			<div class="carousel-caption">
		    				<a href="/Enterprise/news.jsp?newsid=${news.newsid}">
		    					<h3>${news.title }</h3>
		    				</a>
		    			</div>
		    		</div>
	    		</c:if>
	    		
	    	</c:forEach>
    	</div>
    	
    	
    	<!-- 左右切换按钮 -->
		<a class="left carousel-control" href="#carousel" role="button" data-slide="prev">
		    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		</a>
		<a class="right carousel-control" href="#carousel" role="button" data-slide="next">
		    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		</a>
    </div>
 </section>  
 