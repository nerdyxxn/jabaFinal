package com.kh.jaba.client.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaba.client.model.dao.ClientDao;
import com.kh.jaba.client.model.domain.Client;

@Service("clientService")
public class ClientServiceImpl implements ClientService{
	
	@Autowired
	private ClientDao dao;

	@Autowired
	private Client client;
	
	@Override
	public Client loginClient(String client_id, String client_pw) {
		client.setClient_id(client_id);
		client.setClient_pw(client_pw);
		
		return dao.loginClient(client);
	}

}
