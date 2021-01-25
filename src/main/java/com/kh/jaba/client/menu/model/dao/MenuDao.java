package com.kh.jaba.client.menu.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jaba.client.menu.model.domain.Menu;

@Repository("menuDao")
public class MenuDao {

	@Autowired
	private SqlSession sqlSession;

	// store_id 로 해당메장의 모든 메뉴의 리스트를 불러오는 메소드
	public List<Menu> selectMenuList(String store_id) {
		return sqlSession.selectList("Menu.selectMenuList", store_id);
	}

	// 카테고리 이름을 가지고와서 List를 만드는 메소드
	// --> List<Menu>
	public List<Menu> selectCategoryList(String store_id) {
		return sqlSession.selectList("Menu.selectCategoryList", store_id);
	}

	// 카테고리 이름이 똑같은 메뉴들끼리 List를 만드는 메소드
	public List<Menu> selectListByCategory(Menu m) {
		return sqlSession.selectList("Menu.selectListByCategory", m);
	}

	// selectOneMenu
	public Menu selectOneMenu(Menu m) {
		return sqlSession.selectOne("Menu.selectOneMenu", m);
	}

	// selectMenuName menu_id 를 가지고 menu_name을 가져오는 메소드
	public String selectMenuName(String menu_id) {
		return sqlSession.selectOne("Menu.selectMenuName", menu_id);
	}

	// updateMenuAvailable
	public int updateMenuAvailable(Menu m) {
		return sqlSession.update("Menu.updateMenuAvailable", m);
	}

	// insertMenu
	public int insertMenu(Menu m) {
		return sqlSession.insert("Menu.insertMenu", m);
	}

	// 메뉴 디테일
	public Menu selectOneMenuByMenuId(String menu_id) {
		return sqlSession.selectOne("Menu.selectOneMenuByMenuId", menu_id);
	}

	// updateMenu
	public int updateMenu(Menu m) {
		return sqlSession.update("Menu.updateMenu", m);
	}

	// menu_status를 2로 변경하여 삭제처리
	public int deleteMenu(String menu_id) {
		return sqlSession.update("Menu.updateMenuStatus", menu_id);
	}
}
