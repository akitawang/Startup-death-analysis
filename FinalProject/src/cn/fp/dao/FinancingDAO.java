package cn.fp.dao;

import java.util.List;

import cn.fp.Fclass.Back_data;
import cn.fp.Fclass.Data;


public interface FinancingDAO {
	public List<Back_data> getOne();
	public List<Back_data> getall();
	public boolean add(Back_data Back_data);
	public List<Back_data> getonetype(int pageNo , String name);
	public boolean rec(int rank, String name ,int number);
	public boolean del(int rank,String name);
	public List<Data> gettop();
	public List<Back_data> getmix();
}
