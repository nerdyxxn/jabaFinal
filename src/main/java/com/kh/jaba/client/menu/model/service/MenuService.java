package com.kh.jaba.client.menu.model.service;

import java.util.List;

import com.kh.jaba.client.menu.model.domain.Menu;

public interface MenuService {
	
	public List<Menu> menuList(String store_id);
	
	public List<Menu> selectMenu(String menu_id);

}
