package com.DAO;

import java.sql.SQLException;
import java.util.List;

import com.Bean.News;

import DataBase.BaseDAOImpl;

public class NewsDAO extends BaseDAOImpl{

	
	public NewsDAO(){}
	
	public int release(String title,String content,String isShow,String imgAddr,String publisher,String time){
		
		String sql = "insert into news (title,content,isShow,imgAddr,publisher,time) values(?,?,?,?,?,?);";
		
		return super.update(sql, title,content,isShow,imgAddr,publisher,time);
	}
	
	public int getNewsPageCount(int pageSize) throws SQLException{
		
		String sql = "select * from news;";
		
		return super.getPageCount(sql, pageSize);
	}
	
	public List<News> queryNewsListByPage(int curPage,int pageSize) throws SQLException{
		
		String sql = "select * from news order by time desc";
		
		return super.queryPage(News.class, sql, curPage, pageSize);
	}
	
	public News querySingleNews(String newsid) throws SQLException{
		
		String sql = "select * from news where newsid=?";
		
		return super.querySingle(News.class, sql, newsid);
		 
	}
	
	public List<News> queryCarousel() throws SQLException{
		String sql = "select * from news where isShow='true' limit 0,3";
		
		return super.queryMore(News.class, sql);
	}
	
	public List<News> queryLatestNews() throws SQLException{
		String sql = "select * from news order by time desc limit 0,3";
		
		return super.queryMore(News.class, sql);
	}
	
	public int openShow(String newsid){
		
		String sql = "update news set isShow='true' where newsid = ?";
		
		return super.update(sql, newsid);
	}
	
	public int closeShow(String newsid){
		
		String sql = "update news set isShow='false' where newsid = ?";
		
		return super.update(sql, newsid);
	}
	
	public int deleteNews(String newsid){
		
		String sql = "DELETE FROM news WHERE newsid=?;";
		
		return super.update(sql, newsid);
	}
	
	public int updateNews(String newsid,String title,String content,String imgAddr){
		String sql = "update news set title=?,content=?,imgAddr=? where newsid=?";
		
		return super.update(sql, title,content,imgAddr,newsid);
	}
}
