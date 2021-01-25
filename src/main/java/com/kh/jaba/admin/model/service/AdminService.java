package com.kh.jaba.admin.model.service;

import com.kh.jaba.admin.model.domain.Admin;

public interface AdminService {

	// Admin 로그인
	public Admin loginAdmin(String admin_id, String admin_pw);

	// admin email 중복체크
	public int adminCheckId(String admin_id);
}
