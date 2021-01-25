package com.kh.jaba.client.payment.model.domain;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Pay {
	private String pay_id;
	private String cartno_id;
	private int pay_total_price;
	private Date pay_time;
	private String pay_request;
	private String pickup_time;
	private int pay_status;

	public Pay() {
		super();
	}

	public Pay(String pay_id, String cartno_id, int pay_total_price, Date pay_time, String pay_request,
			String pickup_time, int pay_status) {
		super();
		this.pay_id = pay_id;
		this.cartno_id = cartno_id;
		this.pay_total_price = pay_total_price;
		this.pay_time = pay_time;
		this.pay_request = pay_request;
		this.pickup_time = pickup_time;
		this.pay_status = pay_status;
	}

	@Override
	public String toString() {
		return "Pay [pay_id=" + pay_id + ", cartno_id=" + cartno_id + ", pay_total_price=" + pay_total_price
				+ ", pay_time=" + pay_time + ", pay_request=" + pay_request + ", pickup_time=" + pickup_time
				+ ", pay_status=" + pay_status + "]";
	}

	public int getPay_status() {
		return pay_status;
	}

	public void setPay_status(int pay_status) {
		this.pay_status = pay_status;
	}

	public String getPay_id() {
		return pay_id;
	}

	public void setPay_id(String pay_id) {
		this.pay_id = pay_id;
	}

	public String getCartno_id() {
		return cartno_id;
	}

	public void setCartno_id(String cartno_id) {
		this.cartno_id = cartno_id;
	}

	public int getPay_total_price() {
		return pay_total_price;
	}

	public void setPay_total_price(int pay_total_price) {
		this.pay_total_price = pay_total_price;
	}

	public Date getPay_time() {
		return pay_time;
	}

	public void setPay_time(Date pay_time) {
		this.pay_time = pay_time;
	}

	public String getPay_request() {
		return pay_request;
	}

	public void setPay_request(String pay_request) {
		this.pay_request = pay_request;
	}

	public String getPickup_time() {
		return pickup_time;
	}

	public void setPickup_time(String pickup_time) {
		this.pickup_time = pickup_time;
	}

}
