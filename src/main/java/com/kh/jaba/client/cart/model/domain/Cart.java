package com.kh.jaba.client.cart.model.domain;

import org.springframework.stereotype.Component;

@Component
public class Cart {
	private String order_id;
	private String cartno_id;
	private String store_id;
	private int cart_total_price;
	private int cart_check;

	public Cart() {
		super();
	}

	@Override
	public String toString() {
		return "Cart [order_id=" + order_id + ", cartno_id=" + cartno_id + ", store_id=" + store_id
				+ ", cart_total_price=" + cart_total_price + ", cart_check=" + cart_check + "]";
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public String getCartno_id() {
		return cartno_id;
	}

	public void setCartno_id(String cartno_id) {
		this.cartno_id = cartno_id;
	}

	public String getStore_id() {
		return store_id;
	}

	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}

	public int getCart_total_price() {
		return cart_total_price;
	}

	public void setCart_total_price(int cart_total_price) {
		this.cart_total_price = cart_total_price;
	}

	public int getCart_check() {
		return cart_check;
	}

	public void setCart_check(int cart_check) {
		this.cart_check = cart_check;
	}

}
