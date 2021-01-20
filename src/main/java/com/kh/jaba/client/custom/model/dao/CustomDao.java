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

	public Custom selectOneCustomByCustomId(String custom_id) {
		return sqlSession.selectOne("Custom.selectOneCustomByCustomId", custom_id);
	}
	
	public List<Custom> selectListByMenuId(String menu_id){
		return sqlSession.selectList("Custom.selectListByMenuId", menu_id);
	}
	
	 // custom 한개의 정보를 변경
	   public int updateCustom(Custom c) {
	      return sqlSession.update("Custom.updateCustom", c);
	   }
}
