package kiosk;

public class OrdersBean {
	private int oh_tnum;
	private int or_basket;
	private int prod_num;
	private String or_size;
	private int or_count;
	private int or_shot;
	private boolean or_whip;
	private String or_hi;
	private int or_event;
	
	public void setOh_tnum(int oh_tnum) { this.oh_tnum = oh_tnum; }
	public void setOr_basket(int or_basket) { this.or_basket = or_basket; }
	public void setProd_num(int prod_num) { this.prod_num = prod_num; }
	public void setOr_size(String or_size) { this.or_size = or_size; }
	public void setOr_count(int or_count) { this.or_count = or_count; }
	public void setOr_shot(int or_shot) { this.or_shot = or_shot; }
	public void setOr_whip(boolean or_whip) { this.or_whip = or_whip; }
	public void setOr_hi(String or_hi) { this.or_hi = or_hi; }
	public void setOr_event(int or_event) { this.or_event = or_event; }
	
	public int getOh_tnum() { return oh_tnum; }
	public int getOr_basket() { return or_basket; }
	public int getProd_num() { return prod_num; }
	public String getOr_size() { return or_size; }
	public int getOr_count() { return or_count; }
	public int getOr_shot() { return or_shot; }
	public boolean isOr_whip() { return or_whip; }
	public String getOr_hi() { return or_hi; }
	public int getOr_event() { return or_event; }
}
