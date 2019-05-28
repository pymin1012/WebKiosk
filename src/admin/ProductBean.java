package admin;

public class ProductBean {
	private int prod_num;
	private String prod_name;
	private String prod_img;
	private String prod_iimg;
	private int ctg_num; 
	private int prod_price;
	private int prod_kcal;
	private String prod_coo;
	private boolean prod_so;
	
	public void setProd_num(int prod_num) { this.prod_num = prod_num; }
	public void setProd_name(String prod_name) { this.prod_name = prod_name; }
	public void setProd_img(String prod_img) { this.prod_img = prod_img; }
	public void setProd_iimg(String prod_iimg) {this.prod_iimg = prod_iimg;}
	public void setCtg_num(int ctg_num) {this.ctg_num = ctg_num;}
	public void setProd_price(int prod_price) { this.prod_price = prod_price; }
	public void setProd_kcal(int prod_kcal) { this.prod_kcal = prod_kcal; }
	public void setProd_coo(String prod_coo) { this.prod_coo = prod_coo; }
	public void setProd_so(boolean prod_so) { this.prod_so = prod_so; }

	public int getProd_num() { return prod_num; }
	public String getProd_name() { return prod_name; }
	public String getProd_img() { return prod_img; }
	public String getProd_iimg() {return prod_iimg;}
	public int getCtg_num() {return ctg_num;}
	public int getProd_price() { return prod_price; }
	public int getProd_kcal() { return prod_kcal; }
	public String getProd_coo() { return prod_coo; }	
	public boolean isProd_so() { return prod_so; } 
}
