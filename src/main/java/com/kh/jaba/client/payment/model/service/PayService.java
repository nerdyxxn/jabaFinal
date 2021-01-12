package com.kh.jaba.client.payment.model.service;

import com.kh.jaba.client.payment.model.domain.Pay;

public interface PayService {
	
	// payment 테이블에 insert 
	public int insertPayment(Pay p);

}
