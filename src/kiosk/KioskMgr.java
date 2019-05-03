package kiosk;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class KioskMgr {
	private DBConnectionMgr pool = null;
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	
	public KioskMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public void insertOrders(OrdersBean bean) {
		try {
			conn = pool.getConnection();
			sql = "insert into orders(or_date, prod_num, mb_num, or_size, or_count, or_shot, or_whip, or_io, or_hi, or_comment, or_point) "
					+ "values(now(), ?, ?, ?, ?, 0, false, ?, ?, 0, 0)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bean.getProd_num());
			pstmt.setInt(2, bean.getMb_num());
			pstmt.setString(3, bean.getOr_size());
			pstmt.setInt(4, bean.getOr_count());
			pstmt.setString(5, "IN");
			pstmt.setString(6, bean.getOr_hi());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt);
		}
	}
	
	public Vector<OrdersBean> getOrdersList() {
		Vector<OrdersBean> v = new Vector<OrdersBean>();
		
		try {
			conn = pool.getConnection();
			sql = "select * from orders";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				OrdersBean bean = new OrdersBean();
				bean.setOr_num(rs.getInt("or_num"));
				bean.setOr_date(rs.getString("or_date"));
				bean.setProd_num(rs.getInt("prod_num"));
				bean.setMb_num(rs.getInt("mb_num"));
				bean.setOr_size(rs.getString("or_size"));
				bean.setOr_count(rs.getInt("or_count"));
				bean.setOr_shot(rs.getInt("or_shot"));
				bean.setOr_whip(rs.getBoolean("or_whip"));
				bean.setOr_io(rs.getString("or_io"));
				bean.setOr_hi(rs.getString("or_hi"));
				bean.setOr_comment(rs.getString("or_comment"));
				bean.setOr_point(rs.getInt("or_point"));
				v.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}
		
		return v;
	}
}
