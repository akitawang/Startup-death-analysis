package cn.fp.dao;

import java.util.List;

import cn.fp.Fclass.Back_data;
import cn.fp.Fclass.Data;

public interface DataDAO {
	public List<Data> getOne(int pageNo);
	public int getPage();
	public List<Back_data> get_location_info();
	public List<Back_data> get_financing_info();
	public List<Data> search(String name,String born,String locate,String financing);
	public List<Back_data> get_field_info();
	public boolean del(Data Data);
	public boolean rec(Data Data);
	public List<Back_data> sum_year();
	public boolean add(Data Data);
	public boolean search_se_cat_exist(String se_cat);
	public boolean search_invest_company_exist(String invest_company);
	public boolean updata_field(String cat);
	public boolean updata_map(String com_addr);
	public List<Data> searchname(String name);
}
