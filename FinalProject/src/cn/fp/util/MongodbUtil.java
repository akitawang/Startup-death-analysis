package cn.fp.util;

import java.net.UnknownHostException;

import org.bson.Document;


import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

public class MongodbUtil {
	
	public static MongoCollection<Document> getCollection() throws UnknownHostException {


	// // ʵ����Mongo����
	// Mongo mongo = new Mongo(dbIp, dbPort);
	// // ������Ϊyourdb�����ݿ⣬�������ݿⲻ���ڵĻ���mongodb���Զ�����
	// DB db = mongo.getDB(dbUser);
	// // ��Mongodb�л����ΪmyData�����ݼ��ϣ���������ݼ��ϲ����ڣ�Mongodb��Ϊ���½���
	// DBCollection collection = db.getCollection(table);


		MongoClient mongoClient = new MongoClient( "localhost", 27017);
		MongoDatabase databasee = mongoClient.getDatabase("temp");
		MongoCollection<Document> collection = databasee.getCollection("data");


		return collection;
	}
}
