package com.kh.jaba.client.paysearch.model.domain;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import com.kh.jaba.client.menu.model.domain.MenuCollection;

@Component
public class PaySearchCollection {
	private String pay_id;
	private String client_id;
	private Date pay_time;
	private String store_name;
	private String pickup_time;
	private String pay_request;
	private String pay_total_price;
	private List<MenuCollection> MenuCollection;
	
	public String getClient_id() {
		return client_id;
	}
	public void setClient_id(String client_id) {
		this.client_id = client_id;
	}
	
	public String getPay_total_price() {
		return pay_total_price;
	}
	public void setPay_total_price(String pay_total_price) {
		this.pay_total_price = pay_total_price;
	}
	
	
	@Override
	public String toString() {
		return "PaySearchCollection [pay_id=" + pay_id + ", pay_time=" + pay_time + ", store_name=" + store_name
				+ ", pickup_time=" + pickup_time + ", pay_request=" + pay_request + ", pay_total_price="
				+ pay_total_price + ", menuCollection=" + MenuCollection + "]";
	}
	public String getPay_id() {
		return pay_id;
	}
	public void setPay_id(String pay_id) {
		this.pay_id = pay_id;
	}
	public Date getPay_time() {
		return pay_time;
	}
	public void setPay_time(Date pay_time) {
		this.pay_time = pay_time;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public String getPickup_time() {
		return pickup_time;
	}
	public void setPickup_time(String pickup_time) {
		this.pickup_time = pickup_time;
	}
	public String getPay_request() {
		return pay_request;
	}
	public void setPay_request(String pay_request) {
		this.pay_request = pay_request;
	}
	public List<MenuCollection> getMenuCollection() {
		return MenuCollection;
	}
	public void setMenuCollection(List<MenuCollection> MenuCollection) {
		this.MenuCollection = MenuCollection;
	}
	
	
}
