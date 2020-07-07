package cn.fp.Fclass;

public class Admin {
	public String username;
	public String userpass;
	public int userid;
	
	
	public Admin(String username, String userpass, int userid) {
		super();
		this.username = username;
		this.userpass = userpass;
		this.userid = userid;
	}


	public Admin() {
		super();
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getUserpass() {
		return userpass;
	}


	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}


	public int getUserid() {
		return userid;
	}


	public void setUserid(int userid) {
		this.userid = userid;
	}
	
	
	
	
	

}
