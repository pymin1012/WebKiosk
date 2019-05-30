package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import admin.DBConnectionMgr;
import kiosk.EventoBean;

public class EventoMgr {
	
private DBConnectionMgr pool;
	
	public EventoMgr() {
		pool = DBConnectionMgr.getInstance();
	}

	//이벤트 목록 불러오기
	public Vector<EventoBean> getEventoList() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<EventoBean> elist = new Vector<>();
		try {
			con = pool.getConnection();
			sql = "select * from evento where date(ev_end) >= date(now()) ";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				EventoBean ebean = new EventoBean();
				ebean.setEv_num(rs.getInt("ev_num"));
				ebean.setEv_name(rs.getString("ev_name"));
				ebean.setEv_start(rs.getString("ev_start"));
				ebean.setEv_end(rs.getString("ev_end"));
				ebean.setProd_num(rs.getInt("prod_num"));
				ebean.setEv_price(rs.getInt("ev_price"));
				elist.addElement(ebean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return elist;
	}
	
	
	//이벤트 목록 불러오기
	public EventoBean getEvento(int ev_num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		EventoBean ebean = new EventoBean();
		try {
			con = pool.getConnection();
			sql = "select * from Evento where ev_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ev_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ebean.setEv_num(rs.getInt("ev_num"));
				ebean.setEv_name(rs.getString("ev_name"));
				ebean.setEv_start(rs.getString("ev_start"));
				ebean.setEv_end(rs.getString("ev_end"));
				ebean.setProd_num(rs.getInt("prod_num"));
				ebean.setEv_price(rs.getInt("ev_price"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return ebean;
	}
	
	//만료된 이벤트 목록 불러오기
	public Vector<EventoBean> getEndeventoList() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<EventoBean> elist = new Vector<>();
		try {
			con = pool.getConnection();
			sql = "select * from evento where date(ev_end) < date(now()) ";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				EventoBean ebean = new EventoBean();
				ebean.setEv_num(rs.getInt("ev_num"));
				ebean.setEv_name(rs.getString("ev_name"));
				ebean.setEv_start(rs.getString("ev_start"));
				ebean.setEv_end(rs.getString("ev_end"));
				ebean.setProd_num(rs.getInt("prod_num"));
				ebean.setEv_price(rs.getInt("ev_price"));
				elist.addElement(ebean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return elist;
	}
	
	
	
	
	//이벤트 입력하기
	public boolean insertEvento(EventoBean ebean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert evento(ev_name, ev_start, ev_end, prod_num, ev_price) values(?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ebean.getEv_name());
			pstmt.setString(2, ebean.getEv_start());
			pstmt.setString(3, ebean.getEv_end());
			pstmt.setInt(4, ebean.getProd_num());
			pstmt.setInt(5, ebean.getEv_price());
			
			if(pstmt.executeUpdate()==1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	//이벤트 삭제하기
	public boolean deleteEvento(int ev_num) {
	Connection con = null;
	PreparedStatement pstmt = null;
	String sql = null;
	boolean flag = false;
	try {
		con = pool.getConnection();
		sql = "DELETE FROM evento WHERE ev_num=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, ev_num);
		if(pstmt.executeUpdate()==1)
			flag = true;
		pstmt.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		pool.freeConnection(con, pstmt);
	}
	return flag;
	
	}
	
	
	
	//이벤트 수정하기
	public boolean updateEvento(EventoBean ebean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag= false;
		try {
			con = pool.getConnection();
			sql = "update Evento set ev_name= ? , ev_start = ? , ev_end = ? , prod_num = ? , ev_price = ? where ev_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ebean.getEv_name());
			pstmt.setString(2, ebean.getEv_start());
			pstmt.setString(3, ebean.getEv_end());
			pstmt.setInt(4, ebean.getProd_num());
			pstmt.setInt(5, ebean.getEv_price());
			pstmt.setInt(6, ebean.getEv_num());
			
			if(pstmt.executeUpdate()==1) flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		
		return flag;
	}
	
	//이벤트 중복입력 방지
	public boolean overlapEvento(int prod_num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select * from evento where prod_num=? and date(ev_end) >= date(now()) ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, prod_num);
			rs = pstmt.executeQuery();
			
			if (rs.next()) { flag=true; }		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
}



