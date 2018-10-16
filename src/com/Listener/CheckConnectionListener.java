package com.Listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class CheckConnectionListener implements ServletContextListener{

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		new CheckConnectionTimer();
	}

}
