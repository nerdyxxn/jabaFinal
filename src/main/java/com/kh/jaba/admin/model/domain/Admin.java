package com.kh.jaba.admin.model.domain;

import org.springframework.stereotype.Component;

//ADMIN_ID    VARCHAR2(100) 
//ADMIN_PW    VARCHAR2(50)
@Component
public class Admin {
	private String admin_id;
	private String admin_pw;
	
	public Admin() {}
	public Admin(String admin_id, String admin_pw) {
		super();
		this.admin_id = admin_id;
		this.admin_pw = admin_pw;
	}
	
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_pw() {
		return admin_pw;
	}
	public void setAdmin_pw(String admin_pw) {
		this.admin_pw = admin_pw;
	}
}
