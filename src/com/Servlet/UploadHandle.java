package com.Servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class UploadHandle extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public UploadHandle() {
		super();
	}

	/**
		 * Destruction of the servlet. <br>
		 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
		 * The doGet method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to get.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request,response);
	}

	/**
		 * The doPost method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to post.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("It's servlet of UploadHandle!");
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String message = "";
		
		/* 得到上传文件的保存目录 */
		String savePath = this.getServletContext().getRealPath("\\");

		/* 上传时生成的临时保存文件目录 */
		String tempPath = this.getServletContext().getRealPath("/Web-INF/temp");
		File tempFile = new File(tempPath);
		if(!tempFile.exists()){
			/* 创建临时目录 */
			tempFile.mkdir();
		}
		
		try{
			/* 1.创建DiskFileItemFactory工厂  */
			DiskFileItemFactory factory = new DiskFileItemFactory();
			/* 设置工厂的缓冲区大小
			 * 当上传文件的大小超过缓冲区大小，就会生成一个临时文件存放到指定目录
			 * 在这里设置缓冲区大小为1MB，若不设置默认为10KB
			 */
			factory.setSizeThreshold(1024*1024);
			/* 设置上传时生成的临时文件的保存目录 */
			factory.setRepository(tempFile);
			
			/* 2.创建一个文件上传解析器 */
			ServletFileUpload upload = new ServletFileUpload(factory);
			/* 监听文件上传进度 */
			upload.setProgressListener(new ProgressListener(){

				@Override
				public void update(long pBytesRead, long pContentLength, int arg2) {
					// TODO Auto-generated method stub
					System.out.println("文件大小为:"+pContentLength+";当前已处理:"+pBytesRead);
				}
				
			});
			/* 解决上传文件名的中文乱码 */
			upload.setHeaderEncoding("utf-8");
			
			
			/* 3.判断提交上来的数据是否上传表单的数据 */
			if(!ServletFileUpload.isMultipartContent(request)){
				
			}
			
			/* 设置上传单个文件的大小和最大值
			 * 这里设置为5MB
			 */
			upload.setFileSizeMax(1024*1024*5);
			/* 设置上传文件总量的最大值
			 * 这里设置为20MB
			 */
			upload.setSizeMax(1024*1024*20);
			
			/* 4.使用ServletFileUploadj解析器解析上传数据
			 * 解析结果返回一个List<FileItem>集合
			 * 每一个FileItem对应一个Form
			 */
			List<FileItem> list  = upload.parseRequest(request);
			for(FileItem item:list){
				/* 如果fileItem中封装的是普通输入项的数据 */
				if(item.isFormField()){
					String name = item.getFieldName();
					/* 解决中文乱码问题 */
					String value = item.getString("utf-8");
					
					if(name.equals("uploadPath")){
						if(name!=null||!name.trim().equals("")){
							savePath += "\\"+value+"\\";
							System.out.println(savePath);
						}
					}else{
						message = "文件上传失败";
						break;
					}
					
				}else{/* 如果fileItem封装的是上传文件  */
					String fileName = item.getName();
					if(fileName==null||fileName.trim().equals(""))
						continue;
					/* 处理文件名，只保留文件名部分 */
					fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
					System.out.println(fileName);
					/* 得到文件的扩展名 */
					String fileExtName = fileName.substring(fileName.lastIndexOf(".")+1);
					System.out.println(fileExtName);
					/* 获取item中的上传文件的输入流 */
					InputStream is = item.getInputStream();
					/* 创建一个文件输出流 */
					File saveFile = new File(savePath);
					if(!saveFile.exists()){
						saveFile.mkdir();
					}
					FileOutputStream fos = new FileOutputStream(savePath+"\\"+fileName);
					/* 创建一个缓冲区 */
					byte buffer[] = new byte[1024];
					/* 判断输入流中的数据是否已经读完的标志 */
					int len = 0;
					while((len=is.read(buffer))>0){
						fos.write(buffer,0,len);
					}
					/* 关闭输入流 */
					is.close();
					/* 关闭文件输出流 */
					fos.close();
					/* 删除处理文件上传时的临时文件 */
					//item.delete();
					
					message = "文件上传成功";
				}
			}
			
		}catch(FileUploadBase.FileSizeLimitExceededException e){
			e.printStackTrace();
			message = "单个文件超出最大值";
		}catch (FileUploadBase.SizeLimitExceededException e) {
			e.printStackTrace();
			message = "上传文件总大小超出最大值";
		}catch(Exception e){
			e.printStackTrace();
			message = "文件上传失败";
		}finally{
			out.print("上传成功");
		}
	}

	/**
		 * Initialization of the servlet. <br>
		 *
		 * @throws ServletException if an error occurs
		 */
	public void init() throws ServletException {
		// Put your code here
	}
	

}
