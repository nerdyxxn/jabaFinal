package com.kh.jaba.client.custom.model.domain;

import org.springframework.stereotype.Component;

@Component
public class Custom {
	private String custom_id;
	private String menu_id;
	private String custom_name;
	private int custom_price;
	private String custom_category;
	
	public Custom() {
	}

	public Custom(String custom_id, String menu_id, String custom_name, int custom_price, String custom_category) {
		super();
		this.custom_id = custom_id;
		this.menu_id = menu_id;
		this.custom_name = custom_name;
		this.custom_price = custom_price;
		this.custom_category = custom_category;
	}

	@Override
	public String toString() {
		return "Custom [custom_id=" + custom_id + ", menu_id=" + menu_id + ", custom_name=" + custom_name
				+ ", custom_price=" + custom_price + ", custom_category=" + custom_category + "]";
	}

	public String getCustom_id() {
		return custom_id;
	}

	public void setCustom_id(String custom_id) {
		this.custom_id = custom_id;
	}

	public String getMenu_id() {
		return menu_id;
	}

	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
	}

	public String getCustom_name() {
		return custom_name;
	}

	public void setCustom_name(String custom_name) {
		this.custom_name = custom_name;
	}

	public int getCustom_price() {
		return custom_price;
	}

	public void setCustom_price(int custom_price) {
		this.custom_price = custom_price;
	}

	public String getCustom_category() {
		return custom_category;
	}

	public void setCustom_category(String custom_category) {
		this.custom_category = custom_category;
	}
	
	

}
