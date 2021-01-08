package com.kh.jaba.client.order.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("customCheckDao")
public class CustomCheckDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	

}
