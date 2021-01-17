package com.kh.jaba.client.payment.model.service;

import com.kh.jaba.client.payment.model.domain.Pay;

public interface PayService {
	
	// payment 테이블에 insert 
	public int insertPayment(Pay p);
	
	// paystatus 상태 변경 
	public int updatePayStatus(Pay p);

}
