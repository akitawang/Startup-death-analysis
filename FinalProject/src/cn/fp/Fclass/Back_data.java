package cn.fp.Fclass;

public class Back_data {
	public int rank;
	public String name;
	public int number;;
	public int value;
	public String date;
	public Back_data(int rank, String name, int number, int value, String date) {
		super();
		this.rank = rank;
		this.name = name;
		this.number = number;
		this.value = value;
		this.date = date;
	}
	public Back_data() {
		super();
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	

}
