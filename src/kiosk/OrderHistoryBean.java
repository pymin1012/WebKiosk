package kiosk;

public class OrderHistoryBean {
	private int oh_num;
	private int oh_status;
	private int mb_num;
	private String oh_date;
	private String oh_io;
	private String oh_comment;
	private int oh_point;
	
	public int getOh_num() { return oh_num; }
	public int getOh_status() { return oh_status; }
	public int getMb_num() { return mb_num; }
	public String getOh_date() { return oh_date; }
	public String getOh_io() { return oh_io; }
	public String getOh_comment() { return oh_comment; }
	public int getOh_point() { return oh_point; }
	
	public void setOh_num(int oh_num) { this.oh_num = oh_num; }
	public void setOh_status(int oh_status) { this.oh_status = oh_status; }
	public void setMb_num(int mb_num) { this.mb_num = mb_num; }
	public void setOh_date(String oh_date) { this.oh_date = oh_date; }
	public void setOh_io(String oh_io) { this.oh_io = oh_io; }
	public void setOh_comment(String oh_comment) { this.oh_comment = oh_comment; }
	public void setOh_point(int oh_point) { this.oh_point = oh_point; }	
}
