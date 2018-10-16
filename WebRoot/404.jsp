<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>找不到页面</title>
    
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
    
    <!--breadcrumb -->
    <section class="section">
		<div class="breadcrumb" data-stellar-background-ratio="0.5">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="breadcrumb-text">
							<h2>error 404</h2>
							<ul>
								<li><a href="index.html">Home</a> <i class="fa fa-long-arrow-right" aria-hidden="true"></i></li>
								<li><a href="blog-archive.html">error 404</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/ End breadcrumb -->
		
		
	<!-- 404 Error Page -->
	<section class="error section">
		<div class="table">
			<div class="table-cell">
				<div class="container">
					<div class="row">
						<div class="col-md-6 col-sm-6 col-xs-12">
							<div class="error-left">
								<h2>404</h2>
								<p><span>Opps!</span>Page Not Found!</p>
								<p class="p2">Sorry the Page Could not be Found here.<br>Try using the button below to go to main page of the site</p>
								<div class="button-head">
									<div class="button">
										<span></span>
										<a href="#" class="btn">Go Back</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<div class="error-right">
								<img class="img" src="img/error-img.png" alt="#">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End 404 Error Page -->
    
    <%@ include file="front/front-footer.jsp" %>
    
  </body>
</html>
