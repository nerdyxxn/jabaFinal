package com.kh.jaba.client.cart.model.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaba.client.cart.model.dao.CartDao;
import com.kh.jaba.client.cart.model.domain.Cart;
import com.kh.jaba.client.order.model.domain.CustomCheck;

@Service("cartService")
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDao cartDao;
	
	@Override
	public int insertCart(Cart c) {
		return cartDao.insertCart(c);
	}

	// cartno_id 를 통해 cartList 를 불러오는 메소드
	@Override
	public List<Cart> selectCartList(String cartno_id) {
		return cartDao.selectCartList(cartno_id);
	}
	
}
