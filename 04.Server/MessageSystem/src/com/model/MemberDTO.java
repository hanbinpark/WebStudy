package com.model;

public class MemberDTO {
	private String email;
	private String pw;
	private String phone;
	private String addr;
	
	
	@Override
	public String toString() {
		return "MessageDTO [email=" + email + ", pw=" + pw + ", phone=" + phone + ", addr=" + addr + "]";
	}

	public MemberDTO(String email, String pw, String phone, String addr) {
		this.email = email;
		this.pw = pw;
		this.phone = phone;
		this.addr = addr;
	}


	public MemberDTO(String email, String pw) {
		this.email = email;
		this.pw = pw;
	}


	public String getEmail() {
		return email;
	}


	public String getPw() {
		return pw;
	}


	public String getPhone() {
		return phone;
	}


	public String getAddr() {
		return addr;
	}
	
	
	
	
}
