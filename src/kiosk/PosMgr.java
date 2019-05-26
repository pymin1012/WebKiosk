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
	
	// 특정 주문 가져오기
	public OrderHistoryBean getOrderHistory(int oh_num) {
		OrderHistoryBean ohbean = new OrderHistoryBean();
		
		try {
			conn = pool.getConnection();
			sql = "select * from orderhistory where oh_num = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, oh_num);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				ohbean.setOh_num(rs.getInt("oh_num"));
				ohbean.setOh_status(rs.getInt("oh_status"));
				ohbean.setMb_num(rs.getInt("mb_num"));
				ohbean.setOh_date(rs.getString("oh_date"));
				ohbean.setOh_io(rs.getString("oh_io"));
				ohbean.setOh_comment(rs.getString("oh_comment"));
				ohbean.setOh_point(rs.getInt("oh_point"));
				ohbean.setOh_total(rs.getInt("oh_total"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}
		
		return ohbean;
	}
	
	//주문내역 상태 0 (주문,주문확인,준비완료) 가져오기
	public Vector<OrderHistoryBean> getZeroOrderHistoryList() {
		Vector<OrderHistoryBean> ohlist = new Vector<OrderHistoryBean>();
		
		try {
			conn = pool.getConnection();
			sql = "select * from orderhistory where oh_status = 0";
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
	
	//주문내역 상태 1  (주문,주문확인,준비완료) 가져오기
	public Vector<OrderHistoryBean> getOneOrderHistoryList() {
		Vector<OrderHistoryBean> ohlist = new Vector<OrderHistoryBean>();
		
		try {
			conn = pool.getConnection();
			sql = "select * from orderhistory where oh_status = 1 ";
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
	
	//주문내역 상태 2  (주문,주문확인,준비완료) 가져오기
	public Vector<OrderHistoryBean> getTwoOrderHistoryList() {
		Vector<OrderHistoryBean> ohlist = new Vector<OrderHistoryBean>();
		
		try {
			conn = pool.getConnection();
			sql = "select * from orderhistory where oh_status = 2";
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
	
	// 주문 취소
	public void cancleOrder(int oh_num) {
		try {
			conn = pool.getConnection();
			sql = "update OrderHistory set oh_status = 4 where oh_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, oh_num);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt);
		}
	}
	
	// 주문 확인
	public void checkOrder(int oh_num) {
		try {
			conn = pool.getConnection();
			sql = "update OrderHistory set oh_status = 1 where oh_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, oh_num);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt);
		}
	}
	
	// 상품 준비 완료
	public void readyOrder(int oh_num) {
		try {
			conn = pool.getConnection();
			sql = "update OrderHistory set oh_status = 2 where oh_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, oh_num);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt);
		}
	}
	
	// 상품 수령 완료
	public void receiveOrder(int oh_num) {
		try {
			conn = pool.getConnection();
			sql = "update OrderHistory set oh_status = 3 where oh_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, oh_num);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt);
		}
	}
	
	//샷 
	public Vector<OrdersBean> getShotOrdersList() {
		Vector<OrdersBean> vs = new Vector<OrdersBean>();
		try {
			conn = pool.getConnection();
			sql = "select sum(or_shot) from orders ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				OrdersBean bean = new OrdersBean();
				bean.setOh_num(rs.getInt("oh_num"));
				bean.setOr_basket(rs.getInt("or_basket"));
				bean.setProd_num(rs.getInt("prod_num"));
				bean.setOr_size(rs.getString("oh_size"));
				bean.setOr_count(rs.getInt("or_count"));
				bean.setOr_shot(rs.getInt("or_shot"));
				bean.setOr_whip(rs.getBoolean("or_whip"));
				bean.setOr_hi(rs.getString("oh_hi"));
				vs.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}

		return vs;
	}

	//주문  G size 가져오기
	public Vector<OrdersBean> getGsizeOrdersList() {
		Vector<OrdersBean> orlist = new Vector<OrdersBean>();

		try {
			conn = pool.getConnection();
			sql = "select * from orders where or_size = 'G' ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				OrdersBean bean = new OrdersBean();
				bean.setOh_num(rs.getInt("oh_num"));
				bean.setOr_basket(rs.getInt("or_basket"));
				bean.setProd_num(rs.getInt("prod_num"));
				bean.setOr_size(rs.getString("oh_size"));
				bean.setOr_count(rs.getInt("or_count"));
				bean.setOr_shot(rs.getInt("or_shot"));
				bean.setOr_whip(rs.getBoolean("or_whip"));
				bean.setOr_hi(rs.getString("oh_hi"));
				orlist.addElement(bean);			
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}

		return orlist;
	}

	//주문  V size 가져오기
	public Vector<OrdersBean> getVsizeOrdersList() {
		Vector<OrdersBean> orlist = new Vector<OrdersBean>();

		try {
			conn = pool.getConnection();
			sql = "select * from orders where or_size = 'V' ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				OrdersBean bean = new OrdersBean();
				bean.setOh_num(rs.getInt("oh_num"));
				bean.setOr_basket(rs.getInt("or_basket"));
				bean.setProd_num(rs.getInt("prod_num"));
				bean.setOr_size(rs.getString("oh_size"));
				bean.setOr_count(rs.getInt("or_count"));
				bean.setOr_shot(rs.getInt("or_shot"));
				bean.setOr_whip(rs.getBoolean("or_whip"));
				bean.setOr_hi(rs.getString("oh_hi"));
				orlist.addElement(bean);			
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}

		return orlist;
	}

	//주문내역 사용된 point가져오기
	public Vector<OrderHistoryBean> getPointOrderHistoryList() {
		Vector<OrderHistoryBean> ohplist = new Vector<OrderHistoryBean>();

		try {
			conn = pool.getConnection();
			sql = "select sum(oh_point) from orderhistory";
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
				ohplist.addElement(bean);


			}


		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}

		return ohplist;
	}

	//총계
	public Vector<OrderHistoryBean> getTotalOrderHistoryList() {
		Vector<OrderHistoryBean> ohtlist = new Vector<OrderHistoryBean>();

		try {
			conn = pool.getConnection();
			sql = "select sum(oh_total) AS oh_total from orderhistory";
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
				ohtlist.addElement(bean);


			}


		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}

		return ohtlist;
	}

	//주문번호 가져오기(oh_num)
	public Vector<OrdersBean> getOhNum() {
		Vector<OrdersBean> onlist = new Vector<OrdersBean>();

		try {
			conn = pool.getConnection();
			sql ="select * from orders";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while(rs.next()) {
				OrdersBean bean = new OrdersBean();
				bean.setOh_num(rs.getInt("oh_num"));
				bean.setOr_shot(rs.getInt("or_shot"));

				onlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}

		return onlist;
	}
}
