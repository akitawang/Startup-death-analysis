package cn.fp.util;

import java.net.UnknownHostException;

import org.bson.Document;


import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

public class MongodbUtil {
	
	public static MongoCollection<Document> getCollection() throws UnknownHostException {


	// // 实例化Mongo对象，
	// Mongo mongo = new Mongo(dbIp, dbPort);
	// // 连接名为yourdb的数据库，假如数据库不存在的话，mongodb会自动建立
	// DB db = mongo.getDB(dbUser);
	// // 从Mongodb中获得名为myData的数据集合，如果该数据集合不存在，Mongodb会为其新建立
	// DBCollection collection = db.getCollection(table);


		MongoClient mongoClient = new MongoClient( "localhost", 27017);
		MongoDatabase databasee = mongoClient.getDatabase("temp");
		MongoCollection<Document> collection = databasee.getCollection("data");


		return collection;
	}
}
