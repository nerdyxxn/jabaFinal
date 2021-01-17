package com.kh.jaba.client.payment.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jaba.client.payment.model.domain.Pay;

@Repository("payDao")
public class PayDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	// payment 테이블에 insert 
	public int insertPayment(Pay p) {
		return sqlSession.insert("Pay.insertPayment", p);
	}
	
	// paystatus 상태 변경 
	public int updatePayStatus(Pay p) {
		return sqlSession.update("Pay.updatePayStatus", p);
	}

}
