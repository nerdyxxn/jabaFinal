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
	
	// index에서 dropdown으로 뿌려줄 addr list
	public List<Search> checkAddr(String store_addr){
		return sqlSession.selectList("checkAddr", store_addr);
	}
	
	// 주소 검색시 store array list
	public List<Search> searchAddr(String store_addr){
		return sqlSession.selectList("selectStoresByAddr", store_addr);
	}
	
	// 모든 storelist 출력
	public List<Search> searchLoc(){
		return sqlSession.selectList("selectStoresByLoc");
	}
	
	
}
