package controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
		String sql = "INSERT INTO qna(cseq, send_id, "+
		"rcvd_id, chat_content, chat_time)";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, qna.getSend_id());
			pstmt.setString(2, qna.getRcvd_id());
			pstmt.setString(3, qna.getChat_content());
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	//selectByMember (search by member id)
	//listAll * from * 
	//listMsgs where userid (session) timestamp desc 
	//public ArrayList<QnaVO> msgsList()
}
