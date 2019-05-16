package kiosk;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class OrdersMgr {
	private DBConnectionMgr pool;
	
	public OrdersMgr() {
		pool=DBConnectionMgr.getInstance();
	}
	//Order Insert
		public void insertOrder(OrdersBean order) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			try {
				con = pool.getConnection();
				sql = "insert Orders(oh_num,or_basket,prod_num,or_size,or_count,or_shot,or_whip,or_hi) values(?,?,?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, order.getOh_num());
				pstmt.setInt(2, order.getOr_basket());
				pstmt.setInt(3, order.getProd_num());
				pstmt.setString(4, order.getOr_size());
				pstmt.setInt(5, order.getOr_count());
				pstmt.setInt(6, order.getOr_shot());
				pstmt.setBoolean(7, order.isOr_whip());
				pstmt.setString(8, order.getOr_hi());	
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
			return;

		}
	
	
	//Order List
	public Vector<OrdersBean> getOrders(int oh_num){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<OrdersBean> vlist =new Vector<>();
		try {
			con = pool.getConnection();
			sql = "select * from Order where oh_num = ?" + "order by no desc";
			pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, oh_num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				OrdersBean order =new OrdersBean();
				order.setOh_num(rs.getInt("oh_num"));//주문번호
				order.setOr_basket(rs.getInt("or_basket"));
				order.setProd_num(rs.getInt("prod_num"));
				order.setOr_size(rs.getString("Or_size"));
				order.setOr_count(rs.getInt("or_count"));
				order.setOr_shot(rs.getInt("or_shot"));
				order.setOr_whip(rs.getBoolean("or_whip"));
				order.setOr_hi(rs.getString("or_hi"));
				vlist.addElement(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;

	}
	
	
	////Admin Mode//////
}
