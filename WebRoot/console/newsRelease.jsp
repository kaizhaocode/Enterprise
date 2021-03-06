<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%@ page contentType="text/html;charset=UTF-8" %>
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
        <title>console-ReleaseNews</title>  
        <meta http-equiv="pragma" content="no-cache">  
        <meta http-equiv="cache-control" content="no-cache">  
        <meta http-equiv="expires" content="0">  
         
        <!-- ueditor配置文件 -->  
        <script type="text/javascript" src="ueditor/ueditor.config.js"></script>  
        <!-- 编辑器源码文件 -->  
        <script type="text/javascript" src="ueditor/ueditor.all.js"></script>  
        <!-- 语言包文件(建议手动加载语言包，避免在ie下，因为加载语言失败导致编辑器加载失败) -->  
        <script type="text/javascript" src="ueditor/lang/zh-cn/zh-cn.js"></script>

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
	    <!-- GOOGLE FONTS-->
	    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
		
		
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
	    					<h1 class="page-head-line">新闻-发布新闻</h1>
	    				</div>
	    			</div>
	    				
	    			<div class="row">
	    				<div class="col-md-12">
	    					<!-- 发布新闻表格 -->
	    					<form id="newsReleaseForm" onsubmit="return false">
	    						<!-- 新闻标题 -->
			     				<div>
			              			<label for="title"><strong>标题</strong></label>
			                		<input type="text" class="form-control" id="title" name="title" placeholder="请输入新闻标题" required>
			            		</div>
			            		
			            		<!-- 是否轮播 -->
			            		<div>
			            			<span><strong>是否设置为轮播:</strong></span>
			            			
			            			<input type="radio"  id="isShow_true" name="isShow" value="true"/>
			            			<label for="isShow_true">是</label>
			            			
			            			<input type="radio"  id="isShow_false" name="isShow" value="false" checked/>
			            			<label for="isShow_false">否</label>
			            			
			            		</div>
			            		
				      			 <hr/>
				      			 
				      			<textarea name="content" id="myEditor"></textarea> 
				      			  
				      			 <!-- 实例化编辑器 --> 
				       			<script type="text/javascript">
				       				//实例化编辑器  
				           			var editor = UE.getEditor('myEditor');
				       			</script>
				       			
				       			<hr/>
				       			<!-- 按钮 -->
				       			<div class="text-right">
				       				<button class="btn btn-default btn-danger" onclick="clearEditor()">清空输入</button>
				       				<button class="btn btn-default btn-info" onclick="newsRelease()">提交</button>
				       			</div>
				       					
			        		</form>
	    					
	    				</div>
	    			</div>
	    			
	    			
	    		</div>
	    	</div>
    
    	</div>
    		
    </body>  
    
</html>  
      			
<script>

	function clearEditor()
	{
		UE.getEditor('myEditor').setContent('',false);
	}
	
</script>