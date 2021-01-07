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
	/*<!-- store 페이지 진입 시, 해당 store의 전체 menu list 출력 -->
	<!-- store_name을 통해 store_id를 뽑아내는 과정이 필요 -->
	<select id="selectMenuList" parameterType="string" resultType="arraylist" resultMap="resultMenu">
		select * from menu where store_id='%'||#{store_id}||'%'
	</select>
	
	<!-- distinct를  통해 메뉴 카테고리의 중복을 제거하고, 카테고리 개수와 이름을 출력-->
	<select id="selectCategoryList" parameterType="string" resultType="arraylist" resultMap="resultMenu">
		select distinct menu_category from menu where store_id='%'||#{store_id}||'%'
	</select>
	
	<!-- store_id와 menu_category를 통해 menu list를 출력 -->
	<select id="selectListByCategory" parameterType="string" resultType="arraylist" resultMap="resultMenu">
		select * from menu where store_id='%'||#{store_id}||'%' and menu_category='%'||#{menu_category}||'%'
	</select>
	
	<!-- store_id과 menu_name을 통해 menu '하나'를 출력 -->
	<!-- menu_name 역시 unique -->
	<select id="selectOneMenu" parameterType="string" resultType="arraylist" resultMap="resultMenu">
		select * from menu where store_id='%'||#{store_id}||'%' and menu_name='%'||#{menu_name}||'%'
	</select>
	
	<!-- menu_id -> menu_name  -->
	<select id="selectMenuName" parameterType="string" resultType="string">
		select menu_name from menu where menu_id='%'||#{menu_id}||'%'
	</select>*/
	// store 진입 시 해당 store menu list
	public List<Menu> selectMenuList(String store_id){
		return sqlSession.selectList("selectMenuList", store_id);
	}
	
	
}
