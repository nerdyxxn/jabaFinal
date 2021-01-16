package com.kh.jaba.client.paysearch.model.service;

import java.util.List;

import com.kh.jaba.client.custom.model.domain.Custom;
import com.kh.jaba.client.menu.model.domain.MenuCollection;
import com.kh.jaba.client.paysearch.model.domain.PaySearch;
import com.kh.jaba.client.paysearch.model.domain.PaySearchCollection;

public interface PaySearchService {
	
	public List<PaySearch> selectPaySearch(String client_id);
	
	public List<PaySearchCollection> getPaySearchList(String client_id);
	
	public List<PaySearchCollection> getSalesList(String store_name);
	
	public List<MenuCollection> getMenuList(String pay_id);
	
	public List<Custom> getCustomList(String order_id);
}
