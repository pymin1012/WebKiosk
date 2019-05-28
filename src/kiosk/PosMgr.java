package kiosk;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;
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
			sql = "select * from orderhistory where (oh_status = 3 or oh_status = 4) and date(oh_date) = date(now())";
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
			sql = "select * from orderhistory where oh_num = ?";
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
			sql = "select * from orderhistory where oh_status = 0 and date(oh_date) = date(now())";
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
			sql = "select * from orderhistory where oh_status = 1 and date(oh_date) = date(now())";
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
			sql = "select * from orderhistory where oh_status = 2 and date(oh_date) = date(now())";
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
	
	/////////////////////// dayCalculate.jsp 일별 정산 /////////////////////////
	//샷 
	public int getDayShot(String date) {
		int shot =0;
		try {
			conn = pool.getConnection();
			sql = "select sum(or_shot * or_count) from orders "
					+ "where oh_num in (select oh_num from orderhistory where oh_status = 3 and date(oh_date) = date(?));";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, date);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				shot=rs.getInt(1);
		
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}

		return shot;
	}

	//주문  G size 가져오기
	public int getDayGsize(String date) {
		int gsize =0 ;

		try {
			conn = pool.getConnection();
			sql = " select sum(or_count) from orders "
					+ "where or_size = 'G' and oh_num in (select oh_num from orderhistory where oh_status = 3 and date(oh_date) = date(?));";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, date);

			rs = pstmt.executeQuery();
			if(rs.next()) {
				gsize=rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}

		return gsize;
	}

	//주문  V size 가져오기
	public int getDayVsize(String date) {
		int vsize = 0 ;

		try {
			conn = pool.getConnection();
			sql = " select sum(or_count) from orders "
					+ "where or_size = 'V' and oh_num in (select oh_num from orderhistory where oh_status = 3 and date(oh_date) = date(?));";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, date);

			rs = pstmt.executeQuery();
			if(rs.next()) {
				vsize=rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}

		return vsize;
	}

	//주문내역 사용된 point가져오기
	public int getDayPoint(String date) {
		int point = 0;
		try {
			conn = pool.getConnection();
			sql = "select sum(oh_point) from orderhistory where oh_status = 3 and date(oh_date) = date(?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, date);

			rs = pstmt.executeQuery();
			if(rs.next()) {
				point=rs.getInt(1);
			}


		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}

		return point;
	}

	//총계
	public int getDayTotal(String date) {
		int total =0 ;

		try {
			conn = pool.getConnection();
			sql = "select sum(oh_total) from orderhistory where oh_status = 3 and date(oh_date) = date(?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, date);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				total=rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}
		return total;
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
	
	//제품별 수량 합계
	public int getProductStatistics(int prod_num, String date) {
		int totalCount = 0;
			
		try {
			conn = pool.getConnection();
			sql ="select sum(or_count) from orders\r\n" + 
					"where prod_num = ? and oh_num in (select oh_num from orderhistory where oh_status = 3 and date(oh_date) = date(?));";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, prod_num);
			pstmt.setString(2, date);
				
			rs = pstmt.executeQuery();
				
			if (rs.next()) {
				totalCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}
			
		return totalCount;
	}
		
	/////////////////////// monCalculate.jsp 월별 정산 /////////////////////////
	//
	public int getMonTotal(String date) {
		int total = 0;
		
		try {
			conn = pool.getConnection();
			sql = "select sum(oh_total) from orderhistory where oh_status = 3 and DATE_FORMAT(oh_date, '%Y-%m') = ?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, date);
			
			rs = pstmt.executeQuery();
			if (rs.next()) total = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}

		return total;
	}
	
	public int getMonPoint(String date) {
		int point = 0;
		
		try {
			conn = pool.getConnection();
			sql = "select sum(oh_point) from orderhistory where oh_status = 3 and DATE_FORMAT(oh_date, '%Y-%m') = ?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, date);
			
			rs = pstmt.executeQuery();
			if (rs.next()) point = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}

		return point;
	}
}
