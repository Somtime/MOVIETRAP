package controller.dao;

import java.sql.*;

import controller.dto.MemberVO;
import util.DBManager;

public class MemberDAO {
	private static MemberDAO instance = new MemberDAO();
	
	private MemberDAO() {}
	
	public static MemberDAO getInstance() {
		return instance;
	}
	
	// 占쏙옙占싱듸옙 占쌩븝옙 확占쏙옙 占쌨소듸옙 1:占쌩븝옙 0:占쌩븝옙x
	public int idCheck(String userid) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT name FROM member WHERE email=?";
		
		try {
			con = DBManager.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
		
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = 1;
				System.out.println(rs.getString("name"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		
		return result;
	}
	//�솕�썝 媛��엯 
	public void insertMember(MemberVO memberVO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO member(email, pwd, name, phone, pay_name, "+
		" pay_num, pay_num_lstfour, pay_cvc) VALUES(?,?,?,?,?,?,?,?)";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberVO.getEmail());
			pstmt.setString(2, memberVO.getPwd());
			pstmt.setString(3, memberVO.getName());
			pstmt.setString(4,  memberVO.getPhone());
			pstmt.setString(5, memberVO.getPay_name());
			pstmt.setInt(6, memberVO.getPay_num());
			pstmt.setInt(7, memberVO.getPay_num_lstfour());
			pstmt.setInt(8, memberVO.getPay_cvc());
		} catch(Exception e) {
			e.printStackTrace();
		}
		DBManager.close(conn, pstmt);
	}
	//membership setting: update payment
	public void updateInfo(MemberVO memberVO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE member SET pwd=?, pay_name=?, pay_num=?, "+
		"pay_num_lstfour=?, pay_cvc=? WHERE email=?";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberVO.getPwd());
			pstmt.setString(2, memberVO.getPay_name());
			pstmt.setInt(3, memberVO.getPay_num());
			pstmt.setInt(4, memberVO.getPay_num_lstfour());
			pstmt.setInt(5, memberVO.getPay_cvc());			
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBManager.close(conn, pstmt);
	}
	//membership setting:  newsletter checkbox
	public void newsletterUpdate(MemberVO memberVO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE member SET newsletter=? WHERE email=?";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberVO.getnewsletter());
		} catch (Exception e) {
			e.printStackTrace();
			}
		DBManager.close(conn, pstmt);
}
}