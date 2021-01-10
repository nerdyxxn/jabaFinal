package com.kh.jaba.client.menu.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaba.client.menu.model.dao.MenuDao;
import com.kh.jaba.client.menu.model.domain.Menu;

@Service("menuService")
public class MenuServiceImpl implements MenuService{
	
	@Autowired
	private MenuDao menuDao;
	
	@Autowired
	private Menu menu;

	@Override
	public List<Menu> selectMenuList(String store_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Menu> selectCategoryList(String store_id) {
		return menuDao.selectCategoryList(store_id);
	}

	// 카테고리 이름이 똑같은 메뉴들끼리 List를 만드는 메소드 
	@Override
	public List<Menu> selectListByCategory(Menu m) {
		return menuDao.selectListByCategory(m);
	}

	// selectOneMenu
	@Override
	public Menu selectOneMenu(Menu m) {
		return menuDao.selectOneMenu(m);
	}

	// selectMenuName menu_id 를 가지고 menu_name을 가져오는 메소드
	@Override
	public String selectMenuName(String menu_id) {
		return menuDao.selectMenuName(menu_id);
	}


}
