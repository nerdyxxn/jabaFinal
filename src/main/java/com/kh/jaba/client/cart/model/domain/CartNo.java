package com.kh.jaba.client.cart.model.domain;

import org.springframework.stereotype.Component;

@Component
public class CartNo {
	private String cartno_id;
	
	
	public CartNo() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "CartNo [cartno_id=" + cartno_id + "]";
	}

	public String getCartno_id() {
		return cartno_id;
	}

	public void setCartno_id(String cartno_id) {
		this.cartno_id = cartno_id;
	}
	
	
}
