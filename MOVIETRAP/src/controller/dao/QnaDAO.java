package controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.json.simple.JSONObject;

import controller.dto.QnaVO;
import util.DBManager;

public class QnaDAO {
	private QnaDAO() {}
	private static QnaDAO instance = new QnaDAO();
	public static QnaDAO getInstance() {
		return instance;
	}
	
	public void qnaWrite(QnaVO qna) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO qna(cseq, send_id, rcvd_id, chat_content) VALUES(qna_seq.nextval, ?, ?, ?)";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qna.getSend_id());
			pstmt.setString(2, qna.getRcvd_id());
			pstmt.setString(3, qna.getChat_content());
			pstmt.executeQuery();
			
		} catch(Exception e) {
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
		String sql = "SELECT * FROM qna WHERE send_id=? OR rcvd_id=? ";
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
				qna.setChat_time(rs.getTimestamp("chat_time"));
				qnaList.add(qna);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return qnaList;
	}
	
	public ArrayList<QnaVO> allQnaList() {
		ArrayList<QnaVO> qnaList = new ArrayList<QnaVO>();
		Connection conn= null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM qna";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				QnaVO qna = new QnaVO();
				qna.setCseq(rs.getInt("cseq"));
				qna.setRcvd_id(rs.getString("rcvd_id"));
				qna.setSend_id(rs.getString("send_id"));
				qna.setChat_content(rs.getString("chat_content"));
				qna.setChat_time(rs.getTimestamp("chat_time"));
				qnaList.add(qna);
					
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return qnaList;
	}
	
	//selectByMember (search by member id)
	//listAll * from * 
	//listMsgs where userid (session) timestamp desc 
	//public ArrayList<QnaVO> msgsList()
}
