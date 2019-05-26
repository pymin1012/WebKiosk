package kiosk;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class BoardMgr {
	private DBConnectionMgr pool = null;
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	
	public BoardMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	// 대기 주문번호 가져오기
	public Vector<Integer> getAwaitOrderNum() {
		Vector<Integer> v = new Vector<Integer>();
		
		try {
			conn = pool.getConnection();
			sql = "select oh_num from orderhistory where oh_status = 1 order by oh_num asc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int oh_num = rs.getInt("oh_num");
				v.addElement(oh_num);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}
		
		return v;
	}
	
	// 완료 주문번호 가져오기
	public Vector<Integer> getReadyOrderNum() {
		Vector<Integer> v = new Vector<Integer>();
		
		try {
			conn = pool.getConnection();
			sql = "select oh_num from orderhistory where oh_status = 2 order by oh_num asc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int oh_num = rs.getInt("oh_num");
				v.addElement(oh_num);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}
		
		return v;
	}
}
