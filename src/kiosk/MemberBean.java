package kiosk;

public class MemberBean {
	private int mb_num;
	private int mb_phone;
	private int mb_pwd;
	private int mb_point;
	
	public void setMb_num(int mb_num) { this.mb_num = mb_num; }
	public void setMb_phone(int mb_phone) { this.mb_phone = mb_phone; }
	public void setMb_pwd(int mb_pwd) { this.mb_pwd = mb_pwd; }
	public void setMb_point(int mb_point) {	this.mb_point = mb_point; }
	
	public int getMb_num() { return mb_num; }
	public int getMb_phone() { return mb_phone; }
	public int getMb_pwd() { return mb_pwd; }
	public int getMb_point() { return mb_point; }
}
