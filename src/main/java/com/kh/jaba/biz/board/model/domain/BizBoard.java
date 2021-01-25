package com.kh.jaba.biz.board.model.domain;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class BizBoard {
	private String board_no;
	private String store_id;
	private String store_board_title;
	private Date store_board_time;

	public BizBoard() {
		super();
	}

	public BizBoard(String board_no, String store_id, String store_board_title, Date store_board_time) {
		super();
		this.board_no = board_no;
		this.store_id = store_id;
		this.store_board_title = store_board_title;
		this.store_board_time = store_board_time;
	}

	@Override
	public String toString() {
		return "BizBoard [board_no=" + board_no + ", store_id=" + store_id + ", store_board_title=" + store_board_title
				+ ", store_board_time=" + store_board_time + "]";
	}

	public String getBoard_no() {
		return board_no;
	}

	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}

	public String getStore_id() {
		return store_id;
	}

	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}

	public String getStore_board_title() {
		return store_board_title;
	}

	public void setStore_board_title(String store_board_title) {
		this.store_board_title = store_board_title;
	}

	public Date getStore_board_time() {
		return store_board_time;
	}

	public void setStore_board_time(Date store_board_time) {
		this.store_board_time = store_board_time;
	}

}
