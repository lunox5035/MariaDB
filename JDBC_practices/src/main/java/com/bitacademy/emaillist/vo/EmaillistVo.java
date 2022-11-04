package com.bitacademy.emaillist.vo;

public class EmaillistVo {
	private Long no;
	private String fitstName;
	private String lastName;
	private String email;
	
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getFitstName() {
		return fitstName;
	}
	public void setFitstName(String fitstName) {
		this.fitstName = fitstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "EmaillistVo [no=" + no + ", fitstName=" + fitstName + ", lastName=" + lastName + ", email=" + email
				+ "]";
	}
	
	
}
