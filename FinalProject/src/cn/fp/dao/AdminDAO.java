package cn.fp.dao;

import cn.fp.Fclass.Admin;

public interface AdminDAO {
	public Admin getOneUser(String username);
	public boolean pass_rec(String username,String userpass);

}
