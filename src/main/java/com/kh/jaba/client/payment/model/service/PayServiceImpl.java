package com.kh.jaba.client.payment.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaba.client.payment.model.dao.PayDao;
import com.kh.jaba.client.payment.model.domain.Pay;

@Service("payService")
public class PayServiceImpl implements PayService {
	
	@Autowired
	private PayDao payDao;

	// payment 테이블에 insert 
	@Override
	public int insertPayment(Pay p) {
		return payDao.insertPayment(p);
	}

	// paystatus 상태 변경 
	@Override
	public int updatePayStatus(Pay p) {
		return payDao.updatePayStatus(p);
	}

}
