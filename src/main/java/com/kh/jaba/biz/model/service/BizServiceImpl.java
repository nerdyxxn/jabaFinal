package com.kh.jaba.biz.model.service;

import java.util.List;

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

	// 스토어 open close 
	@Override
	public int updateStoreStatus(Biz b) {
		return bizDao.updateStoreStatus(b);
	}

	// 전체 매장 수 조회
	@Override
	public int countTotalBiz() {
		return bizDao.countTotalBiz();
	}

	// 전체 매장 조회
	@Override
	public List<Biz> selectAllStore() {
		// TODO Auto-generated method stub
		return bizDao.selectAllStore();
	}

	// 매장 Detail 정보 수정
	@Override
	public int updateStoreDetail(Biz b) {
		return bizDao.updateStoreDetail(b);
	}

}
