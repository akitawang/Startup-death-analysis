package cn.fp.dao;

import java.util.List;

import cn.fp.Fclass.News;

public interface NewsDao {
	public boolean add(News News);
	public List<News> getall();
	public List<News> getonetype(int pageNo , String name);
	public boolean rec(News News);
	public boolean del(int rank);
}
