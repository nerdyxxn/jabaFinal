package com.kh.jaba.client.cart.model.Service;

import java.util.List;

import com.kh.jaba.client.cart.model.domain.Cart;
import com.kh.jaba.client.order.model.domain.CustomCheck;

public interface CartService {
	public int insertCart(Cart c);
	
	// cartno_id 를 통해 cartList 를 불러오는 메소드
	public List<Cart> selectCartList(String cartno_id);
}
