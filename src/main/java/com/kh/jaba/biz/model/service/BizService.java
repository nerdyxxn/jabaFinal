package com.kh.jaba.biz.model.service;

import com.kh.jaba.biz.model.domain.Biz;

public interface BizService {
	
	// Biz 로그인 
	public Biz loginBiz(String store_id, String store_pw);
	
	// biz 중복체크
	public int bizCheckId(String store_id);
	
	// 스토어 name 으로 Biz를 반환 
	public Biz selectStoreByName(String store_name);
	
	// 스토어 open close 
	public int updateStoreStatus(Biz b);
}
