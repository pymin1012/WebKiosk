package kiosk;

public class EventoBean {
	private int ev_num;
	private String ev_name;
	private String ev_end;
	private int prod_num;
	private int ev_price;
	
	public void setEv_num(int ev_num) { this.ev_num = ev_num; }
	public void setEv_name(String ev_name) { this.ev_name = ev_name; }
	public void setEv_end(String ev_end) { this.ev_end = ev_end; }
	public void setProd_num(int prod_num) { this.prod_num = prod_num; }
	public void setEv_price(int ev_price) { this.ev_price = ev_price; }
	
	public int getEv_num() { return ev_num; }
	public String getEv_name() { return ev_name; }
	public String getEv_end() { return ev_end; }
	public int getProd_num() { return prod_num; }
	public int getEv_price() { return ev_price; }
}
