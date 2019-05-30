package kiosk;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class MemberMgr {
	private DBConnectionMgr pool = null;

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";

	public MemberMgr() {
		pool = DBConnectionMgr.getInstance();
	}

	public boolean signMember(MemberBean bean) {
		boolean flag=false;
		try {
			conn = pool.getConnection();
			sql = "insert Member(mb_num,mb_phone,mb_name,mb_pwd,mb_point)"+"values(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bean.getMb_num());
			pstmt.setString(2, bean.getMb_phone());
			pstmt.setString(3, bean.getMb_name());
			pstmt.setInt(4, bean.getMb_pwd());
			pstmt.setInt(5, bean.getMb_point());
			if (pstmt.executeUpdate() == 1) { flag = true; }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}	
		return flag;
	}

	public MemberBean getMember(int mb_num) {
		MemberBean bean =new MemberBean();
		try {
			conn=pool.getConnection();
			sql="select * from Member where mb_num = ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, mb_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setMb_num(rs.getInt("mb_num"));
				bean.setMb_phone(rs.getString("mb_phone"));
				bean.setMb_name(rs.getString("mb_name"));
				bean.setMb_point(rs.getInt("mb_point"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}
		return bean;
	}
	
	public int loginMember(String mb_phone, int mb_pwd) {
		int mb_num = 0;
		try {
			conn = pool.getConnection();
			sql="select mb_num from Member where mb_phone = ? and mb_pwd = ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mb_phone);
			pstmt.setInt(2, mb_pwd);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				mb_num = rs.getInt(1);		
			};
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}
		return mb_num;
	}
	
	public int getPoint(int mb_num) {
		int mb_point = 0;
		try {
			conn = pool.getConnection();
			sql = "select mb_point from Member where mb_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mb_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				mb_point = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}
		return mb_point;
	}
	
	public void updatePoint(int mb_num, int mb_point) {
		try {
			conn = pool.getConnection();
			sql = "update member set mb_point = mb_point + ? where mb_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mb_point);
			pstmt.setInt(2, mb_num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt);
		}
	}
	
	
	/* orderHistory.jsp 주문내역 페이지 */
	// 주문내역 총 갯수
	public int getTotalCount(int mb_num) {
		int totCnt = 0;
		
		try {
			conn = pool.getConnection();
			sql = "select count(*) from orderhistory where mb_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mb_num);
			rs = pstmt.executeQuery();
			
			if (rs.next()) { totCnt = rs.getInt(1); }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}

		return totCnt;
	}
	
	public Vector<OrderHistoryBean> getMemberOrderHistory(int mb_num, int start, int end) {
		Vector<OrderHistoryBean> ohlist = new Vector<OrderHistoryBean>();
		
		try {
			conn = pool.getConnection();
			sql = "SELECT * FROM orderhistory WHERE mb_num = ? order by oh_date desc limit ?, ?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mb_num);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				OrderHistoryBean ohbean = new OrderHistoryBean();
				ohbean.setOh_tnum(rs.getInt("oh_tnum"));
				ohbean.setOh_num(rs.getInt("oh_num"));
				ohbean.setOh_status(rs.getInt("oh_status"));
				ohbean.setMb_num(rs.getInt("mb_num"));
				ohbean.setOh_date(rs.getString("oh_date"));
				ohbean.setOh_io(rs.getString("oh_io"));
				ohbean.setOh_comment(rs.getString("oh_comment"));
				ohbean.setOh_point(rs.getInt("oh_point"));
				ohbean.setOh_total(rs.getInt("oh_total"));
				ohlist.addElement(ohbean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}

		return ohlist;
	}
}

