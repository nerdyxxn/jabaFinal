package com.kh.jaba.client.model.service;

import com.kh.jaba.client.model.domain.Client;


public interface ClientService {
   
   // client 로그인 
   public Client loginClient(String client_id, String client_pw);
   
   // client 회원가입
   public int insertClient(Client c);
   
   // client email 중복체크
   public int clientCheckId(String client_id);
   
   // 프로필 수정 
   public int updateClient(Client c);
   
   // 비밀번호 변경
   public int updateClientPw(Client c);
   
	// 자바 전체 이용자수
	public int countTotalClient();
	
	// 회원 이용 제제
	public int updateClientStatus(Client c);
}