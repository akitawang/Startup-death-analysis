package cn.fp.dao;

import java.util.List;

import cn.fp.Fclass.Back_data;
import cn.fp.Fclass.Data;


public interface TypeCompanyDAO {
	
	public List<Back_data> getOne();
	public boolean add(Back_data Back_data);
	public List<Back_data> getall();
	public List<Back_data> getonetype(int pageNo , String name);
	public boolean rec(int rank, int number);
	public boolean del(int rank);
	public int getPage(String field,String name);
	public List<Data> getOne(int pageNo,String field,String name);
	public List<Back_data> getcat(String reason);
}
