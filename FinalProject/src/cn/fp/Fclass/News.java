package cn.fp.Fclass;

public class News {
	public int id;
	public String title;
	public String urll;
	public String from;
	public String time;
	public String location;
	public String company;
	public String field;
	public News(int id, String title, String urll, String from, String time, String location, String company,
			String field) {
		super();
		this.id = id;
		this.title = title;
		this.urll = urll;
		this.from = from;
		this.time = time;
		this.location = location;
		this.company = company;
		this.field = field;
	}
	public News() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUrll() {
		return urll;
	}
	public void setUrll(String urll) {
		this.urll = urll;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	
	
	
	
}
