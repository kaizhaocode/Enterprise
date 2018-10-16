<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<nav class="navbar-default navbar-side" role="navigation">
	<div class="sidebar-collapse">
		<ul class="nav" id="main-menu">
			
			<!-- user information -->
			<li>
				<div class="user-img-div">
					<img src="console/assets/img/user.png" class="img-thumbnail"/>
					
					<div class="inner-text">
						<small>上次登陆时间:1分钟之前</small>
						<br/>
						<small>上次登陆ip:127.0.0.1</small>
					</div>
				</div>
			</li>
			
			<li>
				<a class="active-menu"><i class="fa fa-dashboard "></i>管理目录</a>
            </li>
            
            <li>
            	<a href="#"><i class="fa fa-desktop "></i>新闻<span class="fa arrow"></span></a>
            	<ul class="nav nav-second-level">
            		<li>
                    	<a href="console/newsManage.jsp"><i class="fa fa-toggle-on"></i>新闻管理</a>
                    </li>
                    <li>
                    	<a href="console/newsRelease.jsp"><i class="fa fa-edit "></i>新闻发布</a>
                    </li>
            	</ul>
            </li>
            
            <li>
            	<a href="#"><i class="fa fa-yelp "></i>上传<span class="fa arrow"></span></a>
            	<ul class="nav nav-second-level">
            		<li>
            			<a href="console/upload.jsp"><i class="fa fa-flash "></i>上传文件</a>
            		</li>
            	</ul>
            </li>
			
		</ul>
	</div>
</nav>