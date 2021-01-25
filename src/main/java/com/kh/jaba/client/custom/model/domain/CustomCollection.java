package com.kh.jaba.client.custom.model.domain;

import org.springframework.stereotype.Component;

@Component
public class CustomCollection {
	private String custom_id;
	private String custom_name;
	private String pay_id;
	private String order_id;

	public String getPay_id() {
		return pay_id;
	}

	public void setPay_id(String pay_id) {
		this.pay_id = pay_id;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	@Override
	public String toString() {
		return "CustomCollection [custom_id=" + custom_id + ", custom_name=" + custom_name + ", pay_id=" + pay_id
				+ ", order_id=" + order_id + "]";
	}

	public String getCustom_id() {
		return custom_id;
	}

	public void setCustom_id(String custom_id) {
		this.custom_id = custom_id;
	}

	public String getCustom_name() {
		return custom_name;
	}

	public void setCustom_name(String custom_name) {
		this.custom_name = custom_name;
	}

}
