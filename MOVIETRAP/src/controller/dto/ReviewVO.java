package controller.dto;

import java.sql.Timestamp;

public class ReviewVO {
	private int rseq;
	private String writer;
	private Timestamp pub_date;
	private String title;
	private String description;
	private int score;
	private Timestamp regdate;
	private Timestamp edit_date;

	public int getRseq() {
		return rseq;
	}

	public void setRseq(int rseq) {
		this.rseq = rseq;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Timestamp getPub_date() {
		return pub_date;
	}

	public void setPub_date(Timestamp pub_date) {
		this.pub_date = pub_date;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public Timestamp getEdit_date() {
		return edit_date;
	}

	public void setEdit_date(Timestamp edit_date) {
		this.edit_date = edit_date;
	}

}
