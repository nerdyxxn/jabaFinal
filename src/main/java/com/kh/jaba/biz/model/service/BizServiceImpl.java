package com.kh.jaba.biz.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaba.biz.model.dao.BizDao;
import com.kh.jaba.biz.model.domain.Biz;

@Service("bizService")
public class BizServiceImpl implements BizService{
	@Autowired
	private BizDao bizDao;
	
	@Autowired
	private Biz biz;
	
	// Biz 로그인 
	@Override
	public Biz loginBiz(String store_id, String store_pw) {
		biz.setStore_id(store_id);
		biz.setStore_pw(store_pw);
		
		return bizDao.loginBiz(biz);
	}

	// biz email 중복체크
	@Override
	public int bizCheckId(String store_id) {
		return bizDao.bizCheckId(store_id);
	}

	// 스토어 name 으로 Biz를 반환 
	@Override
	public Biz selectStoreByName(String store_name) {
		// TODO Auto-generated method stub
		return bizDao.selectStoreByName(store_name);
	}

}
