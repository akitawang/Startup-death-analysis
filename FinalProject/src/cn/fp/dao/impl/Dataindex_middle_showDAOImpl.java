package cn.fp.dao.impl;


import java.util.ArrayList;
import java.util.List;

import org.bson.Document;


import com.mongodb.MongoClient;
import com.mongodb.MongoException;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

import cn.fp.Fclass.Dataindex_middle;
import cn.fp.dao.Dataindex_middle_showDAO;

public class Dataindex_middle_showDAOImpl implements Dataindex_middle_showDAO {
	
	//列表循环读出数据库中的值并以列表的形式返回
	public List<Dataindex_middle> getOne() {
		
		
		 
		try {
			MongoClient mongoClient = new MongoClient( "localhost", 27017);
			MongoDatabase databasee = mongoClient.getDatabase("temp");
			MongoCollection<Document> collection = databasee.getCollection("data");
			
			int count = (int) collection.count();
			
			List<Dataindex_middle> list= new ArrayList<Dataindex_middle>();		
			Dataindex_middle user = new Dataindex_middle();
			user.setNumber1(count);
			user.setNumber2(100000);
			list.add(user);	
			mongoClient.close();
			return list;
			
			
		} catch (MongoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		/*mysql 数据库
		 * Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs =null;
		String sql = "select COUNT(*) totalCount from company";
		
		//System.out.println(sql);
		try
		{
			 List<Dataindex_middle> list= new ArrayList<Dataindex_middle>();
			conn = JdbcUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			rs  = stmt.executeQuery();
			
			while(rs.next()){
				
				Dataindex_middle user = new Dataindex_middle();
				user.setNumber1(rs.getInt("totalCount"));
				user.setNumber2(10);
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
		}*/
	}
}
