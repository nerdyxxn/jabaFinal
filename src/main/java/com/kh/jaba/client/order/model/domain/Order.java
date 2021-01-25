package com.kh.jaba.client.order.model.domain;

import org.springframework.stereotype.Component;

@Component
public class Order {
	private String order_id;
	private String client_id;
	private String menu_id;
	private int order_quantity;

	public Order() {
		super();
	}

	public Order(String order_id, String client_id, String menu_id, int order_quantity) {
		super();
		this.order_id = order_id;
		this.client_id = client_id;
		this.menu_id = menu_id;
		this.order_quantity = order_quantity;
	}

	@Override
	public String toString() {
		return "Order [order_id=" + order_id + ", client_id=" + client_id + ", menu_id=" + menu_id + ", order_quantity="
				+ order_quantity + "]";
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public String getClient_id() {
		return client_id;
	}

	public void setClient_id(String client_id) {
		this.client_id = client_id;
	}

	public String getMenu_id() {
		return menu_id;
	}

	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
	}

	public int getOrder_quantity() {
		return order_quantity;
	}

	public void setOrder_quantity(int order_quantity) {
		this.order_quantity = order_quantity;
	}

}
