package com.kh.jaba.explore.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jaba.explore.model.domain.Search;

@Repository("searchDao")
public class SearchDao {
	@Autowired
	private SqlSession sqlSession;
	
	// 브랜드 선택시 store array list
	public List<Search> searchBrand(String store_name){
		return sqlSession.selectList("selectStoresByBrand", store_name);
	}
	
	
}
