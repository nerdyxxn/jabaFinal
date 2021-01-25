package com.kh.jaba.admin.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jaba.admin.model.domain.Admin;

@Repository("adminDao")
public class AdminDao {
	@Autowired
	private SqlSession sqlSession;

	// admin 로그인
	public Admin loginAdmin(Admin a) {
		return sqlSession.selectOne("Admin.loginAdmin", a);
	}

	// admin email 중복체크
	public int adminCheckId(String admin_id) {
		return sqlSession.selectOne("Admin.adminCheckId", admin_id);
	}

}
