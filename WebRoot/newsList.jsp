<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>新闻中心</title>
    
	<link rel="icon" href="img/header-logo1.png">
    
	<meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">   
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/slicknav.min.css">
	<link rel="stylesheet" href="css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">
	<link rel="stylesheet" href="css/animate.min.css">
	<link rel="stylesheet" href="css/animate-text.css">
	<link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
	
	<!-- Ruby CSS -->
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/mystyle.css">
	<link rel="stylesheet" href="css/responsive.css">
	
	<!-- Color CSS -->
	<link rel="stylesheet" href="css/color/color7.css">
	
	<script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
	<script src="js/colors.js"></script>
	<script src="js/jquery.nav.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/jquery.slicknav.min.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/isotope.pkgd.min.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/animate-text.js"></script>
	<script src="js/particles.min.js"></script>
	<script src="js/particle-code.js"></script>
	<script src="js/jquery.counterup.min.js"></script>
	
	<script type="text/javascript" src="js/gmaps.min.js"></script>
	<script src="js/main.js"></script>
	
	<style>
		
		.news-head img{
			width:100%;
			height:240px;
		}
		
	</style>
	
  </head>
  
  <body>
  	
  	<jsp:include page="/servlet/NewsList"></jsp:include>
  	
   	<%@ include file="front/front-header.jsp" %>

   	<section id="blog" class="section">
   	  <div class="container">
   	  	<div class="row">
   			<c:forEach items="${newsList }" var="news" varStatus="s">
   				<!-- 新闻 -->
				<div style="margin-top:15px" class="col-md-4 col-sm-12 col-xs-12 wow fadeIn" data-wow-duration="0.8s" data-wow-delay="0.4s">
					<div class="single-news">
						<!-- 新闻头部-图片 -->
						<div class="news-head">
							<img src="${news.imgAddr }" alt="#">
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
								<a href="/Enterprise/news.jsp?newsid=${news.newsid}" class="btn">
									阅读全文
									<i class="fa fa-carrt right"></i>
								</a>
							</div>
						</div>
						
					</div>
				</div>
   				
   			</c:forEach>
   		</div>
   	  </div>
   	</section>
   	

	<!-- 页码导航 -->
	<div id="pageNavication" class="container text-center">
		<ul class="list-inline">
			<li>
				<a href="/Enterprise/newsList.jsp?curPage=1">
					<button class="btn btn-default">	
					首页
					</button>
				</a>
			</li>
			<li>
				<a href="/Enterprise/newsList.jsp?curPage=${curPage-1}">
					<button class="btn btn-default">	
					前一页
					</button>
				</a>
			</li>
			
			<c:forEach var="i" begin="${beginPage}" end="${endPage}">
				<li>
				  <c:if test="${i==curPage}">	
						<c:out value="${i}" ></c:out> 
				  </c:if>
				  
				  <c:if test="${i!=curPage}">
					<a href="/Enterprise/newsList.jsp?curPage=${i}">
						<button class="btn btn-default">	
							<c:out value="${i}"></c:out> 
						</button>
					</a>
				  </c:if>
				</li>
			</c:forEach>
			
			<li>
				<a href="/Enterprise/newsList.jsp?curPage=${curPage+1}">
					<button class="btn btn-default">	
					后一页
					</button>
				</a>
			</li>
			<li>
				<a href="/Enterprise/newsList.jsp?curPage=${newsPage}">
					<button class="btn btn-default">	
					尾页
					</button>
				</a>
			</li>
		</ul>
	</div>
	<!-- /页码导航 -->	

	<!-- 引入脚步文件 -->
	<%@ include file="front/front-footer.jsp" %>
	
  </body>
</html>
