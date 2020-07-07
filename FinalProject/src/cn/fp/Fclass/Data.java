package cn.fp.Fclass;

public class Data {
	private int    id;       //���
	private String number;       //���
	private String com_name;  //��˾����
	private String com_addr;  //��˾����
	private String cat;       //��˾����
	private String se_cat;    //������
	private String com_des;   // ��˾����
	private String born_data; //��������
	private String death_data;//��������
	private String live_days; //���ʱ��
	private String financing;  //�������
	private int total_money;  //�����ܶ�
	private String totalmoney;  //�����ܶ�
	private String death_reason;  //����ԭ��
	private String invest_name;   //Ͷ�ʻ���
	private String ceo_name;   //CEO����
	private String ceo_des;    // CEOְλ
	private String ceo_per_des;  // CEO����
	
	public Data(int id, String number, String com_name, String com_addr, String cat, String se_cat, String com_des,
			String born_data, String death_data, String live_days, String financing, int total_money,String totalmoney,
			String death_reason, String invest_name, String ceo_name, String ceo_des, String ceo_per_des) {
		super();
		this.id = id;
		this.number = number;
		this.com_name = com_name;
		this.com_addr = com_addr;
		this.cat = cat;
		this.se_cat = se_cat;
		this.com_des = com_des;
		this.born_data = born_data;
		this.death_data = death_data;
		this.live_days = live_days;
		this.financing = financing;
		this.total_money = total_money;
		this.totalmoney = totalmoney;
		this.death_reason = death_reason;
		this.invest_name = invest_name;
		this.ceo_name = ceo_name;
		this.ceo_des = ceo_des;
		this.ceo_per_des = ceo_per_des;
	}
	public Data() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String num) {
		this.number = num;
	}
	public String getCom_name() {
		return com_name;
	}
	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}
	public String getCom_addr() {
		return com_addr;
	}
	public void setCom_addr(String com_addr) {
		this.com_addr = com_addr;
	}
	public String getCat() {
		return cat;
	}
	public void setCat(String cat) {
		this.cat = cat;
	}
	public String getSe_cat() {
		return se_cat;
	}
	public void setSe_cat(String se_cat) {
		this.se_cat = se_cat;
	}
	public String getCom_des() {
		return com_des;
	}
	public void setCom_des(String com_des) {
		this.com_des = com_des;
	}
	public String getBorn_data() {
		return born_data;
	}
	public void setBorn_data(String born_data) {
		this.born_data = born_data;
	}
	public String getDeath_data() {
		return death_data;
	}
	public void setDeath_data(String death_data) {
		this.death_data = death_data;
	}
	public String getLive_days() {
		return live_days;
	}
	public void setLive_days(String live_days) {
		this.live_days = live_days;
	}
	public String getFinancing() {
		return financing;
	}
	public void setFinancing(String financing) {
		this.financing = financing;
	}
	public int getTotal_money() {
		return total_money;
	}
	public void setTotal_money(int total_money) {
		this.total_money = total_money;
	}
	public String getTotalmoney() {
		return totalmoney;
	}
	public void setTotalmoney(String totalmoney) {
		this.totalmoney = totalmoney;
	}
	public String getDeath_reason() {
		return death_reason;
	}
	public void setDeath_reason(String death_reason) {
		this.death_reason = death_reason;
	}
	public String getInvest_name() {
		return invest_name;
	}
	public void setInvest_name(String invest_name) {
		this.invest_name = invest_name;
	}
	public String getCeo_name() {
		return ceo_name;
	}
	public void setCeo_name(String ceo_name) {
		this.ceo_name = ceo_name;
	}
	public String getCeo_des() {
		return ceo_des;
	}
	public void setCeo_des(String ceo_des) {
		this.ceo_des = ceo_des;
	}
	public String getCeo_per_des() {
		return ceo_per_des;
	}
	public void setCeo_per_des(String ceo_per_des) {
		this.ceo_per_des = ceo_per_des;
	}
	
	
	

}
