package com.kh.jaba.client.menu.model.service;

import java.util.List;

import com.kh.jaba.client.menu.model.domain.Menu;

public interface MenuService {
	
	// store_id 로 해당메장의 모든 메뉴의 리스트를 불러오는 메소드 
	public List<Menu> selectMenuList(String store_id);	
	
	// 카테고리 이름을 가지고와서 List를 만드는 메소드
	// --> List<Menu> 
	public List<Menu> selectCategoryList(String store_id);
	
	// 카테고리 이름이 똑같은 메뉴들끼리 List를 만드는 메소드 
	public List<Menu> selectListByCategory(Menu m);
	

}
