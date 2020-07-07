package cn.fp.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import cn.fp.dao.AdminDAO;
import cn.fp.util.JdbcUtil;
import cn.fp.Fclass.Admin;

public class AdminDAOImpl implements AdminDAO {
	public Admin getOneUser(String username) {
		// TODO Auto-generated method stub
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs =null;
		

		String sql = "select * from admin where username=?";
		//System.out.println(sql);
		
		try
		{	
			conn = JdbcUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, username);
			rs  = stmt.executeQuery();

			//5、遍历结果
			if(rs.next()){
				Admin admin1 = new Admin();
				admin1.setUsername(rs.getString("username"));
				admin1.setUserpass(rs.getString("userpass"));
				return admin1;
				//(rs.getString("birthday"));
			}
			return null;
//			6、释放占用的资源
		}
		catch(Exception e)
		{
			throw new RuntimeException(e);
		}
		finally
		{
			JdbcUtil.release(rs, stmt, conn);
		}
		
	}
	
	
	public boolean pass_rec(String username,String userpass) {
		// TODO Auto-generated method stub
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs =null;
		

		String sql = "UPDATE  admin  SET userpass=? WHERE username=?";
		//System.out.println(sql);
		
		try
		{	
			conn = JdbcUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, userpass);
			stmt.setString(2, username);
			int rows  = stmt.executeUpdate();

		    if(rows>0)
		    	return true;
			
		}
		catch(Exception e)
		{
			throw new RuntimeException(e);
		}
		finally
		{
			JdbcUtil.release(rs, stmt, conn);
		}
		return false;
		
	}
	
	
}
