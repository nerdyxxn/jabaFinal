package com.kh.jaba.client.model.service;

import com.kh.jaba.client.model.domain.Client;


public interface ClientService {
	
	// client 로그인 
	public Client loginClient(String client_id, String client_pw);
	
	// client 회원가입
	public int insertClient(Client c);
	
	// client email 중복체크
	public int clientCheckId(String client_id);
}
