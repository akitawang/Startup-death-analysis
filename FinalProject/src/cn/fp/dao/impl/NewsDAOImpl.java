package cn.fp.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import cn.fp.Fclass.News;
import cn.fp.dao.NewsDao;
import cn.fp.util.JdbcUtil;

public class NewsDAOImpl implements NewsDao {
	//添加新的领域栏位
	public boolean add(News News) {
		// TODO Auto-generated method stub
		String sql = "insert into news(title,time,location,company,field,fromm,urll)values(?,?,?,?,?,?,?)";
		
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs =null;
		
		//System.out.println(sql);
		try
		{
				
			conn = JdbcUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			
			
			stmt.setString(1,News.getTitle());
			stmt.setString(2,News.getTime());
			stmt.setString(3,News.getLocation());
			stmt.setString(4,News.getCompany());
			stmt.setString(5,News.getField());
			stmt.setString(6,News.getFrom());
			stmt.setString(7,News.getUrll());
			
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
	
	//列表循环读出数据库中的值并以列表的形式返回(查询所有)
	public List<News> getall() {
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs =null;
		String sql = "select * from news";
		
		try
		{
			List<News> list= new ArrayList<News>();
			conn = JdbcUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			
			rs  = stmt.executeQuery();
			while(rs.next()){
				
				News user = new News();
				user.setCompany(rs.getString("company"));
				user.setField(rs.getString("field"));
				user.setFrom(rs.getString("fromm"));
				user.setId(rs.getInt("id"));
				user.setLocation(rs.getString("location"));
				user.setTime(rs.getString("time"));
				user.setTitle(rs.getString("title"));
				user.setUrll(rs.getString("urll"));
				list.add(user);
				//return user;
				//(rs.getString("birthday"));					
			}

				return list;
			
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

	//列表循环读出数据库中的值并以列表的形式返回(查询单个)
	public List<News> getonetype(int pageNo , String name) {
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs =null;
		String sql = "select * from news where company=?";
		
		try
		{
			List<News> list= new ArrayList<News>();
			conn = JdbcUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, name);
			
			rs  = stmt.executeQuery();
			while(rs.next()){
				
				News user = new News();
				user.setCompany(rs.getString("company"));
				user.setField(rs.getString("field"));
				user.setFrom(rs.getString("fromm"));
				user.setId(rs.getInt("id"));
				user.setLocation(rs.getString("location"));
				user.setTime(rs.getString("time"));
				user.setTitle(rs.getString("title"));
				user.setUrll(rs.getString("urll"));
				list.add(user);
				//return user;
				//(rs.getString("birthday"));					
			}

				return list;
			
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
	
	
	//修改子领域栏位
	public boolean rec(News News) {
		// TODO Auto-generated method stub
		String sql="UPDATE  news  SET title=?,time=?,location=?,company=?,field=?,fromm=?,urll=? WHERE id=?";
		
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs =null;
		
		//System.out.println(sql);
		try
		{
				
			conn = JdbcUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			
			
			stmt.setString(1,News.getTitle());
			stmt.setString(2,News.getTime());
			stmt.setString(3,News.getLocation());
			stmt.setString(4,News.getCompany());
			stmt.setString(5,News.getField());
			stmt.setString(6,News.getFrom());
			stmt.setString(7,News.getUrll());
			stmt.setInt(8,News.getId());
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
	
	//删除子领域栏位
	public boolean del(int rank) {
		// TODO Auto-generated method stub
		String sql="delete from news where id=?";
		//String sql1="UPDATE  sub_type  SET date=? ";
		/*
		Date t = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String dated = df.format(t);
		*/
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs =null;
		/*Connection conn1=null;
		PreparedStatement stmt1=null;
		ResultSet rs1 =null;
		//System.out.println(sql);*/
		try
		{
				
			conn = JdbcUtil.getConnection();
			stmt = conn.prepareStatement(sql);				
			stmt.setInt(1,rank);
			
			/*conn1 = JdbcUtil.getConnection();
			stmt1 = conn1.prepareStatement(sql1);				
			stmt1.setString(1,dated);*/
			
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
	
	//搜索查询模块使用 模糊查询
	public List<News> search(String name,String born,String locate,String field) {
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs =null;

		StringBuilder sql = new StringBuilder("select  * from news where 1=1");
		List<News> list= new ArrayList<News>();
		
		
		//System.out.println(sql);
		try
		{
			conn = JdbcUtil.getConnection();
			
			
			if(name != null &&!name.trim().isEmpty()) {
				sql.append(" and company like "+"'%" + name + "%'");
			}
			
			
			if(born != null &&!born.trim().isEmpty() ) {
				sql.append(" and time like "+"'%" + born + "%'");
				
			}
			
			
			if(locate != null &&!locate.trim().isEmpty() ) {
				sql.append(" and location="+"'" + locate + "'");
				
			}
			
			
			if(field != null &&!field.trim().isEmpty() ) {
				sql.append(" and field = "+"'" + field + "'");
				
			}
			
			stmt = conn.prepareStatement(sql.toString());
			/*
			 * 三、执行query
			 */
			
			rs  = stmt.executeQuery();

			while(rs.next()){
				
				News user = new News();
				user.setCompany(rs.getString("company"));
				user.setField(rs.getString("field"));
				user.setFrom(rs.getString("fromm"));
				user.setId(rs.getInt("id"));
				user.setLocation(rs.getString("location"));
				user.setTime(rs.getString("time"));
				user.setTitle(rs.getString("title"));
				user.setUrll(rs.getString("urll"));
				list.add(user);
				//return user;
				//(rs.getString("birthday"));
				
			}
			
				return list;

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
	
	
}
