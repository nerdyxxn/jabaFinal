package com.kh.jaba.biz.order.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaba.biz.order.dao.BizOrderDao;
import com.kh.jaba.biz.order.domain.BizOrder;

@Service("bizOrderService")
public class BizOrderServiceImpl implements BizOrderService{

	@Autowired
	private BizOrderDao bizOrderDao;
	
	// orderview 조회
	@Override
	public List<BizOrder> orderViewList(String store_name) {
		return bizOrderDao.orderViewList(store_name);
	}

}
