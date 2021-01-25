package com.kh.jaba.client.menu.model.domain;

import org.springframework.stereotype.Component;

@Component
public class Menu {
	private String menu_id;
	private String store_id;
	private String menu_name;
	private int menu_price;
	private String menu_img;
	private String menu_description;
	private String menu_category;
	private int menu_available;
	private int menu_status;

	public Menu() {

	}

	public Menu(String menu_id, String store_id, String menu_name, int menu_price, String menu_img,
			String menu_description, String menu_category, int menu_available, int menu_status) {
		super();
		this.menu_id = menu_id;
		this.store_id = store_id;
		this.menu_name = menu_name;
		this.menu_price = menu_price;
		this.menu_img = menu_img;
		this.menu_description = menu_description;
		this.menu_category = menu_category;
		this.menu_available = menu_available;
		this.menu_status = menu_status;
	}

	@Override
	public String toString() {
		return "Menu [menu_id=" + menu_id + ", store_id=" + store_id + ", menu_name=" + menu_name + ", menu_price="
				+ menu_price + ", menu_img=" + menu_img + ", menu_description=" + menu_description + ", menu_category="
				+ menu_category + ", menu_available=" + menu_available + ", menu_status=" + menu_status + "]";
	}

	public String getMenu_id() {
		return menu_id;
	}

	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
	}

	public String getStore_id() {
		return store_id;
	}

	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}

	public String getMenu_name() {
		return menu_name;
	}

	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

	public int getMenu_price() {
		return menu_price;
	}

	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}

	public String getMenu_img() {
		return menu_img;
	}

	public void setMenu_img(String menu_img) {
		this.menu_img = menu_img;
	}

	public String getMenu_description() {
		return menu_description;
	}

	public void setMenu_description(String menu_description) {
		this.menu_description = menu_description;
	}

	public String getMenu_category() {
		return menu_category;
	}

	public void setMenu_category(String menu_category) {
		this.menu_category = menu_category;
	}

	public int getMenu_available() {
		return menu_available;
	}

	public void setMenu_available(int menu_available) {
		this.menu_available = menu_available;
	}

	public int getMenu_status() {
		return menu_status;
	}

	public void setMenu_status(int menu_status) {
		this.menu_status = menu_status;
	}

}
