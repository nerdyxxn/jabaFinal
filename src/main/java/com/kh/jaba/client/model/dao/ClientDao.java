package com.kh.jaba.client.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jaba.client.model.domain.Client;

@Repository("clientDao")
public class ClientDao {
	@Autowired
	private SqlSession sqlSession;

	// client 로그인
	public Client loginClient(Client c) {
		return sqlSession.selectOne("Client.loginClient", c);
	}

	// client 회원가입
	public int insertClient(Client c) {
		return sqlSession.insert("Client.insertClient", c);
	}

	// client 중복체크
	public int clientCheckId(String client_id) {
		return sqlSession.selectOne("Client.clientCheckId", client_id);
	}

	// 프로필 수정
	public int updateClient(Client c) {
		return sqlSession.update("Client.updateClient", c);
	}

	// 비밀번호 변경
	public int updateClientPw(Client c) {
		return sqlSession.update("Client.updateClientPw", c);
	}

	// 자바 전체 이용자수
	public int countTotalClient() {
		return sqlSession.selectOne("Client.countTotalClient");
	}

}