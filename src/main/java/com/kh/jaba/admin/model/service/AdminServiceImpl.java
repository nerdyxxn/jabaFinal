package com.kh.jaba.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaba.admin.model.dao.AdminDao;
import com.kh.jaba.admin.model.domain.Admin;

@Service("adminService")
public class AdminServiceImpl  implements AdminService{
	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private Admin admin;
	
	// Admin 로그인
	@Override
	public Admin loginAdmin(String admin_id, String admin_pw) {
		admin.setAdmin_id(admin_id);
		admin.setAdmin_pw(admin_pw);
		
		return adminDao.loginAdmin(admin);
	}

	// Admin email 중복체크
	@Override
	public int adminCheckId(String admin_id) {
		return adminDao.adminCheckId(admin_id);
	}

}
