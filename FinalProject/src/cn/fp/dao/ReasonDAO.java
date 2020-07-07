package cn.fp.dao;

import java.util.List;

import cn.fp.Fclass.Back_data;
import cn.fp.Fclass.Data;

public interface ReasonDAO {
	public List<Data> getindex_data(String reason);
	public List<Back_data> getOne(String reason);
}
