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
	
	// �ֹ� ���� ��������
	public Vector<OrderHistoryBean> getPreOrderHistoryList() {
		Vector<OrderHistoryBean> vl = new Vector<OrderHistoryBean>();
		
		try {
			conn = pool.getConnection();
			sql = "select * from orderhistory where (oh_status = 3 or oh_status = 4) and date(oh_date) = date(now())";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				OrderHistoryBean bean = new OrderHistoryBean();
				bean.setOh_tnum(rs.getInt("oh_tnum"));
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
	
	// Ư�� �ֹ� ��������
	public OrderHistoryBean getOrderHistory(int oh_tnum) {
		OrderHistoryBean ohbean = new OrderHistoryBean();
		
		try {
			conn = pool.getConnection();
			sql = "select * from orderhistory where oh_tnum = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, oh_tnum);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				ohbean.setOh_tnum(rs.getInt("oh_tnum"));
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
	
	//�ֹ����� ���� 0 (�ֹ�,�ֹ�Ȯ��,�غ�Ϸ�) ��������
	public Vector<OrderHistoryBean> getZeroOrderHistoryList() {
		Vector<OrderHistoryBean> ohlist = new Vector<OrderHistoryBean>();
		
		try {
			conn = pool.getConnection();
			sql = "select * from orderhistory where oh_status = 0 and date(oh_date) = date(now())";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				OrderHistoryBean bean = new OrderHistoryBean();
				bean.setOh_tnum(rs.getInt("oh_tnum"));
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
	
	//�ֹ����� ���� 1  (�ֹ�,�ֹ�Ȯ��,�غ�Ϸ�) ��������
	public Vector<OrderHistoryBean> getOneOrderHistoryList() {
		Vector<OrderHistoryBean> ohlist = new Vector<OrderHistoryBean>();
		
		try {
			conn = pool.getConnection();
			sql = "select * from orderhistory where oh_status = 1 and date(oh_date) = date(now())";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				OrderHistoryBean bean = new OrderHistoryBean();
				bean.setOh_tnum(rs.getInt("oh_tnum"));
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
	
	//�ֹ����� ���� 2  (�ֹ�,�ֹ�Ȯ��,�غ�Ϸ�) ��������
	public Vector<OrderHistoryBean> getTwoOrderHistoryList() {
		Vector<OrderHistoryBean> ohlist = new Vector<OrderHistoryBean>();
		
		try {
			conn = pool.getConnection();
			sql = "select * from orderhistory where oh_status = 2 and date(oh_date) = date(now())";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				OrderHistoryBean bean = new OrderHistoryBean();
				bean.setOh_tnum(rs.getInt("oh_tnum"));
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
	
	// �ֹ� ���
	public void cancleOrder(int oh_tnum) {
		try {
			conn = pool.getConnection();
			sql = "update OrderHistory set oh_status = 4 where oh_tnum = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, oh_tnum);
			
			pstmt.executeUpdate();
			
			// ����Ʈ ��ȯ
			sql = "select mb_num, oh_point from orderhistory where oh_tnum = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, oh_tnum);
			rs = pstmt.executeQuery();
			rs.next();
			int oh_point = rs.getInt("oh_point");
			int mb_num = rs.getInt("mb_num");
						
			sql = "update member set mb_point = mb_point + ? where mb_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, oh_point);
			pstmt.setInt(2, mb_num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt);
		}
	}
	
	// �ֹ� Ȯ��
	public void checkOrder(int oh_tnum) {
		try {
			conn = pool.getConnection();
			sql = "update OrderHistory set oh_status = 1 where oh_tnum = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, oh_tnum);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt);
		}
	}
	
	// ��ǰ �غ� �Ϸ�
	public void readyOrder(int oh_tnum) {
		try {
			conn = pool.getConnection();
			sql = "update OrderHistory set oh_status = 2 where oh_tnum = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, oh_tnum);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt);
		}
	}
	
	// ��ǰ ���� �Ϸ�
	public void receiveOrder(int oh_tnum) {
		try {
			conn = pool.getConnection();
			sql = "update OrderHistory set oh_status = 3 where oh_tnum = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, oh_tnum);
			
			pstmt.executeUpdate();
			
			// ����Ʈ �ױ�
			sql = "select mb_num, oh_total from orderhistory where oh_tnum = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, oh_tnum);
			rs = pstmt.executeQuery();
			rs.next();
        	int oh_total = rs.getInt("oh_total");
        	int mb_num = rs.getInt("mb_num");
			
			sql = "update member set mb_point = mb_point + ? where mb_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (int)(oh_total * 0.05));
			pstmt.setInt(2, mb_num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}
	}
	
	/////////////////////// dayCalculate.jsp �Ϻ� ���� /////////////////////////
	//�� 
	public int getDayShot(String date) {
		int shot =0;
		try {
			conn = pool.getConnection();
			sql = "select sum(or_shot * or_count) from orders "
					+ "where oh_tnum in (select oh_tnum from orderhistory where oh_status = 3 and date(oh_date) = date(?));";
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

	//�ֹ�  G size ��������
	public int getDayGsize(String date) {
		int gsize =0 ;

		try {
			conn = pool.getConnection();
			sql = " select sum(or_count) from orders "
					+ "where or_size = 'G' and oh_tnum in (select oh_tnum from orderhistory where oh_status = 3 and date(oh_date) = date(?));";
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

	//�ֹ�  V size ��������
	public int getDayVsize(String date) {
		int vsize = 0 ;

		try {
			conn = pool.getConnection();
			sql = " select sum(or_count) from orders "
					+ "where or_size = 'V' and oh_tnum in (select oh_tnum from orderhistory where oh_status = 3 and date(oh_date) = date(?));";
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

	//�ֹ����� ���� point��������
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

	//�Ѱ�
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
	
	//��ǰ�� ���� �հ�
	public int getProductStatistics(int prod_num, String date) {
		int totalCount = 0;
			
		try {
			conn = pool.getConnection();
			sql ="select sum(or_count) from orders\r\n" + 
					"where prod_num = ? and oh_tnum in (select oh_tnum from orderhistory where oh_status = 3 and date(oh_date) = date(?));";
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
		
	/////////////////////// monCalculate.jsp ���� ���� /////////////////////////
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
	
	// ����
	public void closeCaffe() {
		try {
			conn = pool.getConnection();
			sql = "truncate ordernum;";
			pstmt = conn.prepareStatement(sql);

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt);
		}
	}
	
	// ����� �̺�Ʈ Ȯ��
	// �̺�Ʈ ��ǰ���� Ȯ��
	public boolean isDayEventProduct(int prod_num, String date) {
		boolean flag = false;
		
		try {
			conn = pool.getConnection();
			sql = "select * from evento where prod_num = ? and ? >= ev_start AND ? <= ev_end";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, prod_num);
			pstmt.setString(2, date);
			pstmt.setString(3, date);
			
			rs = pstmt.executeQuery();
			if (rs.next()) { flag = true; }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}
		
		return flag;
	}
	
	// ��ǰ�� �̺�Ʈ ���� �հ�
	public int getProductTotalEvent(int prod_num, String date) {
		int totalEvent = 0;
			
		try {
			conn = pool.getConnection();
			sql ="select sum(or_event) from orders\r\n" + 
					"where prod_num = ? and oh_tnum in (select oh_tnum from orderhistory where oh_status = 3 and date(oh_date) = date(?));";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, prod_num);
			pstmt.setString(2, date);
				
			rs = pstmt.executeQuery();
				
			if (rs.next()) {
				totalEvent = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}
			
		return totalEvent;
	}
	
	// �̺�Ʈ ��ǰ ���� ��������
	public int getEventDayProductPrice(int prod_num, String date) {
		int ev_price = 0;
		
		try {
			conn = pool.getConnection();
			sql = "SELECT ev_price FROM evento WHERE prod_num = ? AND ? >= ev_start AND ? <= ev_end;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, prod_num);
			pstmt.setString(2, date);
			pstmt.setString(3, date);
			
			rs = pstmt.executeQuery();
			if(rs.next()) { ev_price = rs.getInt(1); }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}

		return ev_price;
	}
	
	//  ���� ����� �̺�Ʈ ���� �ѱݾ�
	public int getMonEvent(String date) {
		int event = 0;
		
		try {
			conn = pool.getConnection();
			sql = "SELECT SUM(or_event) FROM orders " + 
					"WHERE oh_tnum IN (SELECT oh_tnum from orderhistory where oh_status = 3 and DATE_FORMAT(oh_date, '%Y-%m') = ?);";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, date);
			
			rs = pstmt.executeQuery();
			if (rs.next()) event = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}

		return event;
	}
	
	// �ֹ����� ���� event ��������
	public int getDayEvent(String date) {
		int event = 0;
		try {
			conn = pool.getConnection();
			sql = "SELECT SUM(or_event) FROM orders " + 
					"WHERE oh_tnum IN (SELECT oh_tnum from orderhistory where oh_status = 3 and date(oh_date) = date(?));";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, date);

			rs = pstmt.executeQuery();
			if (rs.next()) { event = rs.getInt(1); }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}

		return event;
	}
}
