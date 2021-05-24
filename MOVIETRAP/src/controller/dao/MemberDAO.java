package controller.dao;

import java.sql.*;
import java.util.ArrayList;

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
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT name FROM member WHERE email=?";
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
		
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = 1;
				System.out.println(rs.getString("name"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		
		return result;
	}
	//�솕�썝 媛��엯 
	public void insertMember(MemberVO member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO member(email, pwd, name, phone, pay_name, "+
		" pay_num, pay_num_lstfour, pay_cvc) VALUES(?,?,?,?,?,?,?,?)";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, member.getEmail());
			pstmt.setString(2, member.getPwd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4,  member.getPhone());
			pstmt.setString(5, member.getPay_name());
			pstmt.setInt(6, member.getPay_num());
			pstmt.setInt(7, member.getPay_num_lstfour());
			pstmt.setInt(8, member.getPay_cvc());
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		
	}
	//membership setting: update payment
	public void updatePayInfo(MemberVO member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE member SET pay_name=?, pay_num=?, "+
		"pay_num_lstfour=?, pay_cvc=?, pay_exp_date=?, pay_exp_yr=? WHERE email=?";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, member.getPay_name());
			pstmt.setInt(2, member.getPay_num());
			pstmt.setInt(3, member.getPay_num_lstfour());
			pstmt.setInt(4, member.getPay_cvc());	
			pstmt.setInt(5, member.getPay_exp_date());
			pstmt.setInt(6, member.getPay_exp_yr());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		
	}
	//membership setting: update info
	public void updateInfo(MemberVO member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE member SET pwd=?, phone=?, image=?, name=? WHERE email=?";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, member.getPwd());
			pstmt.setString(2, member.getPhone());
			pstmt.setString(3, member.getImage());
			pstmt.setString(4, member.getName());
			pstmt.setString(5, member.getEmail());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		
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
			pstmt.setString(2, memberVO.getEmail());
		} catch (Exception e) {
			e.printStackTrace();
			}
		DBManager.close(conn, pstmt);
	}
	
	// loginCheck
	public int loginCheck(String email, String pwd) {
		int check = 2;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT pwd FROM member WHERE email=?";
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString("pwd").equals(pwd)) {
					check = 1;
				} else {
					check = 0;
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		
		return check;
	}
	
	// 유저 정보
	public MemberVO memberInfo(String email) {
		MemberVO member = new MemberVO();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM member WHERE email=?";
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				member.setEmail(rs.getString("email"));
				member.setPwd(rs.getString("pwd"));
				member.setName(rs.getString("name"));
				member.setPhone(rs.getString("phone"));
				member.setImage(rs.getString("image"));
				member.setRegdate(rs.getTimestamp("regdate"));
				member.setnewsletter(rs.getString("newsletter"));
				member.setPay_name(rs.getString("pay_name"));
				member.setPay_num(rs.getInt("pay_num"));
				member.setPay_num_lstfour(rs.getInt("pay_num_lstfour"));
				member.setPay_cvc(rs.getInt("pay_cvc"));
				member.setPay_date(rs.getTimestamp("pay_date"));
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		
		return member;
	}
	
	// 모든 멤버의 email을 가져와서 List 생성
	public ArrayList<String> listMemberEmail() {
		ArrayList<String> emailList =  new ArrayList<String>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT email FROM member";
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				emailList.add(rs.getString("email"));
			}			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		
		return emailList;
	}
}