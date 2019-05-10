package kiosk;

public class MemberBean {
	private int mb_num;
	private String mb_phone;
	
	private String mb_name;	
	private int mb_pwd;
	private int mb_point;
	
	public void setMb_num(int mb_num) { this.mb_num = mb_num; }
	public void setMb_phone(String mb_phone) {this.mb_phone = mb_phone;}
	public void setMb_name(String mb_name) {this.mb_name = mb_name;}
	public void setMb_pwd(int mb_pwd) { this.mb_pwd = mb_pwd; }
	public void setMb_point(int mb_point) {	this.mb_point = mb_point; }
	
	public int getMb_num() { return mb_num; }
	public String getMb_phone() { return mb_phone; }
	public String getMb_name() {return mb_name;}
	public int getMb_pwd() { return mb_pwd; }
	public int getMb_point() { return mb_point; }
}
