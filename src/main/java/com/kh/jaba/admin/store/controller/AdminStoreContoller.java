package com.kh.jaba.admin.store.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.jaba.client.menu.model.domain.Menu;
import com.kh.jaba.client.menu.model.service.MenuService;
import com.kh.jaba.client.model.domain.Client;

@Controller
public class AdminStoreContoller {
	@Autowired
	private MenuService menuService;

	@Autowired
	private Menu menu;

	// 메뉴 insert
	@RequestMapping(value = "/admin/store/insertMenu.do", method = RequestMethod.POST)
	@ResponseBody
	public void insertMenuDo(HttpServletRequest request) {
		String store_id = request.getParameter("store_id");
		String menu_name = request.getParameter("menu_name");
		int menu_price = Integer.parseInt(request.getParameter("menu_price"));
		String menu_img = request.getParameter("menu_img");
		String menu_description = request.getParameter("menu_description");
		String menu_category = request.getParameter("menu_category");
		int result = 0;
		// menu_name 중복 확인 해야함 
		
		// menu_img 가 null 이라면 기본값으로 셋팅해줘야함
		if(menu_img.equals("") || (menu_img == null)) {
			// 확인 필요
			menu_img = null;
		}
		menu.setStore_id(store_id);
		menu.setMenu_name(menu_name);
		menu.setMenu_price(menu_price);
		menu.setMenu_img(menu_img);
		menu.setMenu_description(menu_description);
		menu.setMenu_category(menu_category);

		result = menuService.insertMenu(menu);
		if(result == 1) {
			System.out.println(store_id + "의 메뉴 " + menu_name + " 추가 완료");
		}else {
			System.out.println(store_id + "의 메뉴 " + menu_name + " 추가 실패");
		}

	}

}
