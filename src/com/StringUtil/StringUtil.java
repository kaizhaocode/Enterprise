package com.StringUtil;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StringUtil {

	public static String toUTF8(String str) throws UnsupportedEncodingException{
		
		return new String(str.getBytes("iso-8859-1"),"utf-8");
	}
	
	/*
	 * 从一端html文本中截取img标签的地址
	 */
	public static String getImgAddress(String s){
		String regex;
		
		List<String> imgs = new ArrayList<String>();
		regex = "<img.?src=\"(.*?)\".?>";
		Pattern pattern = Pattern.compile(regex,Pattern.DOTALL);
		Matcher matcher = pattern.matcher(s);
		
		while(matcher.find()){
			imgs.add(matcher.group());
		}
	
		if(imgs.size()>0){
			List<String> imgAddress = new ArrayList<String>();
			regex = "src=\"(.*?)\"";
			pattern = Pattern.compile(regex,Pattern.DOTALL);
			for(int i=0;i<imgs.size();++i){
				matcher = pattern.matcher(imgs.get(i));
				while(matcher.find()){
					imgAddress.add(matcher.group(1));
				}
			}
			
			if(imgAddress.size()>0)
				return imgAddress.get(0);
			
		}
		
		return "without pic";
		
	}
	
}
