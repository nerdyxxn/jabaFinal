package com.kh.jaba.explore.model.domain;

import org.springframework.stereotype.Component;

//STORE
//STORE_ID          NOT NULL VARCHAR2(100) 
//STORE_PW                   VARCHAR2(50)  
//STORE_ADDR                 VARCHAR2(200) 
//STORE_NAME                 VARCHAR2(100) 
//STORE_TIME                 VARCHAR2(10)  
//STORE_IMG                  VARCHAR2(300) 
//STORE_DESCRIPTION          VARCHAR2(200) 
//STORE_LAT                  VARCHAR2(50)  
//STORE_LNG                  VARCHAR2(50)
//STORE_DISTANCE             NUMBER(38)  

@Component
public class Search implements Comparable<Search> {
	private String store_id;
	private String store_pw;
	private String store_addr;
	private String store_name;
	private String store_time;
	private String store_img;
	private String store_description;
	private String store_lat;
	private String store_lng;
	private double store_distance;
	private int store_status;

	public Search() {
	}

	public Search(String store_id, String store_pw, String store_addr, String store_name, String store_time,
			String store_img, String store_description, String store_lat, String store_lng, double store_distance,
			int store_status) {
		super();
		this.store_id = store_id;
		this.store_pw = store_pw;
		this.store_addr = store_addr;
		this.store_name = store_name;
		this.store_time = store_time;
		this.store_img = store_img;
		this.store_description = store_description;
		this.store_lat = store_lat;
		this.store_lng = store_lng;
		this.store_distance = store_distance;
		this.store_status = store_status;
	}

	@Override
	public String toString() {
		return "Search [store_id=" + store_id + ", store_pw=" + store_pw + ", store_addr=" + store_addr
				+ ", store_name=" + store_name + ", store_time=" + store_time + ", store_img=" + store_img
				+ ", store_description=" + store_description + ", store_lat=" + store_lat + ", store_lng=" + store_lng
				+ ", store_distance=" + store_distance + ", store_status=" + store_status + "]";
	}

	public String getStore_id() {
		return store_id;
	}

	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}

	public String getStore_pw() {
		return store_pw;
	}

	public void setStore_pw(String store_pw) {
		this.store_pw = store_pw;
	}

	public String getStore_addr() {
		return store_addr;
	}

	public void setStore_addr(String store_addr) {
		this.store_addr = store_addr;
	}

	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}

	public String getStore_time() {
		return store_time;
	}

	public void setStore_time(String store_time) {
		this.store_time = store_time;
	}

	public String getStore_img() {
		return store_img;
	}

	public void setStore_img(String store_img) {
		this.store_img = store_img;
	}

	public String getStore_description() {
		return store_description;
	}

	public void setStore_description(String store_description) {
		this.store_description = store_description;
	}

	public String getStore_lat() {
		return store_lat;
	}

	public void setStore_lat(String store_lat) {
		this.store_lat = store_lat;
	}

	public String getStore_lng() {
		return store_lng;
	}

	public void setStore_lng(String store_lng) {
		this.store_lng = store_lng;
	}

	public double getStore_distance() {
		return store_distance;
	}

	public void setStore_distance(double store_distance) {
		this.store_distance = store_distance;
	}

	public int getStore_status() {
		return store_status;
	}

	public void setStore_status(int store_status) {
		this.store_status = store_status;
	}

	@Override
	public int compareTo(Search arg0) {
		if (this.store_distance > arg0.store_distance)
			return 1; // 좌측값이 큰 경우
		else if (this.store_distance < arg0.store_distance)
			return -1; // 우측값이 큰 경우
		else
			return 0; // 일치하는 경우
	}
}
