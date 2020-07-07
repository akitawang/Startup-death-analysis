package cn.fp.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;

import java.util.List;

import cn.fp.Fclass.Back_data;
import cn.fp.dao.SubtypeDAO;
import cn.fp.util.JdbcUtil;

public class SubtypeDAOImpl implements SubtypeDAO {
	//列表循环读出数据库中的值并以列表的形式返回
	public List<Back_data> getOne() {
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs =null;
		String sql = "select  * from sub_type";
		
		//System.out.println(sql);
		try
		{
			 List<Back_data> list= new ArrayList<Back_data>();
			conn = JdbcUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			rs  = stmt.executeQuery();
			int time = 0;

			while(rs.next()){
				time++;
				Back_data user = new Back_data();
				user.setRank(rs.getInt("rank"));
				user.setName(rs.getString("name"));
				user.setNumber(rs.getInt("number"));
				list.add(user);
				//return user;
				//(rs.getString("birthday"));
				
			}
			int i=0,j=0;
			for(i=0;i<time;i++) {
				for(j=0;j<time;j++)
				if( (list.get(i).getNumber()-list.get(j).getNumber())>0 ) {
					Back_data container = list.get(i);
					list.set(i, list.get(j));
					list.set(j, container);
				}
				
			}
			List<Back_data> fin = new ArrayList<Back_data>();
			
			int k=0;
			if(time<6) {
				return list;
			}
			else {
				while(k!=6) {
					fin.add(list.get(k));
					k++;
				}
				
				return fin;		
			}
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
	
	//添加新的子领域栏位
	public boolean add(Back_data Back_data) {
		// TODO Auto-generated method stub
		String sql = "insert into sub_type(name,number)values(?,?)";
		
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs =null;
		
		//System.out.println(sql);
		try
		{
				
			conn = JdbcUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			
			
			stmt.setString(1,Back_data.getName());
			stmt.setInt(2, Back_data.getNumber());
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
			public List<Back_data> getall() {
				Connection conn=null;
				PreparedStatement stmt=null;
				ResultSet rs =null;
				String sql = "select * from sub_type";
				
				try
				{
					List<Back_data> list= new ArrayList<Back_data>();
					conn = JdbcUtil.getConnection();
					stmt = conn.prepareStatement(sql);
					
					rs  = stmt.executeQuery();
					while(rs.next()){
						
						Back_data user = new Back_data();
						user.setRank(rs.getInt("rank"));
						user.setName(rs.getString("name"));
						user.setNumber(rs.getInt("number"));
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
			public List<Back_data> getonetype(int pageNo , String name) {
				Connection conn=null;
				PreparedStatement stmt=null;
				ResultSet rs =null;
				String sql = "select * from sub_type where name=?";
				
				try
				{
					List<Back_data> list= new ArrayList<Back_data>();
					conn = JdbcUtil.getConnection();
					stmt = conn.prepareStatement(sql);
					
					stmt.setString(1, name);
					
					rs  = stmt.executeQuery();
					while(rs.next()){
						
						Back_data user = new Back_data();
						user.setRank(rs.getInt("rank"));
						user.setName(rs.getString("name"));
						user.setNumber(rs.getInt("number"));
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
			public boolean rec(int rank, int number) {
				// TODO Auto-generated method stub
				String sql="UPDATE  sub_type  SET number=? WHERE rank=?";
				
				Connection conn=null;
				PreparedStatement stmt=null;
				ResultSet rs =null;
				
				//System.out.println(sql);
				try
				{
						
					conn = JdbcUtil.getConnection();
					stmt = conn.prepareStatement(sql);
					
					
					stmt.setInt(1,number);
					stmt.setInt(2, rank);
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
				String sql="delete from sub_type where rank=?";
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
}
