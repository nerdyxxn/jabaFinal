package com.kh.jaba.explore.model.service;

import java.util.List;

import com.kh.jaba.explore.model.domain.Search;

public interface SearchService {

	// 브랜드 선택시 store array list
	public List<Search> searchBrand(String store_name);
}
