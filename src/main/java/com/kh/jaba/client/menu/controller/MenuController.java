package com.kh.jaba.client.menu.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaba.biz.model.domain.Biz;
import com.kh.jaba.biz.model.service.BizService;
import com.kh.jaba.client.menu.model.domain.Menu;
import com.kh.jaba.client.menu.model.service.MenuService;

@Controller
public class MenuController {

	@Autowired
	private BizService bizService;

	@Autowired
	private MenuService menuService;

	@Autowired
	private Menu menu;

	private static final Logger logger = LoggerFactory.getLogger(MenuController.class);

	@RequestMapping(value = "/menu/menuList.do")
	public ModelAndView menuListDo(ModelAndView mv, HttpServletRequest request) {
		logger.info("----- menuListDo Controller 진입 -----");
		String store_name = request.getParameter("storename");
		System.out.println(store_name);
		System.out.println(store_name + "의 vo 정보를 가져옴");

		// 서비스~ store_name으로 store 의 정보를 받아오는 부분
		Biz biz = bizService.selectStoreByName(store_name);
		if (biz == null) {
			System.out.println("해당하는 store 정보 없음");
		} else {
			request.getSession().setAttribute("storeVo", biz); // 찾아온 값을 menu.jsp로 넘겨주기위해 세션에 설정해줌
		}

		List<List<Menu>> sortList = selectMenuListList(biz.getStore_id());
		request.getSession().setAttribute("sortList", sortList);
		// 클릭된 스토어의 store_id로
		// 해당 스토어의 메뉴들을(List<List<MenuVO>> 형태) session에 담는다.
		// List<List<MenuVO>> sortList = mService.selectmenuListList(store_id);

		// 매장 게시판~~ 관련부분

		mv.setViewName("menu/menu");
		return mv;
		// ----- index 진입 ----- 이 계속나옴 why?
	}

	public List<List<Menu>> selectMenuListList(String store_id) {
		List<List<Menu>> sortList = null;

		List<Menu> categoryList = menuService.selectCategoryList(store_id);
		if (categoryList != null) {
			for (int i = 0; i < categoryList.size(); i++) {
				System.out.println("카테고리이름 : " + categoryList.get(i).getMenu_category());
			}
		}

		// sortList 객체 생성
		sortList = new ArrayList<List<Menu>>();
		// 사이즈 categoryList 만큼 반복
		for (int i = 0; i < categoryList.size(); i++) {
			// menu autowired
			menu.setMenu_category(categoryList.get(i).getMenu_category());
			menu.setStore_id(categoryList.get(i).getStore_id());
			List<Menu> list = menuService.selectListByCategory(menu); // 여기서 param 을 m으로 보내줘야하는데
			sortList.add(list);
		}
		return sortList;
	}

}
