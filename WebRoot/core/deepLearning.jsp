<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>深度学习平台</title>
    
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
    				<h1>深度学习平台</h1>
    			</div>
    		</div>
    		
    		<div class="row panel">
    			<div class="panel-body">
	    			<div class="col-md-3">
	    				<h2 style="margin-top:20px">高性能异构分布式云平台</h2>
	    				<br/><br/>
	    				<p>
	    					分布式深度学习平台支持深度学习模型与算法的定制扩展，支持大量通用CPU、GPU或者CPU、GPU混合分布式运算
	    				</p>
	    			</div>
	    			<div class="col-md-9">
	    				<img src="/Enterprise/core/img/deepLearning.jpg" alt="#" style="width:100%;height:240px"/>
	    			</div>
    			</div>
    		</div>
    		
    		
    		
    		<div class="row panel">
    			<div class="panel-body">
	    			<div class="col-md-3">
	    				<h2 style="margin-top:20px">深度学习大规模训练系统</h2>
	    				<br/><br/>
	    				<p>
	    					深度学习大规模训练系统由SenseTime自主开发，支持多机器多GPU分布式深度学习模型训练，支持千亿级参数的模型，上亿类别的大规模分类。行业领先的内存优化和通信优化技术，数百块GPU联合训练，极大提升了公司训练和迭代模型的速度
	    				</p>
	    			</div>
	    			<div class="col-md-9">
	    				<img src="/Enterprise/core/img/deepLearning.jpg" alt="#" style="width:100%;height:240px"/>
	    			</div>
    			</div>
    		</div>
    		
    	</div>
    </section>
    
    <%@ include file="/front/front-footer.jsp" %>
  </body>
</html>
