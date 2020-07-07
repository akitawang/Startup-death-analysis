package cn.fp.dao.impl;


 
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

 

 
import com.mongodb.MongoClient;
import com.mongodb.MongoException;
 

import cn.fp.Fclass.Back_data;
import cn.fp.Fclass.Data;
  
import cn.fp.util.JdbcUtil;

import org.bson.Document;


import com.mongodb.BasicDBObject;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

import cn.fp.dao.DataDAO;

public class DataDAOImpl implements DataDAO {
	/**
	* 计算总的页数
	* @return
	*/
	public int getPage(){
		int recordCount=0,t1=0,t2=0;
		
		 
		try {
			//建立连接
			MongoClient mongoClient = new MongoClient("localhost", 27017);
			MongoDatabase database = mongoClient.getDatabase("temp");
		    MongoCollection<Document> dbCollection = database.getCollection("data");
			//获取指定的集合
			 
			recordCount = (int) dbCollection.count();
			t1=recordCount%10;
			t2=recordCount/10;
			mongoClient.close();
		} catch (MongoException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		if(t1 != 0){
			t2=t2+1;
		}
		return t2;			
		
		/*mysql 数据库
		 * PreparedStatement stmt=null;
		ResultSet rs=null;
		Connection conn=null;
		
		String sql="select count(*) from company";
		try {
			conn = JdbcUtil.getConnection();
			stmt=conn.prepareStatement(sql);
			rs=stmt.executeQuery();
			rs.next();
			recordCount=rs.getInt(1);
			t1=recordCount%10;
			t2=recordCount/10;
		} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}finally{
			JdbcUtil.release(rs, stmt, conn);	
		}
		if(t1 != 0){
		t2=t2+1;
		}
		return t2;*/
	}
	
	
	//列表循环读出数据库中的值并以列表的形式返回
		public List<Data> getOne(int pageNo)  {
			int num = getPage();
			if(pageNo >  num||pageNo < 1) {
				List<Data> lista= new ArrayList<Data>();
				Data user = new Data();
				user.setNumber("");
				user.setCom_name("");
				user.setCom_addr("");
				user.setCat("" );
				user.setSe_cat("");
				user.setCom_des("");
				user.setBorn_data("");
				user.setDeath_data("");
				user.setLive_days("");
				user.setFinancing("");
				user.setTotal_money(0);
				user.setDeath_reason("");
				user.setInvest_name("");
				user.setCeo_name("");
				user.setCeo_des("");
				user.setCeo_per_des("");
				user.setId(0);
				lista.add(user);
				return lista;
			}
			
			 
			try {
				MongoClient mongoClient = new MongoClient("localhost", 27017);
				MongoDatabase database = mongoClient.getDatabase("temp");
			    MongoCollection<Document> dbcollection = database.getCollection("data");
			    
				int limit =10;
		        int skip = (pageNo - 1) * limit;
		        List<Data> list= new ArrayList<Data>();
		        MongoCursor<Document> result = dbcollection.find().skip(skip).limit(limit).iterator();
		         
		        //分页，skip():从第几条开始，limit():限制返回的条数
				
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
			/*mysql 数据库
			 * Connection conn=null;
			PreparedStatement stmt=null;
			ResultSet rs =null;
			String sql = "select * from company order by id limit ?,?";
			int pageSize=10;
			int page=(pageNo-1)*10;
			//System.out.println(sql);
			try
			{
				List<Data> list= new ArrayList<Data>();
				conn = JdbcUtil.getConnection();
				stmt = conn.prepareStatement(sql);
				
				stmt.setInt(1, page);
				stmt.setInt(2, pageSize);
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
			}*/
		}
		
		//列表循环读出数据库中地区的值并以列表的形式返回,供下拉菜单
		public List<Back_data> get_location_info() {
			/*
			Mongo mongo;
			try {
				//建立连接
				mongo = new Mongo("127.0.0.1",27017);
				//获取指定的数据库
				DB db = mongo.getDB("temp");
				//获取指定的集合
				DBCollection dbCollection = db.getCollection("map");
				
				List<Back_data> list= new ArrayList<Back_data>();
		        
		        DBCursor result = dbCollection.find();
				
				while (result.hasNext()) {
					DBObject dbObject = (DBObject) result.next();
					Back_data user = new Back_data();
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
			String sql = "select  * from map";
			
			//System.out.println(sql);
			try
			{
				 List<Back_data> list= new ArrayList<Back_data>();
				conn = JdbcUtil.getConnection();
				stmt = conn.prepareStatement(sql);
				rs  = stmt.executeQuery();
				

				while(rs.next()){
					
					Back_data user = new Back_data();
					user.setName(rs.getString("name"));
					user.setRank(rs.getInt("rank"));
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
		
		//列表循环读出数据库中 领域 的值并以列表的形式返回,供下拉菜单
				public List<Back_data> get_field_info() {
					/*
					Mongo mongo;
					try {
						//建立连接
						mongo = new Mongo("127.0.0.1",27017);
						//获取指定的数据库
						DB db = mongo.getDB("temp");
						//获取指定的集合
						DBCollection dbCollection = db.getCollection("cat");
						
						List<Back_data> list= new ArrayList<Back_data>();
				        
				        DBCursor result = dbCollection.find();
						
						while (result.hasNext()) {
							DBObject dbObject = (DBObject) result.next();
							Back_data user = new Back_data();
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
					String sql = "select  * from type_company";
					
					//System.out.println(sql);
					try
					{
						 List<Back_data> list= new ArrayList<Back_data>();
						conn = JdbcUtil.getConnection();
						stmt = conn.prepareStatement(sql);
						rs  = stmt.executeQuery();
						
						while(rs.next()){
							
							Back_data user = new Back_data();
							user.setName(rs.getString("name"));
							user.setRank(rs.getInt("rank"));
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
		
		//列表循环读出数据库中 融资情况 的值并以列表的形式返回,供下拉菜单
				public List<Back_data> get_financing_info() {
					/*
					Mongo mongo;
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
					String sql = "select  * from financing";
					
					//System.out.println(sql);
					try
					{
						 List<Back_data> list= new ArrayList<Back_data>();
						conn = JdbcUtil.getConnection();
						stmt = conn.prepareStatement(sql);
						rs  = stmt.executeQuery();
						

						while(rs.next()){
							
							Back_data user = new Back_data();
							user.setName(rs.getString("finance"));
							user.setRank(rs.getInt("rank"));
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
				
				
				
				
				//搜索查询模块使用 模糊查询
				public List<Data> search(String name,String born,String locate,String financing) {
					
					 
					try {
						MongoClient mongoClient = new MongoClient( "localhost", 27017);
						MongoDatabase databasee = mongoClient.getDatabase("temp");
						MongoCollection<Document> collection = databasee.getCollection("data");
						
						Document query3 = new Document();
						List<Data> list= new ArrayList<Data>();
						
						if(name != null &&!name.trim().isEmpty()) {
							String namee = "^.*"+name+".*$";
							Pattern pattern = Pattern.compile(namee, Pattern.CASE_INSENSITIVE); 
							//模糊匹配name查询
				 			query3.put("com_name", new BasicDBObject("$regex",pattern));
						}
						
						if(born != null &&!born.trim().isEmpty() ) {
							String bornn = "^.*"+born+".*$";
							Pattern pattern = Pattern.compile(bornn, Pattern.CASE_INSENSITIVE); 
							//模糊匹配born查询
				 			query3.put("born_data", new BasicDBObject("$regex",pattern));
						}
						
						
						if(locate != null &&!locate.trim().isEmpty() ) {
							query3.put("com_addr",locate);//查找locate
						}
						
						
						if(financing != null &&!financing.trim().isEmpty() ) {
							query3.put("financing",financing);//查找financing
						}
				       
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
					StringBuilder sql = new StringBuilder("select  * from company where 1=1");
					List<Data> list= new ArrayList<Data>();
					//System.out.println(sql);
					try
					{
						conn = JdbcUtil.getConnection();
						if(name != null &&!name.trim().isEmpty()) {
							sql.append(" and com_name like "+"'%" + name + "%'");
						}
						if(born != null &&!born.trim().isEmpty() ) {
							sql.append(" and born_data like "+"'%" + born + "%'");
						}
						if(locate != null &&!locate.trim().isEmpty() ) {
							sql.append(" and com_addr="+"'" + locate + "'");
						}
						if(financing != null &&!financing.trim().isEmpty() ) {
							sql.append(" and financing = "+"'" + financing + "'");
						}
						stmt = conn.prepareStatement(sql.toString());
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
						}return list;
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
				//修改子领域栏位
				public boolean rec(Data Data)  {
					// TODO Auto-generated method stub
					
					 boolean flag = false;
					try {
						MongoClient mongoClient = new MongoClient( "localhost", 27017);
						MongoDatabase databasee = mongoClient.getDatabase("temp");
						MongoCollection<Document> collection = databasee.getCollection("data");
						
						String id = ""+Data.getId();
						Document info = new Document();
						info.put("index", id);
						info.put("com_name", Data.getCom_name());
						info.put("com_addr", Data.getCom_addr());
						info.put("cat", Data.getCat());
						info.put("se_cat", Data.getSe_cat());
						info.put("com_des", Data.getCom_des());
						info.put("born_data", Data.getBorn_data());
						info.put("death_data", Data.getDeath_data());
						info.put("live_days", Data.getLive_days());
						info.put("financing", Data.getFinancing());
						info.put("total_money", Data.getTotal_money());
						info.put("death_reason", Data.getDeath_reason());
						info.put("invest_name", Data.getInvest_name());
						info.put("ceo_name", Data.getCeo_name());
						info.put("ceo_des", Data.getCeo_des());
						info.put("ceo_per_des", Data.getCeo_per_des());
						int number = Data.getId();
						//Document query = new Document("_id",number);
						Document update = new Document("$set",info);
						
						
						collection.updateOne(new BasicDBObject("index",""+number+""), update);
							flag = true;
						
				        
						mongoClient.close();
					} catch (MongoException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
					return flag;
					
				
					/*
					String sql="UPDATE  company  SET number=?,com_name=?,com_addr=?,cat=?,se_cat=?,com_des=?,born_data=?,death_data=?,live_days=?,financing=?,total_money=?,death_reason=?,invest_name=?,ceo_name=?,ceo_des=?,ceo_per_des=? WHERE id=?";
					Connection conn=null;
					PreparedStatement stmt=null;
					ResultSet rs =null;
					try
					{
						conn = JdbcUtil.getConnection();
						stmt = conn.prepareStatement(sql);
						stmt.setString(1,Data.getNumber());
						stmt.setString(2,Data.getCom_name());
						stmt.setString(3,Data.getCom_addr());
						stmt.setString(4,Data.getCat());
						stmt.setString(5,Data.getSe_cat());
						stmt.setString(6,Data.getCom_des());
						stmt.setString(7,Data.getBorn_data());
						stmt.setString(8,Data.getDeath_data());
						stmt.setString(9,Data.getLive_days());
						stmt.setString(10,Data.getFinancing());
						stmt.setInt(11,Data.getTotal_money());
						stmt.setString(12,Data.getDeath_reason());
						stmt.setString(13,Data.getInvest_name());
						stmt.setString(14,Data.getCeo_name());
						stmt.setString(15,Data.getCeo_des());
						stmt.setString(16,Data.getCeo_per_des());
						stmt.setInt(17,Data.getId());
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
					}return false;*/
					
				}
				
				//删除子领域栏位
				public boolean del(Data Data) {
					// TODO Auto-generated method stub
					boolean flag = false;
					
					boolean invest_company= del_invest_company_number(Data.getInvest_name());
					boolean field = del_field_number(Data.getCat());
					boolean financing = del_financing_number(Data.getFinancing()); 
					boolean map = del_map_company_number(Data.getCom_addr());
					boolean sub_type = del_sub_type_company_number(Data.getSe_cat());
					/*System.out.print(invest_company);
					System.out.print(field);
					System.out.print(financing);
					System.out.print(map);
					System.out.print(sub_type);*/
					if( field && financing && invest_company && map && sub_type ) {
						 
					try {
						MongoClient mongoClient = new MongoClient( "localhost", 27017);
						MongoDatabase databasee = mongoClient.getDatabase("temp");
						MongoCollection<Document> collection = databasee.getCollection("data");
						
						int number = Data.getId();
						 
						collection.deleteOne(new Document("index",""+number+""));
						flag = true;
						
						mongoClient.close();
					} catch (MongoException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
					}
					return flag;
					
					/*
					String sql="delete from company where id=?";
					Connection conn=null;
					PreparedStatement stmt=null;
					ResultSet rs =null;
					boolean field = del_field_number(Data.getCat());
					boolean financing = del_financing_number(Data.getFinancing());
					boolean invest_company = del_invest_company_number(Data.getInvest_name());
					boolean map = del_map_company_number(Data.getCom_addr());
					boolean sub_type = del_sub_type_company_number(Data.getSe_cat());
					
					if( field && financing && invest_company && map && sub_type ) {
						try
						{conn = JdbcUtil.getConnection();
							stmt = conn.prepareStatement(sql);				
							stmt.setInt(1,Data.getId());
							int rows  = stmt.executeUpdate();
						    if(rows>0)return true;}
						catch(Exception e)
						{
							throw new RuntimeException(e);	
						}
						finally
						{
							JdbcUtil.release(rs, stmt, conn);
						}return false;
					}
					else {
						return false;
					}*/
				}
				
				
				//删除公司信息时同时减少field表记录
				public boolean del_field_number(String name) {
					/*Mongo mongo;
					try {
						//建立连接
						mongo = new Mongo("127.0.0.1",27017);
						//获取指定的数据库
						DB db = mongo.getDB("temp");
						//获取指定的集合
						DBCollection dbCollection = db.getCollection("cat");
						DBCursor result = dbCollection.find(new BasicDBObject("name", name));
						while (result.hasNext()) {
							DBObject dbObject = (DBObject) result.next();
							int num = Integer.parseInt(dbObject.get("number").toString());
							String id = dbObject.get("id").toString();
							String number = dbObject.get("_id").toString();
							BasicDBObject info = new BasicDBObject();
							info.put("name", name);
							info.put("number", num-1);
							info.put("id", id);
							WriteResult row = dbCollection.update(
									new BasicDBObject("_id", new ObjectId(number)), 
						            info,
						            false,//如果数据库不存在，是否添加
						            false//多条修改);
							);
							if(row.toString() == "N/A") {
								mongo.close();
								return true;
							}
						}
						mongo.close();
						return false;
					} catch (UnknownHostException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					} catch (MongoException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
					return false;*/
					
					
					Connection conn=null;
					PreparedStatement stmt=null;
					ResultSet rs =null;
					String sql = "select number from type_company where name=?";
					try
					{
						conn = JdbcUtil.getConnection();
						stmt = conn.prepareStatement(sql);
						stmt.setString(1,name);
						rs  = stmt.executeQuery();
						while(rs.next()){
							
							int number= rs.getInt("number");
							String sql3 = "UPDATE  type_company  SET number=? WHERE name=?";
							stmt = conn.prepareStatement(sql3);
							stmt.setInt(1,number-1);
							stmt.setString(2, name);
							int rows  = stmt.executeUpdate();
							if(rows>0)
								return true;
							else
								return false;
						}
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
					
				}
				//删除公司信息时同时减少financing表记录
				public boolean del_financing_number(String name) {
					/*name = name.replaceAll(" ", ""); 
					Mongo mongo;
					try {
						//建立连接
						mongo = new Mongo("127.0.0.1",27017);
						//获取指定的数据库
						DB db = mongo.getDB("temp");
						//获取指定的集合
						DBCollection dbCollection = db.getCollection("financing");
						DBCursor result = dbCollection.find(new BasicDBObject("name", name));
						System.out.print(name);
						while (result.hasNext()) {
							DBObject dbObject = (DBObject) result.next();
							int num = Integer.parseInt(dbObject.get("number").toString());
							String id = dbObject.get("id").toString();
							String number = dbObject.get("_id").toString();
							BasicDBObject info = new BasicDBObject();
							info.put("name", name);
							info.put("number", num-1);
							info.put("id", id);
							WriteResult row = dbCollection.update(
									new BasicDBObject("_id", new ObjectId(number)), 
						            info,
						            false,//如果数据库不存在，是否添加
						            false//多条修改);
							);
							if(row.toString() == "N/A") {
								mongo.close();
								return true;
							}
						}
						mongo.close();
						return false;
					} catch (UnknownHostException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					} catch (MongoException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
					return false;*/
					Connection conn=null;
					PreparedStatement stmt=null;
					ResultSet rs =null;
					String sql = "select number from financing where finance=?";
					name = name.replaceAll(" ", ""); 
					try
					{
						conn = JdbcUtil.getConnection();
						stmt = conn.prepareStatement(sql);
						stmt.setString(1,name);
						rs  = stmt.executeQuery();
						while(rs.next()){
								
								int number= rs.getInt("number");
								String sql3 = "UPDATE  financing  SET number=? WHERE finance=?";
								stmt = conn.prepareStatement(sql3);
								stmt.setInt(1,number-1);
								stmt.setString(2, name);
								int rows  = stmt.executeUpdate();
								if(rows>0)
									return true;
								else
									return false;
								
						}
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
					
				}
				//删除公司信息时同时减少invest_company表记录
				public boolean del_invest_company_number(String name) {
					/*boolean re = true;
					
					Mongo mongo;
					try {
						//建立连接
						mongo = new Mongo("127.0.0.1",27017);
						//获取指定的数据库
						DB db = mongo.getDB("temp");
						//获取指定的集合
						DBCollection dbCollection = db.getCollection("invest");
						
						String[] na = name.split("&"); 
						 
						int na_num = na.length;
						int i=0;
						for(i=0;i<na_num;i++) {
							DBCursor result = dbCollection.find(new BasicDBObject("name", na[i]));
							while (result.hasNext()) {
								DBObject dbObject = (DBObject) result.next();
								int num = Integer.parseInt(dbObject.get("number").toString());
								String id = dbObject.get("id").toString();
								String number = dbObject.get("_id").toString();
								BasicDBObject info = new BasicDBObject();
								System.out.print(id+na[i]+num);
								info.put("name", na[i]);
								info.put("number", num-1);
								info.put("id", id);
								WriteResult row = dbCollection.update(
										new BasicDBObject("_id", new ObjectId(number)), 
							            info,
							            false,//如果数据库不存在，是否添加
							            false//多条修改);
								);
								
								if(row.toString() == "N/A") {
									mongo.close();
									re = true;
								}
							}
							
						}
						
					} catch (UnknownHostException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					} catch (MongoException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
					return re;*/
					
					Connection conn=null;
					PreparedStatement stmt=null;
					ResultSet rs =null;
					String sql = "select number from invest_company where name=?";
					
					try
					{
						conn = JdbcUtil.getConnection();
						stmt = conn.prepareStatement(sql);
						stmt.setString(1,name);
						rs  = stmt.executeQuery();
						while(rs.next()){
								
								int number= rs.getInt("number");
								String sql3 = "UPDATE  invest_company  SET number=? WHERE name=?";
								stmt = conn.prepareStatement(sql3);
								stmt.setInt(1,number-1);
								stmt.setString(2, name);
								int rows  = stmt.executeUpdate();
								if(rows>0)
									return true;
								else
									return false;
								
						}
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
					
				}
				
				//删除公司信息时同时减少map表记录
				public boolean del_map_company_number(String name) {
					/*Mongo mongo;
					try {
						//建立连接
						mongo = new Mongo("127.0.0.1",27017);
						//获取指定的数据库
						DB db = mongo.getDB("temp");
						//获取指定的集合
						DBCollection dbCollection = db.getCollection("map");
						DBCursor result = dbCollection.find(new BasicDBObject("name", name));
						while (result.hasNext()) {
							DBObject dbObject = (DBObject) result.next();
							int num = Integer.parseInt(dbObject.get("number").toString());
							String id = dbObject.get("id").toString();
							String number = dbObject.get("_id").toString();
							BasicDBObject info = new BasicDBObject();
							info.put("name", name);
							info.put("number", num-1);
							info.put("id", id);
							WriteResult row = dbCollection.update(
									new BasicDBObject("_id", new ObjectId(number)), 
						            info,
						            false,//如果数据库不存在，是否添加
						            false//多条修改);
							);
							if(row.toString() == "N/A") {
								mongo.close();
								return true;
							}
						}
						mongo.close();
						return false;
					} catch (UnknownHostException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					} catch (MongoException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
					return false;*/
					
					
					Connection conn=null;
					PreparedStatement stmt=null;
					ResultSet rs =null;
					String sql = "select number from map where name=?";
					
					try
					{
						conn = JdbcUtil.getConnection();
						stmt = conn.prepareStatement(sql);
						stmt.setString(1,name);
						rs  = stmt.executeQuery();
						while(rs.next()){
									int number= rs.getInt("number");
								String sql3 = "UPDATE  map  SET number=? WHERE name=?";
								stmt = conn.prepareStatement(sql3);
								stmt.setInt(1,number-1);
								stmt.setString(2, name);
								int rows  = stmt.executeUpdate();
								if(rows>0)
									return true;
								else
									return false;
								
						}
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
					
				}
				
				
				//删除公司信息时同时减少sub_type表记录
				public boolean del_sub_type_company_number(String name) {
					/*Mongo mongo;
					try {
						//建立连接
						mongo = new Mongo("127.0.0.1",27017);
						//获取指定的数据库
						DB db = mongo.getDB("temp");
						//获取指定的集合
						DBCollection dbCollection = db.getCollection("se_cat");
						DBCursor result = dbCollection.find(new BasicDBObject("name", name));
						while (result.hasNext()) {
							DBObject dbObject = (DBObject) result.next();
							int num = Integer.parseInt(dbObject.get("number").toString());
							String id = dbObject.get("id").toString();
							String number = dbObject.get("_id").toString();
							BasicDBObject info = new BasicDBObject();
							info.put("name", name);
							info.put("number", num-1);
							info.put("id", id);
							WriteResult row = dbCollection.update(
									new BasicDBObject("_id", new ObjectId(number)), 
						            info,
						            false,//如果数据库不存在，是否添加
						            false//多条修改);
							);
							if(row.toString() == "N/A") {
								mongo.close();
								return true;
							}
						}
						mongo.close();
						return false;
					} catch (UnknownHostException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					} catch (MongoException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
					return false;*/
					
					
					Connection conn=null;
					PreparedStatement stmt=null;
					ResultSet rs =null;
					String sql = "select number from sub_type where name=?";
					
					try
					{
						conn = JdbcUtil.getConnection();
						stmt = conn.prepareStatement(sql);
						stmt.setString(1,name);
						rs  = stmt.executeQuery();
						while(rs.next()){
									int number= rs.getInt("number");
								String sql3 = "UPDATE  sub_type  SET number=? WHERE name=?";
								stmt = conn.prepareStatement(sql3);
								stmt.setInt(1,number-1);
								stmt.setString(2, name);
								int rows  = stmt.executeUpdate();
								if(rows>0)
									return true;
								else
									return false;
								
						}
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
					
				}
				
				//添加公司
				public boolean add(Data Data) {
					// TODO Auto-generated method stub
					boolean flag = false;
					boolean secat = search_se_cat_exist(Data.getSe_cat());
					boolean invest = search_invest_company_exist(Data.getInvest_name());
					boolean map = updata_map(Data.getCom_addr());
					boolean cat = updata_field(Data.getCat());
					if(secat && invest && map && cat) {
					 
					try {
						MongoClient mongoClient = new MongoClient( "localhost", 27017);
						MongoDatabase databasee = mongoClient.getDatabase("temp");
						MongoCollection<Document> collection = databasee.getCollection("data");
						
						int sum = (int) collection.count();
						Document info = new Document();
						info.put("index", sum+1);
						info.put("com_name", Data.getCom_name());
						info.put("com_addr", Data.getCom_addr());
						info.put("cat", Data.getCat());
						info.put("se_cat", Data.getSe_cat());
						info.put("com_des", Data.getCom_des());
						info.put("born_data", Data.getBorn_data());
						info.put("death_data", Data.getDeath_data());
						info.put("live_days", Data.getLive_days());
						info.put("financing", Data.getFinancing());
						info.put("total_money", Data.getTotal_money());
						info.put("death_reason", Data.getDeath_reason());
						info.put("invest_name", Data.getInvest_name());
						info.put("ceo_name", Data.getCeo_name());
						info.put("ceo_des", Data.getCeo_des());
						info.put("ceo_per_des", Data.getCeo_per_des());
						try {
							collection.insertOne(info);
							flag = true;
						}catch(Exception e) {
							flag = false;
						}
						
						mongoClient.close();
					} catch (MongoException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
					}
					return flag;
					 
				    /*
					String sql="insert  into company(number,com_name,com_addr,cat,se_cat,com_des,born_data,death_data,live_days,financing,total_money,death_reason,invest_name,ceo_name,ceo_des,ceo_per_des)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
					
					Connection conn=null;
					PreparedStatement stmt=null;
					ResultSet rs =null;
					boolean secat = search_se_cat_exist(Data.getSe_cat());
					boolean invest = search_invest_company_exist(Data.getInvest_name());
					boolean map = updata_map(Data.getCom_addr());
					boolean cat = updata_field(Data.getCat());
					if(secat && invest && map && cat) {
					//System.out.println(sql);
					try
					{
							
						conn = JdbcUtil.getConnection();
						stmt = conn.prepareStatement(sql);
						
						
						stmt.setString(1,Data.getNumber());
						stmt.setString(2,Data.getCom_name());
						stmt.setString(3,Data.getCom_addr());
						stmt.setString(4,Data.getCat());
						stmt.setString(5,Data.getSe_cat());
						stmt.setString(6,Data.getCom_des());
						stmt.setString(7,Data.getBorn_data());
						stmt.setString(8,Data.getDeath_data());
						stmt.setString(9,Data.getLive_days());
						stmt.setString(10,Data.getFinancing());
						stmt.setInt(11,Data.getTotal_money());
						stmt.setString(12,Data.getDeath_reason());
						stmt.setString(13,Data.getInvest_name());
						stmt.setString(14,Data.getCeo_name());
						stmt.setString(15,Data.getCeo_des());
						stmt.setString(16,Data.getCeo_per_des());
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
					}
					return false;*/
					
				}
				
				//添加公司时，更新type_company表中的信息
				public boolean updata_field(String cat) {
					/*boolean flag = false;
					Mongo mongo;
					try {
						//建立连接
						mongo = new Mongo("127.0.0.1",27017);
						//获取指定的数据库
						DB db = mongo.getDB("temp");
						//获取指定的集合
						DBCollection dbCollection = db.getCollection("cat");
						DBCursor result = dbCollection.find(new BasicDBObject("name", cat));
						while (result.hasNext()) {
							DBObject dbObject = (DBObject) result.next();
							int num = Integer.parseInt(dbObject.get("number").toString());
							String id = dbObject.get("id").toString();
							String number = dbObject.get("_id").toString();
							BasicDBObject info = new BasicDBObject();
							info.put("name", cat);
							info.put("number", num+1);
							info.put("id", id);
							WriteResult row = dbCollection.update(
									new BasicDBObject("_id", new ObjectId(number)), 
						            info,
						            false,//如果数据库不存在，是否添加
						            false//多条修改);
							);
							if(row.toString() == "N/A") {
								flag = true;
							}
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
					
					Connection conn=null;
					PreparedStatement stmt=null;
					ResultSet rs =null;
					String sql = "select number from type_company where name=?";
					
					try
					{
						conn = JdbcUtil.getConnection();
						stmt = conn.prepareStatement(sql);
						stmt.setString(1,cat);
						rs  = stmt.executeQuery();
						while(rs.next()){
								int number= rs.getInt("number")+1;
								String sql3 = "UPDATE  type_company  SET number=? WHERE name=?";
								stmt = conn.prepareStatement(sql3);
								stmt.setInt(1,number);
								stmt.setString(2, cat);
								int rows  = stmt.executeUpdate();
								if(rows>0)
									return true;
								else
									return false;
							
						}
							return false;
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
				
				//添加公司时，更新map表中的信息
				public boolean updata_map(String com_addr) {
					/*boolean flag = false;
					Mongo mongo;
					try {
						//建立连接
						mongo = new Mongo("127.0.0.1",27017);
						//获取指定的数据库
						DB db = mongo.getDB("temp");
						//获取指定的集合
						DBCollection dbCollection = db.getCollection("map");
						DBCursor result = dbCollection.find(new BasicDBObject("name", com_addr));
						while (result.hasNext()) {
							DBObject dbObject = (DBObject) result.next();
							int num = Integer.parseInt(dbObject.get("number").toString());
							String id = dbObject.get("id").toString();
							String number = dbObject.get("_id").toString();
							BasicDBObject info = new BasicDBObject();
							info.put("name", com_addr);
							info.put("number", num+1);
							info.put("id", id);
							WriteResult row = dbCollection.update(
									new BasicDBObject("_id", new ObjectId(number)), 
						            info,
						            false,//如果数据库不存在，是否添加
						            false//多条修改);
							);
							if(row.toString() == "N/A") {
								flag = true;
							}
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
					
					Connection conn=null;
					PreparedStatement stmt=null;
					ResultSet rs =null;
					String sql = "select number from map where name=?";
					
					try
					{
						conn = JdbcUtil.getConnection();
						stmt = conn.prepareStatement(sql);
						stmt.setString(1,com_addr);
						rs  = stmt.executeQuery();
						while(rs.next()){
								int number= rs.getInt("number")+1;
								String sql3 = "UPDATE  map  SET number=? WHERE name=?";
								stmt = conn.prepareStatement(sql3);
								stmt.setInt(1,number);
								stmt.setString(2, com_addr);
								int rows  = stmt.executeUpdate();
								if(rows>0)
									return true;
								else
									return false;
							
						}
							return false;
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
				
				//查找子领域是否在其数据库中存在，若不存在则添加并指定书目为1
				public boolean search_se_cat_exist(String se_cat) {
					/*boolean flag = false;
					Mongo mongo;
					try {
						//建立连接
						mongo = new Mongo("127.0.0.1",27017);
						//获取指定的数据库
						DB db = mongo.getDB("temp");
						//获取指定的集合
						DBCollection dbCollection = db.getCollection("se_cat");
						DBCursor result = dbCollection.find(new BasicDBObject("name", se_cat));
						int count = (int) result.count();
						if(count == 0) {
							BasicDBObject info = new BasicDBObject();
							info.put("name", se_cat);
							info.put("number", 1);
							info.put("id", dbCollection.count()+1);
							int judge = dbCollection.insert(info).getN();
							if(judge == 0) {
								flag = true;
							}
						}
						else {
							while (result.hasNext()) {
								DBObject dbObject = (DBObject) result.next();
								int num = Integer.parseInt(dbObject.get("number").toString());
								String id = dbObject.get("id").toString();
								String number = dbObject.get("_id").toString();
								BasicDBObject info = new BasicDBObject();
								info.put("name", se_cat);
								info.put("number", num+1);
								info.put("id", id);
								WriteResult row = dbCollection.update(
										new BasicDBObject("_id", new ObjectId(number)), 
							            info,
							            false,//如果数据库不存在，是否添加
							            false//多条修改);
								);
								if(row.toString() == "N/A") {
									flag = true;
								}
							}
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
					
					Connection conn=null;
					PreparedStatement stmt=null;
					PreparedStatement stmt1=null;
					ResultSet rs =null;
					String sql = "select  count(*) numbers,number from sub_type where name=?";
					
					try
					{
						conn = JdbcUtil.getConnection();
						stmt = conn.prepareStatement(sql);
						stmt.setString(1,se_cat);
						rs  = stmt.executeQuery();
						while(rs.next()){
							int numbers = rs.getInt("numbers");
							int number= rs.getInt("number")+1;
							if(numbers == 0) {
								String sql1 = "insert into sub_type(name,number)values(?,?)";
								stmt1 = conn.prepareStatement(sql1);
								stmt1.setString(1,se_cat);
								stmt1.setInt(2,1);
								int rows  = stmt1.executeUpdate();
								if(rows>0)
									return true;
								else
									return false;
							}
							else {
								String sql3 = "UPDATE  sub_type  SET number=? WHERE name=?";
								stmt = conn.prepareStatement(sql3);
								stmt.setInt(1,number);
								stmt.setString(2, se_cat);
								int rows  = stmt.executeUpdate();
								if(rows>0)
									return true;
								else
									return false;
							}
						}
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
				}
				//查找投资公司是否在其数据库中存在，若不存在则添加并指定书目为1
				public boolean search_invest_company_exist(String invest_company) {
					/*boolean flag = false;
					Mongo mongo;
					try {
						//建立连接
						mongo = new Mongo("127.0.0.1",27017);
						//获取指定的数据库
						DB db = mongo.getDB("temp");
						//获取指定的集合
						DBCollection dbCollection = db.getCollection("invest");
						DBCursor result = dbCollection.find(new BasicDBObject("name", invest_company));
						int count = (int) result.count();
						if(count == 0) {
							BasicDBObject info = new BasicDBObject();
							info.put("name", invest_company);
							info.put("number", 1);
							info.put("id", dbCollection.count()+1);
							int judge = dbCollection.insert(info).getN();
							if(judge == 0) {
								flag = true;
							}
						}
						else {
							while (result.hasNext()) {
								DBObject dbObject = (DBObject) result.next();
								int num = Integer.parseInt(dbObject.get("number").toString());
								String id = dbObject.get("id").toString();
								String number = dbObject.get("_id").toString();
								BasicDBObject info = new BasicDBObject();
								info.put("name", invest_company);
								info.put("number", num+1);
								info.put("id", id);
								WriteResult row = dbCollection.update(
										new BasicDBObject("_id", new ObjectId(number)), 
							            info,
							            false,//如果数据库不存在，是否添加
							            false//多条修改);
								);
								if(row.toString() == "N/A") {
									flag = true;
								}
							}
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
				
					Connection conn=null;
					PreparedStatement stmt=null;
					PreparedStatement stmt1=null;
					ResultSet rs =null;
					String sql = "select  count(*) numbers,number from invest_company where name=?";
					
					try
					{
						conn = JdbcUtil.getConnection();
						stmt = conn.prepareStatement(sql);
						stmt.setString(1,invest_company);
						rs  = stmt.executeQuery();
						while(rs.next()){
							int numbers = rs.getInt("numbers");
							int number= rs.getInt("number")+1;
							if(numbers == 0) {
								String sql1 = "insert into invest_company(name,number)values(?,?)";
								stmt1 = conn.prepareStatement(sql1);
								stmt1.setString(1,invest_company);
								stmt1.setInt(2,1);
								int rows  = stmt1.executeUpdate();
								if(rows>0)
									return true;
								else
									return false;
							}
							else {
								String sql3 = "UPDATE  invest_company  SET number=? WHERE name=?";
								stmt = conn.prepareStatement(sql3);
								stmt.setInt(1,number);
								stmt.setString(2, invest_company);
								int rows  = stmt.executeUpdate();
								if(rows>0)
									return true;
								else
									return false;
							}
						}
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
				}
				
				//统计每年死亡的公司
				public List<Back_data> sum_year() {
					// TODO Auto-generated method stub
					int year;
					List<Back_data> list_year= new ArrayList<Back_data>();
					
						MongoClient mongoClient = new MongoClient( "localhost", 27017);
						MongoDatabase databasee = mongoClient.getDatabase("temp");
						MongoCollection<Document> collection = databasee.getCollection("data");
						
						for(year=2000;year<=2020;year++) {
							BasicDBObject query = new BasicDBObject();
							String bornn = "^.*"+year+".*$";
							Pattern pattern = Pattern.compile(bornn, Pattern.CASE_INSENSITIVE); 
							//模糊匹配born查询
								query.put("death_data", new BasicDBObject("$regex",pattern));
								MongoCursor<Document> result = collection.find(query).iterator();
								int sum = 0; 
								while(result.hasNext()) {
									result.next();
									sum++;
								}
								Back_data user = new Back_data();
								user.setRank(year);
								user.setNumber(sum);
								list_year.add(user);
				 			}
						mongoClient.close();
						return list_year;	
					
					/*
					int year;
					List<Back_data> list_year= new ArrayList<Back_data>();
					Connection conn=null;
					PreparedStatement stmt=null;
					ResultSet rs =null;
					for(year=2000;year<=2020;year++) {
							String sql="select count(*) totalCount from company where death_data like '%"+year+"%'";
							try
							{
								conn = JdbcUtil.getConnection();
								stmt = conn.prepareStatement(sql);
								rs  = stmt.executeQuery();
								while(rs.next()){
									Back_data user = new Back_data();
									user.setRank(year);
									user.setNumber(rs.getInt("totalCount"));
									list_year.add(user);
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
					return list_year;*/
				}
				
				//按公司名查找
				public List<Data> searchname(String name) {
					 
					try {
						MongoClient mongoClient = new MongoClient( "localhost", 27017);
						MongoDatabase databasee = mongoClient.getDatabase("temp");
						MongoCollection<Document> collection = databasee.getCollection("data");
						 
				        List<Data> list= new ArrayList<Data>();
				        Document query = new Document("com_name", name);
				        MongoCursor<Document> result = collection.find(query).iterator();
				         
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
					String sql = "select * from company where com_name = ?";
					try
					{
						List<Data> list= new ArrayList<Data>();
						conn = JdbcUtil.getConnection();
						stmt = conn.prepareStatement(sql);
						stmt.setString(1, name);
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
							//return user;
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
