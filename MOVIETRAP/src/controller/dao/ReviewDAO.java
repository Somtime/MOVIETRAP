package controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import controller.dto.ReviewVO;
import util.DBManager;

public class ReviewDAO {
	private static ReviewDAO  instance = new ReviewDAO();
	
	private ReviewDAO() {}

	public static ReviewDAO getInstance() {
		return instance;
	}
	
public ArrayList<ReviewVO> getReviewList(String title,Timestamp pub_date){
	ArrayList<ReviewVO> reviewList = new ArrayList<>();
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "SELECT * FROM review WHERE title=? , pub_date =?";
	try {
		conn = DBManager.getConnection();
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, title);
		pstmt.setTimestamp(2, pub_date);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			ReviewVO review =  new ReviewVO();
			
			review.setRseq(rs.getInt("rseq"));
			review.setTitle(rs.getString("title"));
			review.setWriter(rs.getString("writer"));
			review.setScore(rs.getInt("score"));
			review.setDescription(rs.getString("description"));
			review.setRegdate(rs.getTimestamp("regdate"));
			review.setEdit_date(rs.getTimestamp("edit_date"));
			
			reviewList.add(review);
		}
		
	} catch(Exception e) {
		
	}finally {
		DBManager.close(conn, pstmt, rs);
		
	}
	return reviewList;
}

public void insertReview(ReviewVO review) {
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = "INSERT INTO review (rseq, title, pud_date, writer, score, description) VALUES (review_seq.nextval, ?, ?, ?, ?, ?)";
	
	try {
		 conn = DBManager.getConnection();
		 pstmt = conn.prepareStatement(sql);
	
		 pstmt.setString(1, review.getTitle());
		 pstmt.setTimestamp(2, review.getPub_date());
		 pstmt.setString(3, review.getWriter());
		 pstmt.setInt(4, review.getScore());
		 pstmt.setString(5, review.getDescription());
		
	} catch(Exception e) {
		
	} finally {
		DBManager.close(conn, pstmt);
	}
	
}

public void updateReview(ReviewVO review) {
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = "INSERT INTO review (rseq, title, pud_date, writer, score, description) VALUES (review_seq.nextval, ?, ?, ?, ?, ?)";
	
	try {
		 conn = DBManager.getConnection();
		 pstmt = conn.prepareStatement(sql);
	
		 pstmt.setString(1, review.getTitle());
		 pstmt.setTimestamp(2, review.getPub_date());
		 pstmt.setString(3, review.getWriter());
		 pstmt.setInt(4, review.getScore());
		 pstmt.setString(5, review.getDescription());
		
	} catch(Exception e) {
		
	} finally {
		DBManager.close(conn, pstmt);
	}
		
}
public void deleteReview(int rseq) {

	
}
}
