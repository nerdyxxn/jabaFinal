package com.kh.jaba.client.order.model.domain;

import org.springframework.stereotype.Component;

@Component
public class CustomCheck {
	private String custom_check_id;
	private String custom_id;
	private String order_id;
	
	
	
	public CustomCheck() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getCustom_check_id() {
		return custom_check_id;
	}
	public void setCustom_check_id(String custom_check_id) {
		this.custom_check_id = custom_check_id;
	}
	public String getCustom_id() {
		return custom_id;
	}
	public void setCustom_id(String custom_id) {
		this.custom_id = custom_id;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	
	
}
