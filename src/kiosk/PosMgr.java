package kiosk;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class PosMgr {
	private DBConnectionMgr pool = null;
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	
	public PosMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	// 주문 내역 가져오기
	public Vector<OrderHistoryBean> getPreOrderHistoryList() {
		Vector<OrderHistoryBean> vl = new Vector<OrderHistoryBean>();
		
		try {
			conn = pool.getConnection();
			sql = "select * from orderhistory where oh_status = 3 or oh_status = 4 ";
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
				vl.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}

		return vl;
	}
	//주문내역 상태 0 1 2 (주문,주문확인,준비완료) 가져오기
	public Vector<OrderHistoryBean> getReadyOrderHistoryList() {
		Vector<OrderHistoryBean> ohlist = new Vector<OrderHistoryBean>();
		
		try {
			conn = pool.getConnection();
			sql = "select * from orderhistory where oh_status = 0 or oh_status = 1 or oh_status = 2";
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
				ohlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}

		return ohlist;
	}
}
