package com.VO;

public class MemberVO {
	private int num;
	private String email;
	private String password;
	private String nickname;
	private String senddate;
	public MemberVO(int num, String email, String password, String nickname, String senddate) {
		super();
		this.num = num;
		this.email = email;
		this.password = password;
		this.nickname = nickname;
		this.senddate = senddate;
	}
	public int getNum() {
		return num;
	}
	public String getEmail() {
		return email;
	}
	public String getPassword() {
		return password;
	}
	public String getNickname() {
		return nickname;
	}
	public String getSenddate() {
		return senddate;
	}
	
	
}
