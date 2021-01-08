package com.kh.jaba.client.cart.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jaba.client.cart.model.domain.CartNo;
import com.kh.jaba.client.order.model.domain.Order;

@Repository("cartNoDao")
public class CartNoDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertCartNo(CartNo cn) {
		return sqlSession.insert("CartNo.insertCartNo", cn);
	};
	
	public CartNo currentCartId() {
		return sqlSession.selectOne("CartNo.currentCartId");
	}
	
	public Order selectOneCartNo(String cartno_id){
		return sqlSession.selectOne("CartNo.selectOneCartNo", cartno_id);
	}

}
