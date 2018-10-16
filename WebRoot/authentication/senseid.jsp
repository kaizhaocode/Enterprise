<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>身份验证服务</title>
    
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
    	<%@ include file="authentication-header.jsp" %>
    
    	<div class="container">
    		<div class="row">
    			<div class="col-md-3">
    				<h2 style="margin-top:20px">身份验证服务</h2>
    				<br/><br/>
	    			<p>
	    				依托世界领先的人脸识别技术，提供“云+端”的一体化解决方案，包括软件SDK、云服务和身份验证一体机硬件终端产品。通过活体检测、证卡识别、人脸比对等功能，确保用户身份的真实性。为金融行业、移动运营商等客户降低了业务风险，减少了人力资源成本
	    			</p>
    			</div>
    			<div class="col-md-9">
    				<img src="/Enterprise/authentication/img/senseid.png" alt="#" style="width:100%;height:240px"/>
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
	    				<img style="width:100%;height:240px" src="/Enterprise/authentication/img/senseid-1.jpg">
	    				<div class="panel-body">
	    					人脸识别准确率超过人眼精准度，有效降低风险
	    				</div>
    				</div>
    			</div>
    			
    			<div class="col-md-4">
    				<div class="panel">
	    				<img style="width:100%;height:240px" src="/Enterprise/authentication/img/senseid-2.jpg">
	    				<div class="panel-body">
	    					支持活体验证检测，有效防范纸质图片、屏幕翻拍、面具模型等类别的攻击
	    				</div>
    				</div>
    			</div>
    			
    			<div class="col-md-4">
    				<div class="panel">
	    				<img style="width:100%;height:240px" src="/Enterprise/authentication/img/senseid-3.jpg">
	    				<div class="panel-body">
	    					领先的卡证OCR技术，确保高准确率文字、数字识别
	    				</div>
    				</div>
    			</div>
    			
    		</div>
    		
    	</div>
    </section>
    
    <%@ include file="/front/front-footer.jsp" %>
  </body>
</html>
