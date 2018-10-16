<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>uploadFile</title>
    
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
	
	<script src="console/assets/js/jquery-1.10.2.js"></script>
	
	<script>
		var filename = 1;
		$(document).ready(function(){
		
		  /* 增加上传文件 */
		  $("#addFile").click(function(){
		  	++filename;
		    var elem = "<input type='file' name='file"+filename+"'/><br/>";
		    $(this).before(elem);
		  });
		  
		  /* 以ajax的方式提交 */
		  $("#upload").click(function(){
			$.ajax({
				url:'/Enterprise/servlet/UploadHandle',
				type:'POST',
				cache:false,
				data:new FormData($('#uploadForm')[0]),
				processData:false,
				contentType:false,
				success:function(result){
					alert(result);
					location.reload();
				}
			});
		  });
		  
		});	
	</script>
	
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
    					<h1 class="page-head-line">上传文件</h1>
    				</div>
    			</div>
    				
    			<div class="row">
    				<div class="col-md-12">
    					<form id="uploadForm"  enctype="multipart/form-data">
    						<span>
    							<strong>这是不可逆操作！上传文件请谨慎，查询文档以填写上传路径。文件一旦覆盖不能恢复！</strong>
    						</span><br/>
    						
    						<span>
    							<strong>上传路径示例：test1/test2或test</strong>
    						</span><br/>
    						
    	 					<label for="uploadPath">上传路径</label>
    						<input type="text" name="uploadPath" id="uploadPath" />
    						<br/>
    						
    						<label>上传文件</label><br/>
    						<input type="file" name="file1"/><br/>
    						
    						<button type="button" id="addFile">添加上传文件</button>
    						<button type="button" id="upload">提交</button>
    						<br/>
    						
    					</form>
    				
    				</div>
    			</div>
    			
    			
    		</div>
    	</div>
    
    </div>
    
    <!-- 引入脚步文件 -->
    <%@ include file="common/console-footer.jsp" %>
    
  </body>
</html>
