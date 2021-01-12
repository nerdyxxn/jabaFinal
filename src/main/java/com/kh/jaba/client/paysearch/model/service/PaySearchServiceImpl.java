package com.kh.jaba.client.paysearch.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaba.client.paysearch.model.dao.PaySearchDao;
import com.kh.jaba.client.paysearch.model.domain.PaySearch;
import com.kh.jaba.client.paysearch.model.domain.PaySearchCollection;

@Service("paySearchService")
public class PaySearchServiceImpl implements PaySearchService {
	@Autowired
	private PaySearchDao paySearchDao;
	
	@Override
	public List<PaySearch> selectPaySearch(String client_id) {	
		return paySearchDao.selectPaySearch(client_id);
	}

	@Override
	public List<PaySearchCollection> getPaySearchList(String client_id) {
		return paySearchDao.getPaySearchList(client_id);
	}
	
	

}