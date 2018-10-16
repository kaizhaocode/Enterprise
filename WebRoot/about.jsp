<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>关于我们</title>
    
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

  </head>
  
  <body>
  
    <%@ include file="front/front-header.jsp" %>
    
    <section class="section">
    
    	<div class="container">
    	
    		<div class="row" style="margin-bottom:30px">
    			<div class="col-md-12 text-center">
    				<h1>企业介绍</h1>
    			</div>
    		</div>
    		
    		<div class="row" style="margin-bottom:30px;margin-left:100px;margin-right:100px">
    			<div class="col-md-12">
    				<img src="img/breadgramb_bg.jpg" style="width:100%"/>
    			</div>
    		</div>
    		
    		<div class="row" style="margin-left:100px;margin-right:100px">
    			<div class="col-md-12">
    				
    				<h4>
    					我们是全球领先的人工智能平台公司，同时也是“全球最具价值的AI创新企业”。公司总融资额超过16亿美元，估值超过45亿美元。
    				</h4>
    				<br/>
    				
    				<h4>
    					以“坚持原创，让AI引领人类进步”为使命。公司建立了全球顶级、自主研发的深度学习超算中心和一系列AI技术，包括：人脸识别、图像识别、文本识别、医疗影像识别、视频分析、无人驾驶和遥感等。因此，商汤成为中国最大的AI算法提供商。
    				</h4>
    				<br/>
    				
    				<h4>
    					市场占有率居多个垂直领域首位，涵盖智慧城市、智能手机、互动娱乐及广告、汽车、金融、零售、教育、地产等多个行业。目前，商汤科技已与国内外700多家客户和伙伴建立合作，包括世界知名的公司和机构，例如：美国麻省理工学院、高通、英伟达、本田、阿里巴巴、苏宁、中国移动、银联、万达、华为、小米、OPPO、vivo、微博、和科大讯飞。
    				</h4>
    				<br/>
    				
    			</div>
    		</div>
    	
    	</div>
    
    </section>
    
    <%@ include file="front/front-footer.jsp" %>
     
  </body>
</html>
