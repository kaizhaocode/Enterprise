<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>人脸与人体分析技术</title>
    
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
    
    <section style="padding-top:30px" class="section">
    	<div class="container">
    		
    		<div style="margin-bottom:30px" class="row text-center">
    			<div class="col-md-12">
    				<h1>人脸与人体分析技术</h1>
    			</div>
    		</div>
    		
    		<div class="row panel">
    			<div class="panel-body">
	    			<div class="col-md-3">
	    				<h2 style="margin-top:20px">人脸检测跟踪</h2>
	    				<br/><br/>
	    				<p>
	    					对背景复杂、低质量的图片或百人人群监控视频，可以在移动设备和个人电脑上实现毫秒级别的人脸检测。该技术可适应侧脸、遮挡、模糊、表情变化等各种实际环境
	    				</p>
	    			</div>
	    			<div class="col-md-9">
	    				<img src="/Enterprise/core/img/rec.jpg" alt="#" style="width:100%;height:240px"/>
	    			</div>
    			</div>
    		</div>
    		
    		
    		
    		<div class="row panel">
    			<div class="panel-body">
	    			<div class="col-md-3">
	    				<h2 style="margin-top:20px">人脸关键点定位</h2>
	    				<br/><br/>
	    				<p>
	    					毫秒级别眼、口、鼻轮廓等人脸21、106、240个关键点定位，支持不同精度的人脸关键点定位，该技术可适应大角度侧脸、大表情变化、遮挡、模糊、明暗变化等各种实际环境
	    				</p>
	    			</div>
	    			<div class="col-md-9">
	    				<img src="/Enterprise/core/img/rec.jpg" alt="#" style="width:100%;height:240px"/>
	    			</div>
    			</div>
    		</div>
    		
    	</div>
    </section>
    
    <%@ include file="/front/front-footer.jsp" %>
  </body>
</html>
