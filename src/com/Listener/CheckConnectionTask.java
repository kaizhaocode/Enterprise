package com.Listener;

import java.util.TimerTask;

import DataBase.ConnectionPool;
import DataBase.DataBaseUtil;

public class CheckConnectionTask extends TimerTask{

	public void run(){
		DataBaseUtil.pool.checkConnection();
	}
	
}
