package com.kh.jaba.client.order.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.jaba.client.custom.model.domain.Custom;
import com.kh.jaba.client.custom.model.service.CustomService;
import com.kh.jaba.client.menu.model.domain.Menu;
import com.kh.jaba.client.order.model.domain.CustomCheck;
import com.kh.jaba.client.order.model.domain.Order;
import com.kh.jaba.client.order.model.service.CustomCheckService;

@Controller
public class CustomCheckController {
	@Autowired
	private CustomCheckService customCheckService;

	@Autowired
	private CustomService customService;

	@Autowired
	private CustomCheck customCheck;

	@Autowired
	private Custom custom;

	@RequestMapping(value = "order/insertCustomCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public void insertCustomCheckDo(HttpServletRequest request) {
		int result = 0;
		String menu_id = null;
		String order_id = null;

		String custom_name = request.getParameter("customCheckName");
		Menu menu = (Menu) request.getSession().getAttribute("menuVo");
		Order order = (Order) request.getSession().getAttribute("orderVo");

		if (menu != null && order != null) {
			menu_id = menu.getMenu_id();
			order_id = order.getOrder_id();
			custom.setMenu_id(menu_id);
			custom.setCustom_name(custom_name);
			System.out.println("선택된 custom_name : " + custom_name);
			custom = customService.selectOneCustom(custom);

			customCheck.setCustom_id(custom.getCustom_id());
			customCheck.setOrder_id(order_id);

			result = customCheckService.insertCustomCheck(customCheck);
			if (result == 1) {
				System.out.println("CustomCheck 에 insert 성공");
			} else {
				System.out.println("CustomCheck 에 insert 실패");
			}
		} else {
			System.out.println("session에서 menu와 order를 가져오지 못함");
		}

	}

}
