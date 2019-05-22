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
	
	// 주문내역 추가
	public void insertOrderHistory(OrderHistoryBean bean) {
		try {
			conn = pool.getConnection();
			sql = "insert into orderhistory(oh_status, mb_num, oh_date, oh_io, oh_comment, oh_point, oh_total) "
					+ "values(?, ?, now(), ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bean.getOh_status());
			pstmt.setInt(2, bean.getMb_num());
			pstmt.setString(3, bean.getOh_io());
			pstmt.setString(4, bean.getOh_comment());
			pstmt.setInt(5, bean.getOh_point());
			pstmt.setInt(6, bean.getOh_total());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt);
		}
	}
	
	// 주문 추가
	public void insertOrders(OrdersBean bean) {
		try {
			conn = pool.getConnection();
			sql = "insert into orders(oh_num, or_basket, prod_num, or_size, or_count, or_shot, or_whip, or_hi) "
					+ "values(?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bean.getOh_num());
			pstmt.setInt(2, bean.getOr_basket());
			pstmt.setInt(3, bean.getProd_num());
			pstmt.setString(4, bean.getOr_size());
			pstmt.setInt(5, bean.getOr_count());
			pstmt.setInt(6, bean.getOr_shot());
			pstmt.setBoolean(7, bean.isOr_whip());
			pstmt.setString(8, bean.getOr_hi());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt);
		}
	}
	
	// 주문 내역 가져오기
	public Vector<OrderHistoryBean> getOrderHistoryList() {
		Vector<OrderHistoryBean> v = new Vector<OrderHistoryBean>();
		
		try {
			conn = pool.getConnection();
			sql = "select * from orderhistory";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				OrderHistoryBean bean = new OrderHistoryBean();
				bean.setOh_num(rs.getInt("oh_num"));
				bean.setOh_status(rs.getInt("oh_status"));
				bean.setMb_num(rs.getInt("mb_num"));
				bean.setOh_date(rs.getString("oh_date"));
				bean.setOh_io(rs.getString("oh_io"));
				bean.setOh_comment(rs.getString("oh_comment"));
				bean.setOh_point(rs.getInt("oh_point"));
				bean.setOh_total(rs.getInt("oh_total"));
				v.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}

		return v;
	}
	
	
	// 주문 가져오기
	public Vector<OrdersBean> getOrdersList(int oh_num) {
		Vector<OrdersBean> v = new Vector<OrdersBean>();
		
		try {
			conn = pool.getConnection();
			sql = "select * from orders where oh_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, oh_num);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				OrdersBean bean = new OrdersBean();
				bean.setOh_num(rs.getInt("oh_num"));
				bean.setOr_basket(rs.getInt("or_basket"));
				bean.setProd_num(rs.getInt("prod_num"));
				bean.setOr_size(rs.getString("or_size"));
				bean.setOr_count(rs.getInt("or_count"));
				bean.setOr_shot(rs.getInt("or_shot"));
				bean.setOr_whip(rs.getBoolean("or_whip"));
				bean.setOr_hi(rs.getString("or_hi"));
				v.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}
		
		return v;
	}
	
	// 최근 주문번호 가져오기
	public int getRecentOrderNum() {
		int num = 0;
		
		try {
			conn = pool.getConnection();
			sql = "select oh_num from orderhistory order by oh_num desc limit 1";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) { num = rs.getInt("oh_num"); }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}

		return num;
	}
}
