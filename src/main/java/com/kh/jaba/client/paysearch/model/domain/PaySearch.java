package com.kh.jaba.client.paysearch.model.domain;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class PaySearch {
	private String menu_name;
	private String custom_name;
	private int pay_total_price;
	private String client_id;
	private String store_name;
	private int order_quantity;
	private Date pay_time;
	private String pickup_time;
	private String pay_id;
	private String pay_request;
	private String order_id;

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public String getMenu_name() {
		return menu_name;
	}

	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

	public String getCustom_name() {
		return custom_name;
	}

	public void setCustom_name(String custom_name) {
		this.custom_name = custom_name;
	}

	public int getPay_total_price() {
		return pay_total_price;
	}

	public void setPay_total_price(int pay_total_price) {
		this.pay_total_price = pay_total_price;
	}

	public String getClient_id() {
		return client_id;
	}

	public void setClient_id(String client_id) {
		this.client_id = client_id;
	}

	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}

	public int getOrder_quantity() {
		return order_quantity;
	}

	public void setOrder_quantity(int order_quantity) {
		this.order_quantity = order_quantity;
	}

	public Date getPay_time() {
		return pay_time;
	}

	public void setPay_time(Date pay_time) {
		this.pay_time = pay_time;
	}

	public String getPickup_time() {
		return pickup_time;
	}

	public void setPickup_time(String pickup_time) {
		this.pickup_time = pickup_time;
	}

	public String getPay_id() {
		return pay_id;
	}

	public void setPay_id(String pay_id) {
		this.pay_id = pay_id;
	}

	public String getPay_request() {
		return pay_request;
	}

	public void setPay_request(String pay_request) {
		this.pay_request = pay_request;
	}

}
