package com.Listener;

import java.util.Calendar;
import java.util.Date;
import java.util.Timer;

public class CheckConnectionTimer {

	/* ÿʮ���Ӽ��һ�� */
	private static final long periodOfCheck = 1000*60*10;
	
	public CheckConnectionTimer(){
		Calendar calendar = Calendar.getInstance();
		
		/* ����������10���Ӻ�ִ�� */
		Date now = new Date();
		int hour = now.getHours();
		int minute = now.getMinutes()+1;
		if(minute>60){
			minute-=60;
			++hour;
			if(hour>24){
				hour-=24;
			}
		}
		calendar.set(Calendar.HOUR_OF_DAY,hour);
		calendar.set(Calendar.MINUTE,minute);
		calendar.set(Calendar.SECOND, 0);
		
		/* �õ���һ��ִ�ж�ʱ�����ʱ�� */
		Date date = calendar.getTime();
		
		Timer timer = new Timer();
		CheckConnectionTask task = new CheckConnectionTask();
		
		timer.schedule(task,date,periodOfCheck );
	}
}
