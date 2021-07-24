package controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import controller.dto.ChatVO;
import controller.dto.MemberVO;
import controller.dto.QnaVO;
import util.DBManager;

public class QnaDAO {
	private QnaDAO() {
	}

	private static QnaDAO instance = new QnaDAO();

	public static QnaDAO getInstance() {
		return instance;
	}

	public int checkChat(String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cseq = 0;

		String sql = "SELECT cseq FROM chat WHERE id= ? ";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				cseq = rs.getInt("cseq");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return cseq;
	}

	public void insertChat(String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO chat (cseq,id) VALUES(chat_seq.nextval, ?)";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, email);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	public void qnaWrite(QnaVO qna) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO qna(qseq, cseq, send_id, rcvd_id, chat_content) VALUES(qna_seq.nextval, ?, ?, ?, ?)";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qna.getCseq());
			pstmt.setString(2, qna.getSend_id());
			pstmt.setString(3, qna.getRcvd_id());
			pstmt.setString(4, qna.getChat_content());
			pstmt.executeQuery();
			System.out.println("qnaWrite // cseq : " + qna.getCseq());

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	public ArrayList<QnaVO> qnaList(String email) {
		ArrayList<QnaVO> qnaList = new ArrayList<QnaVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM qna WHERE send_id=? OR rcvd_id=? ORDER BY qseq ASC";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, email);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				QnaVO qna = new QnaVO();
				qna.setCseq(rs.getInt("cseq"));
				qna.setRcvd_id(rs.getString("rcvd_id"));
				qna.setSend_id(rs.getString("send_id"));
				qna.setChat_content(rs.getString("chat_content"));
				qna.setRegdate(rs.getString("regdate"));
				qnaList.add(qna);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return qnaList;
	}

	public ArrayList<QnaVO> allQnaList() {
		ArrayList<QnaVO> qnaList = new ArrayList<QnaVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM qna ORDER BY cseq";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				QnaVO qna = new QnaVO();
				qna.setCseq(rs.getInt("cseq"));
				qna.setRcvd_id(rs.getString("rcvd_id"));
				qna.setSend_id(rs.getString("send_id"));
				qna.setChat_content(rs.getString("chat_content"));
				qna.setRegdate(rs.getString("regdate"));
				qnaList.add(qna);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return qnaList;
	}

	// Admin : 모든 채팅 목록을 불러오는 메소드
	public ArrayList<ChatVO> listChat() {
		ArrayList<ChatVO> chatList = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM chat ORDER BY regdate";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ChatVO chat = new ChatVO();

				chat.setCseq(rs.getInt("cseq"));
				chat.setId(rs.getString("id"));
				chat.setRegdate(rs.getString("regdate"));

				chatList.add(chat);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}

		return chatList;
	}

	public ArrayList<QnaVO> qnaGet(int cseq) {
		ArrayList<QnaVO> qnaList = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM qna WHERE cseq=?";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cseq);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				QnaVO qna = new QnaVO();

				qna.setQseq(rs.getInt("qseq"));
				qna.setCseq(rs.getInt("cseq"));
				qna.setSend_id(rs.getString("send_id"));
				qna.setRcvd_id(rs.getString("rcvd_id"));
				qna.setChat_content(rs.getString("chat_content"));
				qna.setRegdate(rs.getString("regdate"));

				qnaList.add(qna);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}

		return qnaList;
	}
	public ChatVO getChat(int cseq) {
		ChatVO chat = new ChatVO();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM chat WHERE cseq= ?";
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cseq);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				chat.setCseq(rs.getInt("cseq"));
				chat.setId(rs.getString("id"));
				chat.setRegdate(rs.getString("regdate"));				
			}		
			
		} catch(Exception e){
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return chat;
	}

	// selectByMember (search by member id)
	// listAll * from *
	// listMsgs where userid (session) timestamp desc
	// public ArrayList<QnaVO> msgsList()

}