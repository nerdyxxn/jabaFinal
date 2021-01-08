package com.kh.jaba.client.cart.model.Service;

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
	
}
