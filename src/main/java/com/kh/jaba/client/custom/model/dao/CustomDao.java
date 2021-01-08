package com.kh.jaba.client.custom.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jaba.client.custom.model.domain.Custom;

@Repository("customDao")
public class CustomDao {
	@Autowired
	private SqlSession sqlSession;

	public List<Custom> selectCustomCategoryList(String menu_id) {
		return sqlSession.selectList("Custom.selectCustomCategoryList", menu_id);
	}
	
	public List<Custom> selectListByCustomCategory(Custom c){
		return sqlSession.selectList("Custom.selectListByCustomCategory", c);
	}
	
	public Custom selectOneCustom(Custom c) {
		return sqlSession.selectOne("Custom.selectOneCustom", c);
	}

}
