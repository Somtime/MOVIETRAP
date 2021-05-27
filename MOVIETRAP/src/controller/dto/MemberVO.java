package controller.dto;

import java.sql.Timestamp;

public class MemberVO {
	private String email;
	private String pwd;
	private String name;
	private String phone;
	private String image;
	private Timestamp regdate;
	private String newsletter;
	private String pay_name;
	private String pay_num;
	private String pay_num_lstfour;
	private int pay_cvc;
	private int pay_exp_yr;
	private String pay_exp_date;
	private Timestamp pay_date;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNewsletter() {
		return newsletter;
	}
	public void setNewsletter(String newsletter) {
		this.newsletter = newsletter;
	}
	public int getPay_exp_yr() {
		return pay_exp_yr;
	}
	public void setPay_exp_yr(int pay_exp_yr) {
		this.pay_exp_yr = pay_exp_yr;
	}
	public String getPay_exp_date() {
		return pay_exp_date;
	}
	public void setPay_exp_date(String pay_exp_date) {
		this.pay_exp_date = pay_exp_date;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getnewsletter() {
		return newsletter;
	}
	public void setnewsletter(String newsletter) {
		this.newsletter = newsletter;
	}
	public String getPay_name() {
		return pay_name;
	}
	public void setPay_name(String pay_name) {
		this.pay_name = pay_name;
	}
	public String getPay_num() {
		return pay_num;
	}
	public void setPay_num(String pay_num) {
		this.pay_num = pay_num;
	}
	public String getPay_num_lstfour() {
		return pay_num_lstfour;
	}
	public void setPay_num_lstfour(String pay_num_lstfour) {
		this.pay_num_lstfour = pay_num_lstfour;
	}
	public int getPay_cvc() {
		return pay_cvc;
	}
	public void setPay_cvc(int pay_cvc) {
		this.pay_cvc = pay_cvc;
	}
	public Timestamp getPay_date() {
		return pay_date;
	}
	public void setPay_date(Timestamp pay_date) {
		this.pay_date = pay_date;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}
