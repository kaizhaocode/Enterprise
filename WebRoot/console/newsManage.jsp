<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<%  
    String path = request.getContextPath();  
    String basePath = request.getScheme() + "://"  
            + request.getServerName() + ":" + request.getServerPort()  
            + path + "/";  
%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
    <head>  
        <base href="<%=basePath%>">  
        <title>console-ManageNews</title>  
        <meta http-equiv="pragma" content="no-cache">  
        <meta http-equiv="cache-control" content="no-cache">  
        <meta http-equiv="expires" content="0">  

		<!-- 引入ajax的js文件 -->
		<script type="text/javascript" src="js/ajax.js"></script>
		
		<!-- BOOTSTRAP STYLES-->
	    <link href="console/assets/css/bootstrap.css" rel="stylesheet" />
	    <!-- FONTAWESOME STYLES-->
	    <link href="console/assets/css/font-awesome.css" rel="stylesheet" />
	    <!--CUSTOM BASIC STYLES-->
	    <link href="console/assets/css/basic.css" rel="stylesheet" />
	    <!--CUSTOM MAIN STYLES-->
	    <link href="console/assets/css/custom.css" rel="stylesheet" />
		
		<script src="console/assets/js/jquery-1.10.2.js"></script>
		<script src="console/assets/js/my.js"></script>
		
    </head>

    <body>  
    	
    	<jsp:include page="/servlet/NewsList"></jsp:include>
    	
    	<div id="wrapper">
	  		<!-- 引入nav导航条 -->
	    	<%@ include file="common/nav-top.jsp" %>
	    	<%@ include file="common/nav-side.jsp" %>
	    	
	    	<!-- 在这里开始写主体 -->
	    	<div id="page-wrapper">
	    		<div id="page-inner">
	    			
	    			<table class="table table-hover table-bordered">
	    				<tr>
	    					<th>标题</th>
	    					<th>发布人</th>
	    					<th>发布时间</th>
	    					<th>是否轮播</th>
	    					<th class="text-center" colspan="3">操作</th>
	    					<th>备注</th>
	    				</tr>
	    				
	    				<c:forEach items="${newsList }" var="news">
	    				
	    					<tr>
	    						<td>${news.title }</td>
	    						<td>${news.publisher }</td>
	    						<td>${news.time }</td>
	    						<td>${news.isShow }</td>
	    						<td class="text-center">
	    							<button type="button" class="btn btn-danger deleteNews">删除</button>
	    						</td>
	    						<td class="text-center">
	    							<button  type="button" class="btn btn-info">
	    								<a href="/Enterprise/servlet/NewsManage?action=update&newsid=${news.newsid }">
	    									更新
	    								</a>
	    							</button>
	    						</td>
	    						<td class="text-center">
	    							<c:if test="${news.isShow=='true'}">
	    								<button type="button" class="btn closeShow">关闭轮播</button>
	    							</c:if>
	    							<c:if test="${news.isShow=='false'}">
	    								<button type="button" class="btn openShow" ">设为轮播</button>
	    							</c:if>
	    						</td>
	    						<td>
	    							<input type="hidden" id="newsid" value="${news.newsid}"/>
	    						</td>
	    					</tr>
	    				
	    				</c:forEach>

	    			</table>
	    					
	    				
	    			<!-- 页码导航 -->
					<div id="pageNavication" class="container text-center">
						<ul class="list-inline">
							<li>
								<a href="/Enterprise/console/newsManage.jsp?curPage=1">
									<button class="btn btn-default">	
									首页
									</button>
								</a>
							</li>
							<li>
								<a href="/Enterprise/console/newsManage.jsp?curPage=${curPage-1}">
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
									<a href="/Enterprise/console/newsManage.jsp?curPage=${i}">
										<button class="btn btn-default">	
											<c:out value="${i}"></c:out> 
										</button>
									</a>
								  </c:if>
								</li>
							</c:forEach>
							
							<li>
								<a href="/Enterprise/console/newsManage.jsp?curPage=${curPage+1}">
									<button class="btn btn-default">	
									后一页
									</button>
								</a>
							</li>
							<li>
								<a href="/Enterprise/console/newsManage.jsp?curPage=${newsPage}">
									<button class="btn btn-default">	
									尾页
									</button>
								</a>
							</li>
						</ul>
					</div>
					<!-- /页码导航 -->	
	    			
	    		</div>
	    	</div>
    
    	</div>
    		
    </body>  
    
</html>  
      			