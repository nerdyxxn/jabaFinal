package com.kh.jaba.client.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jaba.client.model.domain.Client;

@Repository("clientDao")
public class ClientDao {
	@Autowired
	private SqlSession sqlSession;
	public Client loginClient(Client c) {
		return sqlSession.selectOne("Client.loginClient", c);
	}
	

}
