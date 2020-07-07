package cn.fp.dao;

import java.util.List;

import cn.fp.Fclass.Back_data;


public interface InvestCompanyDAO {
	public List<Back_data> getOne();
	public boolean add(Back_data Back_data);
	public List<Back_data> getall();
	public List<Back_data> getonetype(int pageNo , String name);
	public boolean rec(int rank, int number);
	public boolean del(int rank);
	public List<Back_data> gettarget();
	public List<Back_data> getname();  //��gettarget()һ���ã����Ͷ�ʹ�˾��Ӧ�����й�˾
}