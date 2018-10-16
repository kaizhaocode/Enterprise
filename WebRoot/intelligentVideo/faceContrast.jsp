<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>人脸对比服务器</title>
    
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
	
  </head>
  
  <body>
    <%@ include file="/front/front-header.jsp" %>
    
    <section style="padding-top:5px" class="section">
    
    	<!-- 导入导航条 -->
    	<%@ include file="intelligentVideo-header.jsp" %>
    
    	<div class="container">
    		<div class="row">
    			<div class="col-md-3">
    				<h2 style="margin-top:20px">人脸静态比对服务器</h2>
    				<br/><br/>
	    			<p>
	    				提供静态图片人脸检测、特征提取、属性分析、属性比对和千万级目标库检索功能
	    			</p>
    			</div>
    			<div class="col-md-9">
    				<img src="/Enterprise/intelligentVideo/img/1.png" alt="#" style="width:100%;height:240px"/>
    			</div>
    		</div>
    		
    		
    		<div style="margin-top:15px" class="row">
				<div class="col-md-12">
					<div class="section-title">
						<h2>产品优势</h2>
					</div>
				</div>
			</div>

    		
    		<div class="row">
    		
    			<div class="col-md-4">
    				<div class="panel">
	    				<img style="width:100%;height:240px" src="/Enterprise/intelligentVideo/img/2.jpg">
	    				<div class="panel-body">
	    					在复杂多变条件下，准确识别人脸
	    				</div>
    				</div>
    			</div>
    			
    			<div class="col-md-4">
    				<div class="panel">
	    				<img style="width:100%;height:240px" src="/Enterprise/intelligentVideo/img/3.jpg">
	    				<div class="panel-body">
	    					千万级目标库人脸搜索速度小于 0.1 秒，单GPU卡入库速度每小时约 200 万 张
	    				</div>
    				</div>
    			</div>
    			
    			<div class="col-md-4">
    				<div class="panel">
	    				<img style="width:100%;height:240px" src="/Enterprise/intelligentVideo/img/4.jpg">
	    				<div class="panel-body">
	    					接口丰富友好,便于业务开发
	    				</div>
    				</div>
    			</div>
    			
    		</div>
    		
    	</div>
    </section>
    
    <%@ include file="/front/front-footer.jsp" %>
  </body>
</html>
