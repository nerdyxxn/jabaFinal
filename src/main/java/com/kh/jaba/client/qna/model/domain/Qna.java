package com.kh.jaba.client.qna.model.domain;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Qna {
	private String qna_no;
	private String admin_id;
	private String qna_title;
	private String qna_content;
	private Date qna_time;

	@Override
	public String toString() {
		return "Qna [qna_no=" + qna_no + ", admin_id=" + admin_id + ", qna_title=" + qna_title + ", qna_content="
				+ qna_content + ", qna_time=" + qna_time + "]";
	}

	public String getQna_no() {
		return qna_no;
	}

	public void setQna_no(String qna_no) {
		this.qna_no = qna_no;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public Date getQna_time() {
		return qna_time;
	}

	public void setQna_time(Date qna_time) {
		this.qna_time = qna_time;
	}

}
