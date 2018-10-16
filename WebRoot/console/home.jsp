<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>console-home</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    

	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<!-- BOOTSTRAP STYLES-->
    <link href="console/assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="console/assets/css/font-awesome.css" rel="stylesheet" />
       <!--CUSTOM BASIC STYLES-->
    <link href="console/assets/css/basic.css" rel="stylesheet" />
    <!--CUSTOM MAIN STYLES-->
    <link href="console/assets/css/custom.css" rel="stylesheet" />

  </head>
  
  <body>
  
  	<div id="wrapper">
  		<!-- 引入nav导航条 -->
    	<%@ include file="common/nav-top.jsp" %>
    	<%@ include file="common/nav-side.jsp" %>
    	
    	<!-- 在这里开始写主体 -->
    	<div id="page-wrapper">
    		<div id="page-inner">
    			
    			<div class="row">
    				<div class="col-md-12">
    					<h1 class="page-head-line">管理首页</h1>
    				</div>
    			</div>
    				
    			<div class="row">
    				<div class="col-md-12">
    					<div class="alert alert-info">
    						欢迎使用abc科技有限公司官网管理系统
    					</div>
    				</div>
    			</div>
    			
    			
    		</div>
    	</div>
    
    </div>
    
    <!-- 引入脚步文件 -->
    <%@ include file="common/console-footer.jsp" %>
    
  </body>
</html>
