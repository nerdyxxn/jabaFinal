package com.kh.jaba.client.order.model.service;

import java.util.List;

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

	@Override
	public List<CustomCheck> selectCustomCheckListByOrderId(String order_id) {
		return customCheckDao.selectCustomCheckListByOrderId(order_id);
	}

}
