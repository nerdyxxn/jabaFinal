package com.kh.jaba.client.paysearch.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jaba.client.custom.model.domain.Custom;
import com.kh.jaba.client.menu.model.domain.MenuCollection;
import com.kh.jaba.client.paysearch.model.domain.PaySearch;
import com.kh.jaba.client.paysearch.model.domain.PaySearchCollection;

@Repository("paySearchDao")
public class PaySearchDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<PaySearch> selectPaySearch(String client_id){
		return sqlSession.selectList("PaySearch.selectPaySearch", client_id);
	}
	
	public List<PaySearchCollection> getPaySearchList(String client_id){
		return sqlSession.selectList("PaySearchCollection.getPaySearchList", client_id);
	}
	
	public List<MenuCollection> getMenuList(String pay_id){
		return sqlSession.selectList("PaySearchCollection.getMenuList", pay_id);
	}
	
	public List<Custom> getCustomList(String order_id){
		return sqlSession.selectList("PaySearchCollection.getCustomList", order_id);
	}
	
}
