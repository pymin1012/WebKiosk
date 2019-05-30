package kiosk;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ProductMgr {
		
	private DBConnectionMgr pool;
	private static final String UPLOAD = "C:/T-gf/WebP/WebContent/pic";
	private static final String ENCTYPE = "EUC-KR";
	private static final int MAXSIZE = 10*1024*1024;
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs =null;
	String sql = "";
	
	public ProductMgr() {
		pool=DBConnectionMgr.getInstance();
	}
	
	// Category ��������
	public Vector<CategoryBean> getCategoryList() {
		Vector<CategoryBean> vlist = new Vector<CategoryBean>();
		
		try {
			con = pool.getConnection();
			sql = "select * from category ";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CategoryBean bean = new CategoryBean();
				bean.setCtg_num(rs.getInt("ctg_num"));
				bean.setCtg_name(rs.getString("ctg_name"));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return vlist;
	}
	
	// Category�� Product List
	public Vector<ProductBean> getProductList(int ctg_num){
		Vector<ProductBean> vlist =new Vector<>();
		
		try {
			con = pool.getConnection();
			sql = "select * from Product where ctg_num = ? order by prod_num asc";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ctg_num);
			rs = pstmt.executeQuery();
			while(rs.next()){
				ProductBean bean =new ProductBean();
				bean.setProd_num(rs.getInt("prod_num"));
				bean.setProd_name(rs.getString("prod_name"));
				bean.setProd_img(rs.getString("prod_img"));
				bean.setProd_iimg(rs.getString("prod_iimg"));
				bean.setCtg_num(rs.getInt("ctg_num"));
				bean.setProd_price(rs.getInt("prod_price"));
				bean.setProd_kcal(rs.getInt("prod_kcal"));
				bean.setProd_coo(rs.getString("prod_coo"));
				bean.setProd_so(rs.getBoolean("prod_so"));
				vlist.addElement(bean);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return vlist;
	}
	
	//Product Detail
	public ProductBean getProduct(int prod_num) {
		ProductBean bean =new ProductBean();
		
		try {
			con = pool.getConnection();
			sql = "select * from Product where prod_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, prod_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setProd_num(rs.getInt("prod_num"));
				bean.setProd_name(rs.getString("prod_name"));
				bean.setProd_img(rs.getString("prod_img"));
				bean.setProd_iimg(rs.getString("prod_iimg"));
				bean.setCtg_num(rs.getInt("ctg_num"));
				bean.setProd_price(rs.getInt("prod_price"));
				bean.setProd_kcal(rs.getInt("prod_kcal"));
				bean.setProd_coo(rs.getString("prod_coo"));
				bean.setProd_so(rs.getBoolean("prod_so"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return bean;
	}
	
	// �̺�Ʈ ��ǰ ���� ��������
	public int getEventProductPrice(int prod_num) {
		int ev_price = 0;
		
		try {
			con = pool.getConnection();
			sql = "SELECT ev_price FROM evento WHERE prod_num = ? AND CURRENT_DATE() >= ev_start AND CURRENT_DATE() <= ev_end;";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, prod_num);
			
			rs = pstmt.executeQuery();
			if(rs.next()) { ev_price = rs.getInt(1); }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return ev_price;
	}
	
	// �̺�Ʈ ��ǰ ����Ʈ
	public Vector<ProductBean> getEventProductList(){
		Vector<ProductBean> vlist =new Vector<>();
		
		try {
			con = pool.getConnection();
			sql = "select * from Product where prod_num in (SELECT prod_num FROM evento WHERE CURRENT_DATE() >= ev_start AND CURRENT_DATE() <= ev_end) order by prod_num asc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				ProductBean bean =new ProductBean();
				bean.setProd_num(rs.getInt("prod_num"));
				bean.setProd_name(rs.getString("prod_name"));
				bean.setProd_img(rs.getString("prod_img"));
				bean.setProd_iimg(rs.getString("prod_iimg"));
				bean.setCtg_num(rs.getInt("ctg_num"));
				bean.setProd_price(rs.getInt("prod_price"));
				bean.setProd_kcal(rs.getInt("prod_kcal"));
				bean.setProd_coo(rs.getString("prod_coo"));
				bean.setProd_so(rs.getBoolean("prod_so"));
				vlist.addElement(bean);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return vlist;
	}
	
	// �̺�Ʈ ��ǰ���� Ȯ��
	public boolean isEventProduct(int prod_num) {
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "select * from evento where prod_num = ? and CURRENT_DATE() >= ev_start AND CURRENT_DATE() <= ev_end";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, prod_num);
			rs = pstmt.executeQuery();
			if (rs.next()) { flag = true; }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return flag;
	}
}