package com.kh.jaba.biz.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jaba.biz.model.domain.Biz;

@Repository("bizDao")
public class BizDao {
	@Autowired
	private SqlSession sqlSession;
	
	// biz 로그인
	public Biz loginBiz(Biz b) {
		return sqlSession.selectOne("Biz.loginStore", b);
	}

	// biz 중복체크
	public int bizCheckId(String store_id) {
		return sqlSession.selectOne("Biz.storeCheckId", store_id);
	}
}
