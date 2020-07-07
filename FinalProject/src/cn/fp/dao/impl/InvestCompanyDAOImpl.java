package cn.fp.dao.impl;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import org.bson.Document;

import com.mongodb.BasicDBObject;
 
import com.mongodb.MongoClient;
import com.mongodb.MongoException;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

import cn.fp.Fclass.Back_data;
import cn.fp.dao.InvestCompanyDAO;
import cn.fp.util.JdbcUtil;

public class InvestCompanyDAOImpl implements InvestCompanyDAO {
	//列表循环读出数据库中的值并以列表的形式返回
		public List<Back_data> getOne() {
			Connection conn=null;
			PreparedStatement stmt=null;
			ResultSet rs =null;
			String sql = "select  * from invest_company";
			
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
		
		//添加新的领域栏位
		public boolean add(Back_data Back_data) {
			// TODO Auto-generated method stub
			String sql = "insert into invest_company(name,number)values(?,?)";
			
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
					String sql = "select * from invest_company";
					
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
					String sql = "select * from invest_company where name=?";
					
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
					String sql="UPDATE  invest_company  SET number=? WHERE rank=?";
					
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
					String sql="delete from invest_company where rank=?";
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
				
				//查询投资公司打包后查询对应投资的目标公司
				public List<Back_data> gettarget() {
					Connection conn=null;
					PreparedStatement stmt=null;
					ResultSet rs =null;
					String sql = "select * from invest_company";
					
					try
					{
						List<Back_data> list= new ArrayList<Back_data>();
						conn = JdbcUtil.getConnection();
						stmt = conn.prepareStatement(sql);
						int time = 0;
						rs  = stmt.executeQuery();
						while(rs.next()){
							time++;
							if(time == 101) {
								break;
							}
							else {
							Back_data user = new Back_data();
							user.setRank(rs.getInt("rank"));
							user.setName(rs.getString("name"));
							user.setNumber(rs.getInt("number"));
							list.add(user);
							//return user;
							//(rs.getString("birthday"));	
							}
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
				
				public List<Back_data> getname(){
					List<Back_data> investdata_index = new ArrayList<Back_data>();
					investdata_index=gettarget();
					int i = 0;
					 
					try {
						MongoClient mongoClient = new MongoClient( "localhost", 27017);
						MongoDatabase databasee = mongoClient.getDatabase("temp");
						MongoCollection<Document> collection = databasee.getCollection("data");
						
						List<Back_data> list= new ArrayList<Back_data>();
						for(i=0;i<100;i++) {
							BasicDBObject query = new BasicDBObject();
							String namee = "^.*"+investdata_index.get(i).getName()+".*$";
							Pattern pattern = Pattern.compile(namee, Pattern.CASE_INSENSITIVE); 
							//模糊匹配查询
				 			query.put("invest_name", new BasicDBObject("$regex",pattern));
				 			MongoCursor<Document> result = collection.find(query).iterator();
							
							Back_data user = new Back_data();
							user.setName(investdata_index.get(i).getName());
							String com_name="";
							while(result.hasNext()){
								Document dbObject = (Document) result.next();
								com_name = com_name  + dbObject.get("com_name").toString() + "    &";
							}
							user.setDate(com_name);
							user.setNumber(investdata_index.get(i).getNumber());
							list.add(user);
							
							}
							mongoClient.close();
							return list;
						
						
					} catch (MongoException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
					return null;	
					
					/*
					List<Back_data> investdata_index = new ArrayList<Back_data>();
					investdata_index=gettarget();
					int i = 0;
					
					Connection conn=null;
					PreparedStatement stmt=null;
					ResultSet rs =null;
					List<Back_data> list= new ArrayList<Back_data>();
					try
					{
						for(i=0;i<100;i++) {
						String sql = "select com_name from company where invest_name like '%"+investdata_index.get(i).getName()+"%'";
						
						conn = JdbcUtil.getConnection();
						stmt = conn.prepareStatement(sql);
						rs  = stmt.executeQuery();

						Back_data user = new Back_data();
						user.setName(investdata_index.get(i).getName());
						String com_name="";
						while(rs.next()){
							com_name = com_name  + rs.getString("com_name")+ "    &";
						}
						user.setDate(com_name);
						user.setNumber(investdata_index.get(i).getNumber());
						list.add(user);
						stmt.close();
					    conn.close();
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
					}*/
					
					
				}
}
