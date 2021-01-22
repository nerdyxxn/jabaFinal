package com.kh.jaba.explore.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaba.explore.model.dao.SearchDao;
import com.kh.jaba.explore.model.domain.Search;

@Service("searchService")
public class SearchServiceImpl implements SearchService{
	@Autowired
	private SearchDao searchDao;
	
	@Autowired
	private Search search;
	
	// 브랜드 선택 시 store array list
	@Override
	public List<Search> searchBrand(String store_name) {
		return searchDao.searchBrand(store_name);
	}
	// 주소 검색 시 store array list
	@Override
	public List<Search> searchAddr(String store_addr) {
		
		return searchDao.searchAddr(store_addr);
	}
	@Override
	public List<Search> checkAddr(String store_addr) {
		
		return searchDao.checkAddr(store_addr);
	}
	@Override
	public List<Search> searchLoc() {
		return searchDao.searchLoc();
	}

}
