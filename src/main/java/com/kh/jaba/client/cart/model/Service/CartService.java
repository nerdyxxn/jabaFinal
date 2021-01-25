package com.kh.jaba.client.cart.model.Service;

import java.util.List;

import com.kh.jaba.client.cart.model.domain.Cart;

public interface CartService {
	public int insertCart(Cart c);

	// cartno_id 를 통해 cartList 를 불러오는 메소드
	public List<Cart> selectCartList(String cartno_id);

	// x 버튼 클릭하면 cart_check를 2로 update 하여 카트목록에서 안보이게함
	public int updateCartCheck(String order_id);
}
