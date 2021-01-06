package com.kh.jaba.biz.model.service;

import com.kh.jaba.biz.model.domain.Biz;

public interface BizService {
	
	// Biz 로그인 
	public Biz loginBiz(String store_id, String store_pw);
	
	// biz 중복체크
	public int bizCheckId(String store_id);
}
