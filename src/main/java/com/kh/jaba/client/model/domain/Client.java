package com.kh.jaba.client.model.domain;

import org.springframework.stereotype.Component;

//client_ID     NOT NULL VARCHAR2(100) 
//client_PW              VARCHAR2(50)  
//client_NAME            VARCHAR2(30)  
//client_PHONE           VARCHAR2(20)  
//client_GENDER          NUMBER(1)     
//client_BIRTH           NUMBER(8)     
@Component
public class Client {
	private String client_id;
	private String client_pw;
	private String client_name;
	private String client_phone;
	private int client_gender;
	private int client_birth;
	private int client_status;

	public Client() {
	}

	public Client(String client_id, String client_pw, String client_name, String client_phone, int client_gender,
			int client_birth, int client_status) {
		super();
		this.client_id = client_id;
		this.client_pw = client_pw;
		this.client_name = client_name;
		this.client_phone = client_phone;
		this.client_gender = client_gender;
		this.client_birth = client_birth;
		this.client_status = client_status;
	}

	@Override
	public String toString() {
		return "Client [client_id=" + client_id + ", client_pw=" + client_pw + ", client_name=" + client_name
				+ ", client_phone=" + client_phone + ", client_gender=" + client_gender + ", client_birth="
				+ client_birth + ", client_status=" + client_status + "]";
	}

	public String getClient_id() {
		return client_id;
	}

	public void setClient_id(String client_id) {
		this.client_id = client_id;
	}

	public String getClient_pw() {
		return client_pw;
	}

	public void setClient_pw(String client_pw) {
		this.client_pw = client_pw;
	}

	public String getClient_name() {
		return client_name;
	}

	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}

	public String getClient_phone() {
		return client_phone;
	}

	public void setClient_phone(String client_phone) {
		this.client_phone = client_phone;
	}

	public int getClient_gender() {
		return client_gender;
	}

	public void setClient_gender(int client_gender) {
		this.client_gender = client_gender;
	}

	public int getClient_birth() {
		return client_birth;
	}

	public void setClient_birth(int client_birth) {
		this.client_birth = client_birth;
	}

	public int getClient_status() {
		return client_status;
	}

	public void setClient_status(int client_status) {
		this.client_status = client_status;
	}
}
