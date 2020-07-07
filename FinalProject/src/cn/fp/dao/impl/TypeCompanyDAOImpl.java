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
import com.mongodb.client.AggregateIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

import cn.fp.Fclass.Back_data;
import cn.fp.Fclass.Data;
import cn.fp.dao.TypeCompanyDAO;
import cn.fp.util.JdbcUtil;

public class TypeCompanyDAOImpl implements TypeCompanyDAO {
	//列表循环读出数据库中的值并以列表的形式返回
			public List<Back_data> getOne() {
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
					System.out.print(time);
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
				String sql = "insert into type_company(name,number)values(?,?)";
				
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
						String sql = "select * from type_company";
						
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
						String sql = "select * from type_company where name=?";
						
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
						String sql="UPDATE  type_company  SET number=? WHERE rank=?";
						
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
						String sql="delete from type_company where rank=?";
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
					
					/**
					* 计算总的页数
					* @return
					*/
					public int getPage(String field,String name){
						int recordCount=0,t1=0,t2=0;
						
						MongoClient mongoClient = new MongoClient("localhost", 27017);
						MongoDatabase database = mongoClient.getDatabase("temp");
					    MongoCollection<Document> dbcollection = database.getCollection("data");
					    
						
				        Document query3 = new Document();
				        
				        
				        if(name != null &&!name.trim().isEmpty()) {
							String namee = "^.*"+name+".*$";
							Pattern pattern = Pattern.compile(namee, Pattern.CASE_INSENSITIVE); 
							//模糊匹配name查询
				 			query3.put("com_name", new BasicDBObject("$regex",pattern));
						}
						
						if(field != null &&!field.trim().isEmpty() ) {
							String fieldd = "^.*"+field+".*$";
							Pattern pattern = Pattern.compile(fieldd, Pattern.CASE_INSENSITIVE); 
							//模糊匹配born查询
				 			query3.put("cat", new BasicDBObject("$regex",pattern));
						}
						
						 
				        MongoCursor<Document> result = dbcollection.find(query3).iterator();
				        while (result.hasNext()) {
							result.next();
							recordCount++;
				        }
				        mongoClient.close();
				        t1=recordCount%10;
						t2=recordCount/10;
						/*
						PreparedStatement stmt=null;
						ResultSet rs=null;
						Connection conn=null;
						StringBuilder sql = new StringBuilder("select count(*) from company where 1=1");
						 
						try {
							if(name != null &&!name.trim().isEmpty()) {
								sql.append(" and com_name like "+"'%" + name + "%'");
							}
							
							
							if(field != null &&!field.trim().isEmpty() ) {
								sql.append(" and cat like "+"'%" + field + "%'");
								
							}
							
							conn = JdbcUtil.getConnection();
							stmt = conn.prepareStatement(sql.toString());
							
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
						}*/
						if(t1 != 0){
						t2=t2+1;
						}
						return t2;
					}
					
					
					//列表循环读出数据库中的值并以列表的形式返回
						public List<Data> getOne(int pageNo,String field,String name) {
							int num = getPage(field,name);
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
							
							
							MongoClient mongoClient = new MongoClient("localhost", 27017);
							MongoDatabase database = mongoClient.getDatabase("temp");
						    MongoCollection<Document> dbcollection = database.getCollection("data");
						    
							int limit =10;
					        int skip = (pageNo - 1) * limit;
					        List<Data> list= new ArrayList<Data>();
					        Document query3 = new Document();
					        
					        
					        if(name != null &&!name.trim().isEmpty()) {
								String namee = "^.*"+name+".*$";
								Pattern pattern = Pattern.compile(namee, Pattern.CASE_INSENSITIVE); 
								//模糊匹配name查询
					 			query3.put("com_name", new BasicDBObject("$regex",pattern));
							}
							
							if(field != null &&!field.trim().isEmpty() ) {
								String fieldd = "^.*"+field+".*$";
								Pattern pattern = Pattern.compile(fieldd, Pattern.CASE_INSENSITIVE); 
								//模糊匹配born查询
					 			query3.put("cat", new BasicDBObject("$regex",pattern));
							}
							
							
					        MongoCursor<Document> result = dbcollection.find(query3).skip(skip).limit(limit).iterator();
					         
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
							
							
							/*
							Connection conn=null;
							PreparedStatement stmt=null;
							ResultSet rs =null;
							StringBuilder sql = new StringBuilder("select * from company where 1=1");
							int pageSize=10;
							int page=(pageNo-1)*10;
							//System.out.println(sql);
							try
							{
								if(name != null &&!name.trim().isEmpty()) {
									sql.append(" and com_name like "+"'%" + name + "%'");
								}
								
								if(field != null &&!field.trim().isEmpty() ) {
									sql.append(" and cat="+"'" + field + "'");
								}
								sql.append(" order by id limit ?,? ");
								System.out.print(sql);
								List<Data> list= new ArrayList<Data>();
								conn = JdbcUtil.getConnection();
								stmt = conn.prepareStatement(sql.toString());
								
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
						public List<Back_data> getcat(String reason) {
							
							MongoClient mongoClient = new MongoClient( "localhost", 27017);
							MongoDatabase databasee = mongoClient.getDatabase("temp");
							MongoCollection<Document> collection = databasee.getCollection("data");
							List<Back_data> list= new ArrayList<Back_data>();
							
							String reasonn = "^.*"+reason+".*$";
							Pattern pattern = Pattern.compile(reasonn, Pattern.CASE_INSENSITIVE); 
							
							
							Document info_match = new Document();
							info_match.put("death_reason", new BasicDBObject("$regex",pattern));
							
							Document info_group = new Document();
							info_group.put("_id", "$cat");
							info_group.put("count", new Document("$sum",1));
							
							Document match = new Document("$match", info_match);
							Document group = new Document("$group", info_group);
							 
							
							List<Document> aggregateList = new ArrayList<Document>();
							aggregateList.add(match);
							aggregateList.add(group);
							
							
							AggregateIterable<Document> resultset = collection.aggregate(aggregateList);
							MongoCursor<Document> cursor = resultset.iterator();
							mongoClient.close();
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
							
							String sql = "select cat as 'a',count(cat) as 'b' from company where death_reason like '%"+reason+"%' GROUP BY cat" ;
							
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
