package com.Servlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class VerifyCode extends HttpServlet {

	//��֤ͼƬ�Ŀ��
	private final int width = 70;
	//��֤ͼƬ�ĸ߶�
	private final int height = 30;
	//��֤���ַ��ĸ���
	private final int codeCount = 4;
	//����߶�
	private int fontHeight;
	
	private int xx = 0;
	private int codeY;
	
	String[] codeSequence = { "1" , "2" , "3" , "4" , "5" ,"6","7","8","9","A","a","B","b","c","C"
		       ,"D","d","E","e","F","f","G","g","z","X","Q","v"};
	
	public VerifyCode() {
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

		System.out.println("It's VerifyCodeServlet!");
		
		HttpSession session = request.getSession();
		
		//����ͼ��buffer
		BufferedImage buffImg = new BufferedImage(width,height,
				BufferedImage.TYPE_INT_RGB);
		Graphics2D gd = buffImg.createGraphics();
		
		//����һ�������������
		Random random = new Random();
		
		//��ͼ�����ɰ�ɫ
		gd.setColor(Color.white);
		gd.fillRect(0, 0, width, height);
		
		//��������
		Font font = new Font("Fixedsys",Font.PLAIN, fontHeight);
		//��������
		gd.setFont(font);
		
		//�߿�
		gd.setColor(Color.black);
		gd.drawRect(0, 0, width-1, height-1);
		
		//�����4��������
		gd.setColor(Color.black);
		for(int i=0;i<4;i++){
			int x = random.nextInt(width);
			int y = random.nextInt(height);
			int xl = random.nextInt(12);
			int yl = random.nextInt(12);
			gd.drawLine(x, y, x + xl, y + yl);
		}
		
		// randomCode���ڱ��������������֤�룬�Ա��û���¼�������֤��
	    StringBuffer randomCode = new StringBuffer();
	    int red = 0, green = 0, blue = 0;
	    
	    //�������codeCount����֤��
	    for(int i=0;i<codeCount;i++){
	    	// �õ������������֤�����֡�
	        String strRand = String.valueOf(codeSequence[random.nextInt(27)]);
	        // �����������ɫ������������ɫֵ�����������ÿλ���ֵ���ɫֵ������ͬ��
	        red = random.nextInt(125);
	        green = random.nextInt(255);
	        blue = random.nextInt(200);
	    
	        // �������������ɫ����֤����Ƶ�ͼ���С�
	        gd.setColor(new Color(red, green, blue));
	        gd.drawString(strRand, (i + 1) * xx, codeY);
	    
	        // ���������ĸ�����������һ��
	        randomCode.append(strRand);
	    }
	    
	    
	    
	    // ��ֹͼ�񻺴档
	    response.setHeader("Pragma", "no-cache");
	    response.setHeader("Cache-Control", "no-cache");
	    response.setDateHeader("Expires", 0);
	    response.setContentType("image/jpeg");
	    
	    //��ͼ������������
	    ServletOutputStream sos = response.getOutputStream();
	    ImageIO.write(buffImg, "jpeg", sos);
	    sos.close();
	    
	   // ����λ���ֵ���֤�뱣�浽Session��
	  session.setAttribute("verification", randomCode.toString());
	  System.out.println("verification:"+randomCode.toString());
	  //��֤����Чʱ��120s
	  session.setMaxInactiveInterval(120);
	   
	}

	/**
		 * Initialization of the servlet. <br>
		 *
		 * @throws ServletException if an error occurs
		 */
	public void init() throws ServletException {
		//�����������ˮƽ����
		xx = width/(codeCount+3);
		//��������������ָ߶�
		fontHeight = height - 2;
		//����������Ĵ�ֱ����
		codeY = height - 8;
	}

}
