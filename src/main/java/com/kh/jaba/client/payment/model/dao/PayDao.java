package com.kh.jaba.client.payment.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("payDao")
public class PayDao {
	
	@Autowired
	private SqlSession sqlSession;

}
