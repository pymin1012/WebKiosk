package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import admin.DBConnectionMgr;
import admin.ProductBean;
import admin.CategoryBean;

public class ProductMgr {

	private DBConnectionMgr pool;
	private static final String UPLOAD = "C:/T-gf/WebP/WebContent/menu_pic";
	private static final String ENCTYPE = "UTF-8";
	private static final int MAXSIZE = 10*1024*1024;

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs =null;
	String sql = "";

	public ProductMgr() {
		pool=DBConnectionMgr.getInstance();
	}

	/////admin mode//////////

	//Product Insert
	public boolean insertProduct(HttpServletRequest req) {

		boolean flag =false;
		try {
			MultipartRequest multi=new MultipartRequest(req, UPLOAD, MAXSIZE, ENCTYPE, new DefaultFileRenamePolicy());
			con = pool.getConnection();
			sql = "insert Product(prod_name, prod_img, prod_iimg, ctg_num, prod_price, prod_kcal, prod_coo, prod_so)"
					+ "values(?,?,?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);


			pstmt.setString(1, multi.getParameter("prod_name"));
			if(multi.getFilesystemName("prod_img")==null)
				pstmt.setString(2, null);
			else
				pstmt.setNString(2, multi.getFilesystemName("prod_img"));

			if(multi.getFilesystemName("prod_iimg")==null)
				pstmt.setString(3, null);
			else
				pstmt.setNString(3, multi.getFilesystemName("prod_iimg"));


			pstmt.setInt(4, Integer.parseInt(multi.getParameter("ctg_num")));
			pstmt.setInt(5, Integer.parseInt(multi.getParameter("prod_price")));
			pstmt.setInt(6, Integer.parseInt(multi.getParameter("prod_kcal")));
			pstmt.setString(7, multi.getParameter("prod_coo"));
			pstmt.setInt(8, Integer.parseInt(multi.getParameter("prod_so")));

			if(pstmt.executeUpdate()==1)
				flag =true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	//Product Update
	public boolean updateProduct(HttpServletRequest req) {

		boolean flag =false;

		try {
			MultipartRequest multi=new MultipartRequest(req, UPLOAD, MAXSIZE, ENCTYPE, new DefaultFileRenamePolicy());
			con = pool.getConnection();
			String prod_img = multi.getFilesystemName("prod_img");
			String prod_iimg = multi.getFilesystemName("prod_iimg");
			
			if(prod_img !=null && prod_iimg != null) {
				//파일은 선택을 안 함.
				sql="update Product set prod_name=?, prod_img=?, prod_iimg=? ctg_num=?, prod_price=?, prod_kcal=? ,prod_coo=? , prod_so=? where  prod_num= ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, multi.getParameter("prod_name"));
				pstmt.setString(2, multi.getParameter("prod_img"));
				pstmt.setString(3, multi.getParameter("prod_iimg"));
				pstmt.setInt(4, Integer.parseInt(multi.getParameter("ctg_num")));
				pstmt.setInt(5, Integer.parseInt(multi.getParameter("prod_price")));
				pstmt.setInt(6, Integer.parseInt(multi.getParameter("prod_kcal")));
				pstmt.setString(7, multi.getParameter("prod_coo"));	
				pstmt.setBoolean(8, Boolean.valueOf(multi.getParameter("prod_so")));
				pstmt.setInt(9, Integer.parseInt(multi.getParameter("prod_num")));
			} else if (prod_img == null & prod_iimg != null) {
				//파일까지 수정함.
				sql="update Product set prod_name=?, prod_iimg=?, ctg_num=?, prod_price=?, prod_kcal=? ,prod_coo=? , prod_so=? where  prod_num= ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, multi.getParameter("prod_name"));
				pstmt.setString(2, multi.getParameter("prod_iimg"));
				pstmt.setInt(3, Integer.parseInt(multi.getParameter("ctg_num")));
				pstmt.setInt(4, Integer.parseInt(multi.getParameter("prod_price")));
				pstmt.setInt(5, Integer.parseInt(multi.getParameter("prod_kcal")));
				pstmt.setString(6, multi.getParameter("prod_coo"));		
				pstmt.setBoolean(7, Boolean.valueOf(multi.getParameter("prod_so")));
				pstmt.setInt(8, Integer.parseInt(multi.getParameter("prod_num")));
			} else if(prod_img != null & prod_iimg == null) {
				sql="update Product set prod_name=?, prod_img=? , ctg_num=?, prod_price=?, prod_kcal=? ,prod_coo=? , prod_so=? where  prod_num= ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, multi.getParameter("prod_name"));
				pstmt.setString(2, multi.getParameter("prod_img"));
				pstmt.setInt(3, Integer.parseInt(multi.getParameter("ctg_num")));
				pstmt.setInt(4, Integer.parseInt(multi.getParameter("prod_price")));
				pstmt.setInt(5, Integer.parseInt(multi.getParameter("prod_kcal")));
				pstmt.setString(6, multi.getParameter("prod_coo"));
				pstmt.setBoolean(7, Boolean.valueOf(multi.getParameter("prod_so")));
				pstmt.setInt(8, Integer.parseInt(multi.getParameter("prod_num")));
			} else {
				sql="update Product set prod_name=?, ctg_num=?, prod_price=?, prod_kcal=? ,prod_coo=? , prod_so=? where  prod_num= ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, multi.getParameter("prod_name"));
				pstmt.setInt(2, Integer.parseInt(multi.getParameter("ctg_num")));
				pstmt.setInt(3, Integer.parseInt(multi.getParameter("prod_price")));
				pstmt.setInt(4, Integer.parseInt(multi.getParameter("prod_kcal")));
				pstmt.setString(5, multi.getParameter("prod_coo"));	
				pstmt.setBoolean(6, Boolean.valueOf(multi.getParameter("prod_so")));
				pstmt.setInt(7, Integer.parseInt(multi.getParameter("prod_num")));
			}

			if(pstmt.executeUpdate()==1) flag=true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;

	}

	//Product Delete
	public boolean deleteProduct(int prod_num) {

		boolean flag =false;

		try {
			con = pool.getConnection();
			sql = "delete from Product where prod_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, prod_num);
			if(pstmt.executeUpdate()==1)
				flag=true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;

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
				bean.setProd_num(rs.getInt("prod_num"));//상품번호
				bean.setProd_name(rs.getString("prod_name"));//상품이름
				bean.setProd_img(rs.getString("prod_img"));//상품사진
				bean.setProd_iimg(rs.getString("prod_iimg"));//상품아이스사진
				bean.setCtg_num(rs.getInt("ctg_num"));//카테코리번호
				bean.setProd_price(rs.getInt("prod_price"));//상품가격
				bean.setProd_kcal(rs.getInt("prod_kcal"));//상품kcal
				bean.setProd_coo(rs.getString("prod_coo"));//상품원산지
				bean.setProd_so(rs.getBoolean("prod_so"));//상품유무

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}

	// Product List
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

	// Category 가져오기
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

}