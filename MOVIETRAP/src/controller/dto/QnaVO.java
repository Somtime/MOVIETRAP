package controller.dto;

import java.sql.Timestamp;

public class QnaVO {
	private int qseq;
	private int cseq;
	private String send_id;
	private String rcvd_id;
	private String chat_content;
	private String regdate;
	
	
	
	public int getQseq() {
		return qseq;
	}
	public void setQseq(int qseq) {
		this.qseq = qseq;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getCseq() {
		return cseq;
	}
	public void setCseq(int cseq) {
		this.cseq = cseq;
	}
	public String getSend_id() {
		return send_id;
	}
	public void setSend_id(String send_id) {
		this.send_id = send_id;
	}
	public String getRcvd_id() {
		return rcvd_id;
	}
	public void setRcvd_id(String rcvd_id) {
		this.rcvd_id = rcvd_id;
	}
	public String getChat_content() {
		return chat_content;
	}
	public void setChat_content(String chat_content) {
		this.chat_content = chat_content;
	}
	public String getChat_time() {
		return regdate;
	}
	public void setChat_time(String chat_time) {
		this.regdate = chat_time;
	}

}
