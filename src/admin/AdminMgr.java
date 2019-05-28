package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import kiosk.MemberBean;

public class AdminMgr {

	private DBConnectionMgr pool;
	
	public AdminMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	//회원정보 가져오기
		public MemberBean getMember(int mb_num) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			MemberBean bean = new MemberBean();
			try {
				con = pool.getConnection();
				sql = "select * from Member where mb_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, mb_num);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					bean.setMb_num(rs.getInt("mb_num"));
					bean.setMb_phone(rs.getString("mb_phone"));
					bean.setMb_name(rs.getString("mb_name"));
					bean.setMb_pwd(rs.getInt("mb_pwd"));
					bean.setMb_point(rs.getInt("mb_point"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return bean;
		}
	
		//회원정보 수정
		public boolean updateMember(MemberBean bean) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			boolean flag = false;
			try {
				con = pool.getConnection();
				sql = "update Member set mb_phone=?, mb_name=?, mb_pwd=?, mb_point=? where mb_num=?";
						
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, bean.getMb_phone());
				pstmt.setString(2, bean.getMb_name());
				pstmt.setInt(3, bean.getMb_pwd());
				pstmt.setInt(4, bean.getMb_point());
				pstmt.setInt(5, bean.getMb_num());
				if(pstmt.executeUpdate()==1)
					flag = true;
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
			return flag;
		}	
		
	///admin mode/////////////
	public Vector<MemberBean> getMemberList() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<MemberBean> vlist = new Vector<>();
		try {
			con = pool.getConnection();
			sql = "select * from Member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberBean bean = new MemberBean();
				bean.setMb_num(rs.getInt("mb_num"));
				bean.setMb_phone(rs.getString("mb_phone"));
				bean.setMb_name(rs.getString("mb_name"));
				bean.setMb_pwd(rs.getInt("mb_pwd"));
				bean.setMb_point(rs.getInt("mb_point"));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	//Admin Login
	public boolean adminCheck(int mb_num, int mb_pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select * from member where mb_num = ? and mb_pwd = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mb_num);
			pstmt.setInt(2, mb_pwd);
			rs = pstmt.executeQuery();
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return flag;
	}
}

