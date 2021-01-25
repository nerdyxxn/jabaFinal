package com.kh.jaba.client.paysearch.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaba.client.model.domain.Client;
import com.kh.jaba.client.paysearch.model.domain.PaySearchCollection;
import com.kh.jaba.client.paysearch.model.service.PaySearchService;

@Controller
public class PaySearchController {
	@Autowired
	private PaySearchService paySearchService;

	@RequestMapping(value = "/client/myOrderList.do", method = RequestMethod.GET)
	public ModelAndView selectPaySearch(HttpServletRequest request, ModelAndView mv) {
		Client client = (Client) request.getSession().getAttribute("client");
		String client_id = client.getClient_id();
		List<PaySearchCollection> paySearchList = paySearchService.getPaySearchList(client_id);

		System.out.println(paySearchList);
		for (int i = 0; i < paySearchList.size(); i++) {
			System.out.println("Pay 아이디: " + paySearchList.get(i).getPay_id());
			for (int j = 0; j < paySearchList.get(i).getMenuCollection().size(); j++) {
				System.out.println("메뉴 아이디: " + paySearchList.get(i).getMenuCollection().get(j).getOrder_id());
				System.out.println("메뉴 이름: " + paySearchList.get(i).getMenuCollection().get(j).getMenu_name());
				for (int k = 0; k < paySearchList.get(i).getMenuCollection().get(j).getCustomCollection().size(); k++) {
					System.out.println("커스텀 이름: " + paySearchList.get(i).getMenuCollection().get(j)
							.getCustomCollection().get(k).getCustom_name());
				}
			}
		}
		request.getSession().setAttribute("paySearchList", paySearchList);
		mv.setViewName("client/myOrderList");
		return mv;
	}

}
