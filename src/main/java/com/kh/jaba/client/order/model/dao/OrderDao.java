package com.kh.jaba.client.order.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jaba.client.order.model.domain.Order;

@Repository("orderDao")
public class OrderDao {

	@Autowired
	private SqlSession sqlSession;

	public int insertOrder(Order o) {
		return sqlSession.insert("Order.insertOrder", o);
	}

//   현재 order_id를 가져오는 메소드
	public Order currentOrderId() {
		return sqlSession.selectOne("Order.currentOrderId");
	}

//   INSERT한 다음, 생성된 order_id로 OrderVO를 가져오는 메소드
	public Order selectOneOrder(String order_id) {
		return sqlSession.selectOne("Order.selectOneOrder", order_id);
	}

}