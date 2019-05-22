package kiosk;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



public class MemberMgr {
	private DBConnectionMgr pool = null;

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";

	public MemberMgr() {
		pool=DBConnectionMgr.getInstance();
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
	
	public void updatePoint(int mb_point) {
		try {
			conn = pool.getConnection();
			sql = "update member set mb_point=mb_point + ? where mb_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mb_point);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt);
		}
	}
}


