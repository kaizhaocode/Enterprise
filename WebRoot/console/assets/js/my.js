$(document).ready(function(){

	//打开轮播
	$(".openShow").click(function(){
		
		var newsid = $(this).parent().next().children("#newsid").val();
		var send = "action=open&newsid="+newsid;

		
		$.ajax({
			type:"POST",
			url:"servlet/NewsManage",
			data:send,
			success:function(result){
				console.log(result);
				if(result=="open000")
					window.location.reload();
				else if(result=="open001")
					alert("开启失败！");
				else
					alert("参数错误！");
			}
		});
	});
	
	//关闭轮播
	$(".closeShow").click(function(){
		
		var newsid = $(this).parent().next().children("#newsid").val();
		var send = "action=close&newsid="+newsid;
		
		$.ajax({
			type:"POST",
			url:"servlet/NewsManage",
			data:send,
			success:function(result){
				console.log(result);
				if(result=="close000")
					window.location.reload();
				else if(result=="close001")
					alert("关闭失败！");
				else
					alert("参数错误！");
			}
		});
	});

	
	//删除新闻
	$(".deleteNews").click(function(){
		
		var newsid = $(this).parent().next().children("#newsid").val();
		var send = "action=delete&newsid="+newsid;
		
		$.ajax({
			type:"POST",
			url:"servlet/NewsManage",
			data:send,
			success:function(result){
				console.log(result);
				if(result=="delete000")
					window.location.reload();
				else if(result=="delete001")
					alert("删除失败！");
				else
					alert("参数错误！");
			}
		});
	});
	
	$("#updateNewsBtn").click(function(){
		var newsid = $("#newsid").val();
		var title = $("#title").val();
		var content = editor.getContent();
		
		newsid = encodeURIComponent(newsid);
		title = encodeURIComponent(title);
		content = encodeURIComponent(content);
		
		var send = "newsid="+newsid+"&title="+title+"&content="+content;
		
		console.log(send);
		
		$.ajax({
			type:"POST",
			url:"servlet/NewsUpdate",
			data:send,
			success:function(result){
				console.log(result);
				if(result=="update000"){
					alert("更新成功!");
					location.href = "/Enterprise/console/newsManage.jsp";
				}
				else if(result=="update001")
					alert("更新失败！");
				else
					alert("参数错误！");
			}
		});
		
	});
});