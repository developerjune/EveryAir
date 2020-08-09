package com.everyair.www.dto;

public class MemberDTO {
	private int no;
	private String id;
	private String pw;
	private String nickname;
	private String email;
	private String phonenumber;
	private String subscriptiondate;
	private String denied;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getSubscriptiondate() {
		return subscriptiondate;
	}

	public void setSubscriptiondate(String subscriptiondate) {
		this.subscriptiondate = subscriptiondate;
	}

	public String getDenied() {
		return denied;
	}

	public void setDenied(String denied) {
		this.denied = denied;
	}
}
