package cn.fp.dao.impl;

 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import java.util.List;
import java.util.regex.Pattern;

import org.bson.Document;

import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
 
import com.mongodb.MongoClient;
import com.mongodb.MongoException;
import com.mongodb.client.AggregateIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

import cn.fp.Fclass.Back_data;
import cn.fp.Fclass.Data;
import cn.fp.dao.FinancingDAO;
import cn.fp.util.JdbcUtil;

public class FinancingDAOImpl implements FinancingDAO {
	
	//列表循环读出数据库中的值并以列表的形式返回
	public List<Back_data> getOne() {
		/*Mongo mongo;
		try {
			//建立连接
			mongo = new Mongo("127.0.0.1",27017);
			//获取指定的数据库
			DB db = mongo.getDB("temp");
			//获取指定的集合
			DBCollection dbCollection = db.getCollection("financing"); 
			List<Back_data> list= new ArrayList<Back_data>(); 
	        DBCursor result = dbCollection.find();
			int time = result.count();
			while (result.hasNext()) {
				DBObject dbObject = (DBObject) result.next();
				Back_data user = new Back_data();
				user.setName((String)dbObject.get("name"));
				user.setRank(Integer.parseInt(dbObject.get("number").toString()));
				list.add(user);
			}
			
			mongo.close();
			
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
			 
		} catch (UnknownHostException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (MongoException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		 return null;*/
		
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs =null;
		String sql = "select  * from financing";
		
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
				user.setName(rs.getString("finance"));
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
			/*Mongo mongo;
			try {
				//建立连接
				mongo = new Mongo("127.0.0.1",27017);
				//获取指定的数据库
				DB db = mongo.getDB("temp");
				//获取指定的集合
				DBCollection dbCollection = db.getCollection("financing");
				int num = (int) (dbCollection.count()+1);
				BasicDBObject info = new BasicDBObject();
				info.put("name", Back_data.getName());
				info.put("number", Back_data.getNumber());
				info.put("id", num);
				int judge = dbCollection.insert(info).getN();
				if(judge == 0) {
					mongo.close();
					return true;
				}
				mongo.close();
			} catch (UnknownHostException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (MongoException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			return false;*/
			
			String sql = "insert into financing(finance,number)values(?,?)";
			Connection conn=null;
			PreparedStatement stmt=null;
			ResultSet rs =null;
			
			try
			{conn = JdbcUtil.getConnection();
				stmt = conn.prepareStatement(sql);
				stmt.setString(1,Back_data.getName());
				stmt.setInt(2, Back_data.getNumber());
				int rows  = stmt.executeUpdate();
			    if(rows>0)return true;
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
					/*Mongo mongo;
					try {
						//建立连接
						mongo = new Mongo("127.0.0.1",27017);
						//获取指定的数据库
						DB db = mongo.getDB("temp");
						//获取指定的集合
						DBCollection dbCollection = db.getCollection("financing"); 
						List<Back_data> list= new ArrayList<Back_data>(); 
				        DBCursor result = dbCollection.find();
						 
						while (result.hasNext()) {
							DBObject dbObject = (DBObject) result.next();
							Back_data user = new Back_data();
							user.setRank(Integer.parseInt(dbObject.get("id").toString()));
							user.setName((String)dbObject.get("name"));
							user.setNumber(Integer.parseInt(dbObject.get("number").toString()));
							list.add(user);
						}
						mongo.close();
						return list;
					} catch (UnknownHostException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					} catch (MongoException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
					 return null;*/
					
					Connection conn=null;
					PreparedStatement stmt=null;
					ResultSet rs =null;
					String sql = "select * from financing";
					try
					{
						List<Back_data> list= new ArrayList<Back_data>();
						conn = JdbcUtil.getConnection();
						stmt = conn.prepareStatement(sql);
						rs  = stmt.executeQuery();
						while(rs.next()){Back_data user = new Back_data();
							user.setRank(rs.getInt("rank"));
							user.setName(rs.getString("finance"));
							user.setNumber(rs.getInt("number"));
							list.add(user);
							//return user;
							//(rs.getString("birthday"));					
						}return list;
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
					/*Mongo mongo;
					try {
						//建立连接
						mongo = new Mongo("127.0.0.1",27017);
						//获取指定的数据库
						DB db = mongo.getDB("temp");
						//获取指定的集合
						DBCollection dbCollection = db.getCollection("financing"); 
						List<Back_data> list= new ArrayList<Back_data>(); 
				        DBCursor result = dbCollection.find(new BasicDBObject("name", name));
						 
						while (result.hasNext()) {
							DBObject dbObject = (DBObject) result.next();
							Back_data user = new Back_data();
							user.setRank(Integer.parseInt(dbObject.get("id").toString()));
							user.setName((String)dbObject.get("name"));
							user.setRank(Integer.parseInt(dbObject.get("number").toString()));
							list.add(user);
						}
						mongo.close();
						return list;
					} catch (UnknownHostException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					} catch (MongoException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
					 return null;*/
					 
					Connection conn=null;
					PreparedStatement stmt=null;
					ResultSet rs =null;
					String sql = "select * from financing where finance=?";
					
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
							user.setName(rs.getString("finance"));
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
				public boolean rec(int rank,String name,int number) {
					// TODO Auto-generated method stub
					/*boolean flag = false;
					Mongo mongo;
					try {
						//建立连接
						mongo = new Mongo("127.0.0.1",27017);
						//获取指定的数据库
						DB db = mongo.getDB("temp");
						//获取指定的集合
						DBCollection dbCollection = db.getCollection("financing"); 
							BasicDBObject info = new BasicDBObject();
							info.put("name", name);
							info.put("number", number);
							info.put("id", rank);
							WriteResult row = dbCollection.update(
									new BasicDBObject("name", name), 
						            info,
						            false,//如果数据库不存在，是否添加
						            false//多条修改);
							);
							 
							if(row.toString() == "N/A") { 
								flag = true;
							}
						
						mongo.close();
					} catch (UnknownHostException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					} catch (MongoException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
					return flag;*/
					
					String sql="UPDATE  financing  SET number=? WHERE rank=?";
					
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
				public boolean del(int rank,String name) {
					
					String sql="delete from financing where rank=?";
					//String sql1="UPDATE  sub_type  SET date=? ";
					/*Date t = new Date();
					SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
					String dated = df.format(t);*/
					Connection conn=null;
					PreparedStatement stmt=null;
					ResultSet rs =null;
					/*Connection conn1=null;
					PreparedStatement stmt1=null;
					ResultSet rs1 =null;*/
					//System.out.println(sql);
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
				
				//获取前一百的融资金额的公司
				public List<Data> gettop() {
					 
					try {
						MongoClient mongoClient = new MongoClient( "localhost", 27017);
						MongoDatabase databasee = mongoClient.getDatabase("temp");
						MongoCollection<Document> collection = databasee.getCollection("data");
						
						List<Data> list= new ArrayList<Data>();
						MongoCursor<Document> result = collection.find().iterator();
						int time = (int) collection.count();
						while (result.hasNext()) {
							Document dbObject = (Document) result.next();
							Data user = new Data();
							System.out.print(dbObject.get("total_money"));
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
						 
						int i=0,j=0;
						for(i=0;i<time;i++) {
							for(j=0;j<time;j++)
								
							if(list.get(i).getTotal_money()>list.get(j).getTotal_money()) {
								Data container = list.get(i);
								list.set(i, list.get(j));
								list.set(j, container);
							}
							
						}
						List<Data> fin = new ArrayList<Data>();
						
						int k=0;
						if(time<100) {
							return list;
						}
						else {
							while(k!=100) {
								fin.add(list.get(k));
								k++;
							}
							
							return fin;		
						}
					} catch (MongoException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
					 return null;
					/*Connection conn=null;
					PreparedStatement stmt=null;
					ResultSet rs =null;
					String sql = "select  * from company";
					
					//System.out.println(sql);
					try
					{
						List<Data> list= new ArrayList<Data>();
						conn = JdbcUtil.getConnection();
						stmt = conn.prepareStatement(sql);
						rs  = stmt.executeQuery();
						int time = 0;

						while(rs.next()){
							time++;
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
							//return user;
							//(rs.getString("birthday"));
							
						}
						
						int i=0,j=0;
						for(i=0;i<time;i++) {
							for(j=0;j<time;j++)
								
							if(list.get(i).getTotal_money()>list.get(j).getTotal_money()) {
								Data container = list.get(i);
								list.set(i, list.get(j));
								list.set(j, container);
							}
							
						}
						List<Data> fin = new ArrayList<Data>();
						
						int k=0;
						if(time<100) {
							return list;
						}
						else {
							while(k!=100) {
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
				
				
				
				//获取mix图
				public List<Back_data> getmix() {
					
					MongoClient mongoClient = new MongoClient( "localhost", 27017);
					MongoDatabase databasee = mongoClient.getDatabase("temp");
					MongoCollection<Document> collection = databasee.getCollection("data");
					List<Back_data> list= new ArrayList<Back_data>();
					
					
					Document info_group = new Document();
					info_group.put("_id", "$financing");   //_id 相当于sql 的 group by 
					info_group.put("count", new Document("$sum",1));   //计算总数 
					
					
					Document group = new Document("$group", info_group);
					 
					
					List<Document> aggregateList = new ArrayList<Document>();
					aggregateList.add(group);
					
					
					AggregateIterable<Document> resultset = collection.aggregate(aggregateList);
					MongoCursor<Document> cursor = resultset.iterator();
					
					int time = 0;
						while(cursor.hasNext()) {
							time++;
							Document item_doc = cursor.next();
							String leaveMethod = item_doc.getString("_id");   //获得分组后的每个元素
							int count = item_doc.getInteger("count", 0);
							Back_data user = new Back_data();
							user.setName(leaveMethod);
							user.setNumber(count);
							list.add(user);
							
						}
					for(int i=0;i<time;i++) {
						int sum = 0;
						int num = 0;
						Document query3 = new Document();
						query3.put("financing",list.get(i).getName());
						MongoCursor<Document> result = collection.find(query3).iterator();
						while (result.hasNext()) {
							num++;
							Document dbObject = (Document) result.next();
							 
							sum = sum + Integer.parseInt(dbObject.getString("live_days").toString())/30;
						}
						sum = sum/num;
						list.get(i).setValue(sum);
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
					if(time<12) {
						return list;
					}
					else {
						while(k!=12) {
							fin.add(list.get(k));
							k++;
						}
						
						return fin;		
					}
					
					
					/*
					Connection conn=null;
					PreparedStatement stmt=null;
					ResultSet rs =null;
					String sql = "select financing as 'a',count(financing) as 'b',avg(live_days)/30 as 'c' from company GROUP BY financing";
					
					//System.out.println(sql);
					try
					{
						List<Back_data> list= new ArrayList<Back_data>();
						conn = JdbcUtil.getConnection();
						stmt = conn.prepareStatement(sql);
						rs  = stmt.executeQuery();
						 int time=0;

						while(rs.next()){
							 time++;
							Back_data user = new Back_data();
							user.setName(rs.getString("a"));
							user.setNumber(rs.getInt("b"));
							user.setValue(rs.getInt("c"));
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
						if(time<12) {
							return list;
						}
						else {
							while(k!=12) {
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
