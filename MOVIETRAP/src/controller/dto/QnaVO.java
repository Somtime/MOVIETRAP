package controller.dto;

import java.sql.Timestamp;

public class QnaVO {
	private int cseq;
	private String send_id;
	private String rcvd_id;
	private String chat_content;
	private Timestamp chat_time;
	
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
	public Timestamp getChat_time() {
		return chat_time;
	}
	public void setChat_time(Timestamp chat_time) {
		this.chat_time = chat_time;
	}

}
