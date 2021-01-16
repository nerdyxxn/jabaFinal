package com.kh.jaba.biz.sales.model.domain;

import java.sql.Date;

import org.springframework.stereotype.Component;


@Component
public class BizSales {
	private String pay_time;
	private String store_name;
	private String pay_total_price;
	@Override
	public String toString() {
		return "BizSales [pay_time=" + pay_time + ", store_name=" + store_name + ", pay_total_price=" + pay_total_price
				+ "]";
	}
	public BizSales(String pay_time, String store_name, String pay_total_price) {
		super();
		this.pay_time = pay_time;
		this.store_name = store_name;
		this.pay_total_price = pay_total_price;
	}
	public BizSales() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getPay_time() {
		return pay_time;
	}
	public void setPay_time(String pay_time) {
		this.pay_time = pay_time;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public String getPay_total_price() {
		return pay_total_price;
	}
	public void setPay_total_price(String pay_total_price) {
		this.pay_total_price = pay_total_price;
	}
	
	

}
