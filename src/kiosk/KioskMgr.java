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
	
	// �ֹ����� �߰�
	public void insertOrderHistory(OrderHistoryBean bean) {
		try {
			conn = pool.getConnection();
			sql = "insert into ordernum(num) values (default);";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			
			sql = "select num from ordernum order by num desc limit 1";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			
			sql = "insert into orderhistory(oh_num, oh_status, mb_num, oh_date, oh_io, oh_comment, oh_point, oh_total) "
					+ "values(?, ?, ?, now(), ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rs.getInt(1));
			pstmt.setInt(2, bean.getOh_status());
			pstmt.setInt(3, bean.getMb_num());
			pstmt.setString(4, bean.getOh_io());
			pstmt.setString(5, bean.getOh_comment());
			pstmt.setInt(6, bean.getOh_point());
			pstmt.setInt(7, bean.getOh_total());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}
	}
	
	// �ֹ� �߰�
	public void insertOrders(OrdersBean bean) {
		try {
			conn = pool.getConnection();
			sql = "insert into orders(oh_tnum, or_basket, prod_num, or_size, or_count, or_shot, or_whip, or_hi, or_event) "
					+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bean.getOh_tnum());
			pstmt.setInt(2, bean.getOr_basket());
			pstmt.setInt(3, bean.getProd_num());
			pstmt.setString(4, bean.getOr_size());
			pstmt.setInt(5, bean.getOr_count());
			pstmt.setInt(6, bean.getOr_shot());
			pstmt.setBoolean(7, bean.isOr_whip());
			pstmt.setString(8, bean.getOr_hi());
			pstmt.setInt(9, bean.getOr_event());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt);
		}
	}
	
	// �ֹ� ���� ��������
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
	
	
	// �ֹ� ��������
	public Vector<OrdersBean> getOrdersList(int oh_tnum) {
		Vector<OrdersBean> v = new Vector<OrdersBean>();
		
		try {
			conn = pool.getConnection();
			sql = "select * from orders where oh_tnum = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, oh_tnum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				OrdersBean bean = new OrdersBean();
				bean.setOh_tnum(rs.getInt("oh_tnum"));
				bean.setOr_basket(rs.getInt("or_basket"));
				bean.setProd_num(rs.getInt("prod_num"));
				bean.setOr_size(rs.getString("or_size"));
				bean.setOr_count(rs.getInt("or_count"));
				bean.setOr_shot(rs.getInt("or_shot"));
				bean.setOr_whip(rs.getBoolean("or_whip"));
				bean.setOr_hi(rs.getString("or_hi"));
				bean.setOr_event(rs.getInt("or_event"));
				v.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}
		
		return v;
	}
	
	// �ֱ� ��ü �ֹ���ȣ ��������
	public int getRecentOrderTotalNum() {
		int num = 0;
		
		try {
			conn = pool.getConnection();
			sql = "select oh_tnum from orderhistory order by oh_tnum desc limit 1";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) { num = rs.getInt("oh_tnum"); }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}

		return num;
	}
	
	// �ֹ���ȣ ��������
	public int  getRecentOrderNum(int oh_tnum) {
		int num = 0;
		
		try {
			conn = pool.getConnection();
			sql = "select oh_num from orderhistory where oh_tnum = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, oh_tnum);
			
			rs = pstmt.executeQuery();
			if (rs.next()) { num = rs.getInt("oh_num"); }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}

		return num;
	}
	
	////////////////// �̺�Ʈ ��ǰ //////////////////////////////
}