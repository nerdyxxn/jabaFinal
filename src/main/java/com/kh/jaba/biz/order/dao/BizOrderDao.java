package com.kh.jaba.biz.order.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jaba.biz.order.domain.BizOrder;

@Repository("bizOrderDao")
public class BizOrderDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<BizOrder> orderViewList(String store_name){
		return sqlSession.selectList("BizOrder.orderViewList", store_name);
	}
	
	
	
}
