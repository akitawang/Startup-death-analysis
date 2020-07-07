package cn.fp.dao.impl;



import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import org.bson.Document;

import com.mongodb.BasicDBObject;
 
import com.mongodb.MongoClient;
import com.mongodb.MongoException;
import com.mongodb.client.AggregateIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

import cn.fp.Fclass.Back_data;
import cn.fp.Fclass.Data;
import cn.fp.dao.ReasonDAO;
 

public class ReasonDAOImpl implements ReasonDAO {
	//列表循环读出数据库中的值并以列表的形式返回
	public List<Data> getindex_data(String reason) {
		 
		try {
			MongoClient mongoClient = new MongoClient( "localhost", 27017);
			MongoDatabase databasee = mongoClient.getDatabase("temp");
			MongoCollection<Document> collection = databasee.getCollection("data");
			 
	        List<Data> list= new ArrayList<Data>();
	        BasicDBObject query3 = new BasicDBObject();
	        String namee = "^.*"+reason+".*$";
			Pattern pattern = Pattern.compile(namee, Pattern.CASE_INSENSITIVE); 
			//模糊匹配name查询
 			query3.put("death_reason", new BasicDBObject("$regex",pattern));
 			MongoCursor<Document> result = collection.find(query3).iterator();
	         
			while (result.hasNext()) {
				Document dbObject = (Document) result.next();
				Data user = new Data();
				
				user.setNumber(dbObject.get("_id").toString());
				user.setCom_name((String)dbObject.get("com_name") );
				user.setCom_addr((String)dbObject.get("com_addr") );
				user.setCat((String)dbObject.get("cat") );
				user.setSe_cat((String)dbObject.get("se_cat") );
				user.setCom_des((String)dbObject.get("com_des") );
				user.setBorn_data((String)dbObject.get("born_data") );
				user.setDeath_data((String)dbObject.get("death_data") );
				user.setLive_days((String)dbObject.get("live_days") );
				user.setFinancing((String)dbObject.get("financing") );
				user.setTotal_money(Integer.parseInt(dbObject.get("total_money").toString()) );
				user.setDeath_reason((String)dbObject.get("death_reason") );
				user.setInvest_name((String)dbObject.get("invest_name") );
				user.setCeo_name((String)dbObject.get("ceo_name") );
				user.setCeo_des((String)dbObject.get("ceo_des") );
				user.setCeo_per_des((String)dbObject.get("ceo_per_des") );
				user.setId(Integer.parseInt(dbObject.get("index").toString()));
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
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs =null;
		String sql = "select  * from company where death_reason like '%"+reason+"%'";
		
		try
		{
			List<Data> list= new ArrayList<Data>();
			conn = JdbcUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			rs  = stmt.executeQuery();
			while(rs.next()){
				Data user = new Data();
				user.setNumber(rs.getString("number"));
				user.setCom_name(rs.getString("com_name"));
				user.setCom_addr(rs.getString("com_addr"));
				user.setCat(rs.getString("cat"));
				user.setSe_cat(rs.getString("se_cat"));
				user.setCom_des(rs.getString("com_des"));
				user.setBorn_data(rs.getString("born_data"));
				user.setDeath_data(rs.getString("death_data"));
				user.setLive_days(rs.getString("live_days"));
				user.setFinancing(rs.getString("financing"));
				user.setTotal_money(rs.getInt("total_money"));
				user.setDeath_reason(rs.getString("death_reason"));
				user.setInvest_name(rs.getString("invest_name"));
				user.setCeo_name(rs.getString("ceo_name"));
				user.setCeo_des(rs.getString("ceo_des"));
				user.setCeo_per_des(rs.getString("ceo_per_des"));
				user.setId(rs.getInt("id"));
				list.add(user);
				
				
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
	
	//列表循环读出数据库中的值并以列表的形式返回(ecahrts)
		public List<Back_data> getOne(String cat) {
			
			MongoClient mongoClient = new MongoClient( "localhost", 27017);
			MongoDatabase databasee = mongoClient.getDatabase("temp");
			MongoCollection<Document> collection = databasee.getCollection("data");
			
			Document info_match = new Document();
			info_match.put("cat", "电子商务");
			
			Document info_group = new Document();
			info_group.put("_id", "$com_addr");
			info_group.put("count", new Document("$sum",1));
			
			Document match = new Document("$match", info_match);
			Document group = new Document("$group", info_group);
			 
			List<Back_data> list= new ArrayList<Back_data>();
			List<Document> aggregateList = new ArrayList<Document>();
			aggregateList.add(match);
			aggregateList.add(group);
			
			
			AggregateIterable<Document> resultset = collection.aggregate(aggregateList);
			MongoCursor<Document> cursor = resultset.iterator();
			int time = 0;
				while(cursor.hasNext()) {
					time++;
					Document item_doc = cursor.next();
					String leaveMethod = item_doc.getString("_id");
					int count = item_doc.getInteger("count", 0);
					
					Back_data user = new Back_data();
					user.setName(leaveMethod);
					user.setNumber(count);
					list.add(user);
				}
				mongoClient.close();
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
				if(time<10) {
					return list;
				}
				else {
					while(k!=10) {
						fin.add(list.get(k));
						k++;
					}
					
					return fin;		
				}
			
			/*
			Connection conn=null;
			PreparedStatement stmt=null;
			ResultSet rs =null;
			if(cat == "") {
				cat = "电子商务";
			}
			String sql = "select com_addr as 'a',count(com_addr) as 'b' \r\n" + 
					"from company\r\n" + 
					"where cat=? GROUP BY com_addr";
			
			//System.out.println(sql);
			try
			{
				 List<Back_data> list= new ArrayList<Back_data>();
				conn = JdbcUtil.getConnection();
				stmt = conn.prepareStatement(sql);
				stmt.setString(1,cat);
				rs  = stmt.executeQuery();
				int time = 0;

				while(rs.next()){
					time++;
					Back_data user = new Back_data();
					user.setName(rs.getString("a"));
					user.setNumber(rs.getInt("b"));
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
				if(time<10) {
					return list;
				}
				else {
					while(k!=10) {
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
			}*/
		}
}
