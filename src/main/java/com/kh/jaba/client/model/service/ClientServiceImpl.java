package com.kh.jaba.client.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaba.client.model.dao.ClientDao;
import com.kh.jaba.client.model.domain.Client;

@Service("clientService")
public class ClientServiceImpl implements ClientService {

	@Autowired
	private ClientDao clientDao;

	@Autowired
	private Client client;

	// client 로그인
	@Override
	public Client loginClient(String client_id, String client_pw) {
		client.setClient_id(client_id);
		client.setClient_pw(client_pw);

		return clientDao.loginClient(client);
	}

	// client 회원가입
	@Override
	public int insertClient(Client c) {
		// return이 꼭필요한가 싶기도함.. 굳이?
		// 기존에 jdbc를 사용했을때는 int값으로 1 혹은 0 이 return 되었음
		return clientDao.insertClient(c);
	}

	// client email 중복체크
	@Override
	public int clientCheckId(String client_id) {
		return clientDao.clientCheckId(client_id);
	}

	// 프로필 수정
	@Override
	public int updateClient(Client c) {
		return clientDao.updateClient(c);
	}

	// 비밀번호 변경
	@Override
	public int updateClientPw(Client c) {
		return clientDao.updateClientPw(c);
	}

	// 자바 전체 이용자수
	@Override
	public int countTotalClient() {
		// TODO Auto-generated method stub
		return clientDao.countTotalClient();
	}

	// 회원 이용 제제
	@Override
	public int updateClientStatus(Client c) {
		return clientDao.updateClientStatus(c);
	}

	// 자바 전체 회원 조회
	@Override
	public List<Client> selectAllClient() {
		return clientDao.selectAllClient();
	}

	// Client 리스트 중 하나를 선택해서 Detail 정보를 얻어옴
	@Override
	public Client selectClientDetail(String client_id) {
		return clientDao.selectClientDetail(client_id);
	}
	
}