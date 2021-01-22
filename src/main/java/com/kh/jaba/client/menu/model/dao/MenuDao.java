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
	/*
	 * <!-- store 페이지 진입 시, 해당 store의 전체 menu list 출력 --> <!-- store_name을 통해
	 * store_id를 뽑아내는 과정이 필요 --> <select id="selectMenuList" parameterType="string"
	 * resultType="arraylist" resultMap="resultMenu"> select * from menu where
	 * store_id='%'||#{store_id}||'%' </select>
	 * 
	 * <!-- distinct를 통해 메뉴 카테고리의 중복을 제거하고, 카테고리 개수와 이름을 출력--> <select
	 * id="selectCategoryList" parameterType="string" resultType="arraylist"
	 * resultMap="resultMenu"> select distinct menu_category from menu where
	 * store_id='%'||#{store_id}||'%' </select>
	 * 
	 * <!-- store_id와 menu_category를 통해 menu list를 출력 --> <select
	 * id="selectListByCategory" parameterType="string" resultType="arraylist"
	 * resultMap="resultMenu"> select * from menu where
	 * store_id='%'||#{store_id}||'%' and menu_category='%'||#{menu_category}||'%'
	 * </select>
	 * 
	 * <!-- store_id과 menu_name을 통해 menu '하나'를 출력 --> <!-- menu_name 역시 unique -->
	 * <select id="selectOneMenu" parameterType="string" resultType="arraylist"
	 * resultMap="resultMenu"> select * from menu where
	 * store_id='%'||#{store_id}||'%' and menu_name='%'||#{menu_name}||'%' </select>
	 * 
	 * <!-- menu_id -> menu_name --> <select id="selectMenuName"
	 * parameterType="string" resultType="string"> select menu_name from menu where
	 * menu_id='%'||#{menu_id}||'%' </select>
	 */

	// 처음에 해당매장에있는 메뉴의 카테고리 리스트를 불러오고
	// 카테고리 리스트에 해당하는 메뉴의 리스트들을 각각 불러와여
	// List -- 카테고리별로 분류~~ --> List 각각 카테고리별로 분류된 메뉴리스트

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
