package kiosk;

public class OrdersBean {
	private int or_num;
	private String or_date;
	private int prod_num;
	private int mb_num;
	private String or_size;
	private int or_count;
	private int or_shot;
	private boolean or_whip;
	private String or_io;
	private String or_hi;
	private String or_comment;
	private int or_point;
	
	public void setOr_num(int or_num) { this.or_num = or_num; }
	public void setOr_date(String or_date) { this.or_date = or_date; }
	public void setProd_num(int prod_num) { this.prod_num = prod_num; }
	public void setMb_num(int mb_num) { this.mb_num = mb_num; }
	public void setOr_size(String or_size) { this.or_size = or_size; }
	public void setOr_count(int or_count) { this.or_count = or_count; }
	public void setOr_shot(int or_shot) { this.or_shot = or_shot; }
	public void setOr_whip(boolean or_whip) { this.or_whip = or_whip; }
	public void setOr_io(String or_io) { this.or_io = or_io; }
	public void setOr_hi(String or_hi) { this.or_hi = or_hi; }
	public void setOr_comment(String or_comment) { this.or_comment = or_comment; }
	public void setOr_point(int or_point) { this.or_point = or_point; }
	
	public int getOr_num() { return or_num; }
	public String getOr_date() { return or_date; }
	public int getProd_num() { return prod_num; }
	public int getMb_num() { return mb_num; }
	public String getOr_size() { return or_size; }
	public int getOr_count() { return or_count; }
	public int getOr_shot() { return or_shot; }
	public boolean isOr_whip() { return or_whip; }
	public String getOr_io() { return or_io; }
	public String getOr_hi() { return or_hi; }
	public String getOr_comment() { return or_comment; }
	public int getOr_point() { return or_point; }
}
