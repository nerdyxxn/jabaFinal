package com.kh.jaba.client.menu.model.domain;

import java.util.List;

import org.springframework.stereotype.Component;

import com.kh.jaba.client.custom.model.domain.CustomCollection;

@Component
public class MenuCollection {
	private String menu_name;
	private int menu_quantity;
	private String order_id;
	private String pay_id;
	private List<CustomCollection> CustomCollection;
	
	public List<CustomCollection> getCustomCollection() {
		return CustomCollection;
	}
	public void setCustomCollection(List<CustomCollection> customCollection) {
		CustomCollection = customCollection;
	}
	
	
	public String getPay_id() {
		return pay_id;
	}
	public void setPay_id(String pay_id) {
		this.pay_id = pay_id;
	}
	
	@Override
	public String toString() {
		return "MenuCollection [menu_name=" + menu_name + ", menu_quantity=" + menu_quantity + ", order_id=" + order_id
				+ ", pay_id=" + pay_id + ", CustomCollection=" + CustomCollection + "]";
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public int getMenu_quantity() {
		return menu_quantity;
	}
	public void setMenu_quantity(int menu_quantity) {
		this.menu_quantity = menu_quantity;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	
	
}
