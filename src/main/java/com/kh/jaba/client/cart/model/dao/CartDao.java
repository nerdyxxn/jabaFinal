package com.kh.jaba.client.cart.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jaba.client.cart.model.domain.Cart;
import com.kh.jaba.client.order.model.domain.CustomCheck;

@Repository("cartDao")
public class CartDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertCart(Cart c) {
		return sqlSession.insert("Cart.insertCart", c);
	}
	
	// cartno_id 를 통해 cartList 를 불러오는 메소드
	public List<Cart> selectCartList(String cartno_id){
		return sqlSession.selectList("Cart.selectCartList", cartno_id);
	}
	
}
