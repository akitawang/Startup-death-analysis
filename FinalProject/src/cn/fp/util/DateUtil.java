package cn.fp.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	//����ת���ַ���������
	public static String date2String(Date date){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(date);
	}
	//����ת���ַ�����ʱ��
	public static String date2String2(Date date){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(date);
	}
	//�ַ���ת����
	public static Date String2date(String date){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date result=null;
		try {
			result=sdf.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return result;
	}
	//�ַ���ת����
	public static Date String2date2(String date){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date result=null;
		try {
			result=sdf.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return result;
	}
	//java.util.Date--->java.sql.Date
	public static java.sql.Date util2sql(java.util.Date dat){
		return new java.sql.Date(dat.getTime());
	}
	
	
	
	public static java.util.Date sql2util(java.sql.Date dat){
		//new java.sql.Date����;
		
		return new java.util.Date(dat.getTime());
	}
	
	
	
	
	
	
	
}