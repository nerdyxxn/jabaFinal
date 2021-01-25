package com.kh.jaba.client.custom.model.domain;

import org.springframework.stereotype.Component;

@Component
public class Custom {
	private String custom_id;
	private String menu_id;
	private String custom_name;
	private String custom_category;
	private int custom_price;
	private int custom_status;

	public Custom() {
	}

	public Custom(String custom_id, String menu_id, String custom_name, String custom_category, int custom_price,
			int custom_status) {
		super();
		this.custom_id = custom_id;
		this.menu_id = menu_id;
		this.custom_name = custom_name;
		this.custom_category = custom_category;
		this.custom_price = custom_price;
		this.custom_status = custom_status;
	}

	@Override
	public String toString() {
		return "Custom [custom_id=" + custom_id + ", menu_id=" + menu_id + ", custom_name=" + custom_name
				+ ", custom_category=" + custom_category + ", custom_price=" + custom_price + ", custom_status="
				+ custom_status + "]";
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

	public String getCustom_category() {
		return custom_category;
	}

	public void setCustom_category(String custom_category) {
		this.custom_category = custom_category;
	}

	public int getCustom_price() {
		return custom_price;
	}

	public void setCustom_price(int custom_price) {
		this.custom_price = custom_price;
	}

	public int getCustom_status() {
		return custom_status;
	}

	public void setCustom_status(int custom_status) {
		this.custom_status = custom_status;
	}

}
