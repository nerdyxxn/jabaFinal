package com.kh.jaba.explore.model.service;

import java.util.List;

import com.kh.jaba.explore.model.domain.Search;

public interface SearchService {

	// 브랜드 선택 시 store array list
	public List<Search> searchBrand(String store_name);
	
	// index에서 dropdown으로 뿌려줄 addr list
	public List<Search> checkAddr(String store_addr);
	
	// 주소 검색 시 store array list
	public List<Search> searchAddr(String store_addr);
	
	// 모든 store array list
	public List<Search> searchLoc();
}
