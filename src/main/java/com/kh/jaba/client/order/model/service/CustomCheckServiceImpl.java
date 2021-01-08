package com.kh.jaba.client.order.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaba.client.order.model.dao.CustomCheckDao;
import com.kh.jaba.client.order.model.domain.CustomCheck;

@Service("customCheckService")
public class CustomCheckServiceImpl implements CustomCheckService {
	@Autowired
	private CustomCheckDao customCheckDao;

	@Override
	public int insertCustomCheck(CustomCheck cc) {
		return customCheckDao.insertCustomCheck(cc);
	}

}
