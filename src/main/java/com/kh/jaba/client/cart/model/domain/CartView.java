package com.kh.jaba.client.cart.model.domain;

import org.springframework.stereotype.Component;

// cartView 를 위한 Domain
// menu_name, order_quantity, cart_total_price 가 들어있다.
@Component
public class CartView {
	private String menu_name;
	private String order_id;
	private int order_quantity;
	private int cart_total_price;
	
	public CartView() {}
	
	public CartView(String menu_name, String order_id, int order_quantity, int cart_total_price) {
		super();
		this.menu_name = menu_name;
		this.order_id = order_id;
		this.order_quantity = order_quantity;
		this.cart_total_price = cart_total_price;
	}

	@Override
	public String toString() {
		return "CartView [menu_name=" + menu_name + ", order_id=" + order_id + ", order_quantity=" + order_quantity
				+ ", cart_total_price=" + cart_total_price + "]";
	}

	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public int getOrder_quantity() {
		return order_quantity;
	}
	public void setOrder_quantity(int order_quantity) {
		this.order_quantity = order_quantity;
	}
	public int getCart_total_price() {
		return cart_total_price;
	}
	public void setCart_total_price(int cart_total_price) {
		this.cart_total_price = cart_total_price;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	
	
}
