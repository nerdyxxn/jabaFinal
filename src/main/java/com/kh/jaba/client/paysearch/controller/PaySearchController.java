package com.kh.jaba.client.paysearch.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaba.client.custom.model.domain.Custom;
import com.kh.jaba.client.menu.model.domain.MenuCollection;
import com.kh.jaba.client.model.domain.Client;
import com.kh.jaba.client.order.model.domain.CustomCheck;
import com.kh.jaba.client.paysearch.model.domain.PaySearch;
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
//		List<PaySearch> paySearchList = paySearchService.selectPaySearch(client_id);
//
//		if (paySearchList != null) {
//			System.out.println("PaySearchList에 들어있는 리스트");
//			// menu.jsp 에서 cartList 가 있는지 없는지 확인하기 위해 사용
//			request.getSession().setAttribute("paySearchList", paySearchList);
//			paySearchListByPayId(paySearchList);
//			//sortPaySearchCustomName(paySearchListByPayId(paySearchList));
//		}
		List<PaySearchCollection> paySearchList = paySearchService.getPaySearchList(client_id);
//		List<MenuCollection> menuCollection = null;
//		List<List<MenuCollection>> menuList = null;
//		List<Custom> customCollection = null;
//		List<List<Custom>> customList = null;
//		for(int i = 0; i < paySearchList.size(); i++) {
//			String pay_id = paySearchList.get(i).getPay_id();
//			menuCollection = paySearchService.getMenuList(pay_id);
//			menuList.add(menuCollection);
//			for(int j = 0; j < paySearchList.get(i).getMenuCollection().size(); j++) {
//				String order_id = menuCollection.get(j).getOrder_id();
//				customCollection = paySearchService.getCustomList(order_id); 
//				customList.add(customCollection);		
//			}
//		}
		// boardAll = patSearchList
		System.out.println(paySearchList);
	      for(int i = 0 ; i<paySearchList.size(); i++) {
	          System.out.println("Pay 아이디: " + paySearchList.get(i).getPay_id());
	          for(int j = 0; j < paySearchList.get(i).getMenuCollection().size(); j++) {
	             System.out.println("메뉴 아이디: " + paySearchList.get(i).getMenuCollection().get(j).getOrder_id());
	             System.out.println("메뉴 이름: " + paySearchList.get(i).getMenuCollection().get(j).getMenu_name());
	             for(int k = 0; k < paySearchList.get(i).getMenuCollection().get(j).getCustomCollection().size(); k++) {
	                System.out.println("커스텀 이름: " + paySearchList.get(i).getMenuCollection().get(j).getCustomCollection().get(k).getCustom_name());
//	                System.out.println("i, j, k : " + i + ", " + j + ", "+ k);
	             }
	          }
	       }
		request.getSession().setAttribute("paySearchList", paySearchList);
		mv.setViewName("client/myOrderList");
		return mv;
	}

	// paySearchList 안에 존재하는 pay_id를 가지고 같은 pay_id를 공유하는 메뉴 이름 리스트를 sort하는 메소드
//	public List<List<PaySearch>> paySearchListByPayId(List<PaySearch> paySearchList) {
//		List<List<PaySearch>> paySearchListList = new ArrayList<List<PaySearch>>();
//		String pay_id = paySearchList.get(0).getPay_id();
//		System.out.println("paySearchList 사이즈 : "+paySearchList.size());
//		for (int i = 0; i < paySearchList.size(); i++) {
//			if (pay_id.equals(paySearchList.get(i).getPay_id())) {
//				// 같으면 담고, 다르면 새로운 paySearchListList를 생성
//				paySearchListList.add(paySearchList);
//				System.out.println("열려있던 paySearchListList에 싣는다.");
//			} else {
//				paySearchListList = new ArrayList<List<PaySearch>>();
//				paySearchListList.add(paySearchList);
//				System.out.println("----------새로 열어서----------  paySearchListList에 싣는다.");
//				pay_id = paySearchList.get(i).getPay_id();
//			}
//
//		}
//		System.out.println("paySearchListList 사이즈 : "+paySearchListList.size());
//		for(int i = 0; i < paySearchListList.size(); i++) {
//				System.out.println(paySearchListList.get(i).get(0).getMenu_name());
//				System.out.println("===============================================");
//			for(int j = 0; j < paySearchListList.get(i).size(); j++) {
//				System.out.println("i, j = "+ i +", " + j);
//				System.out.println(paySearchListList.get(i).get(j).getCustom_name());
//			}
//		}
//		return paySearchListList;
//	}

//	public List<List<List<PaySearch>>> sortPaySearchCustomName(List<List<PaySearch>> paySearchListList) {
//		List<List<List<PaySearch>>> paySearchListListList = new ArrayList<List<List<PaySearch>>>();
//		String order_id = paySearchListList.get(0).get(0).getOrder_id();
//		for (int i = 0; i < paySearchListList.size(); i++) {
//				for (int j = 0; j < paySearchListList.get(i).size(); j++) {
//					if (order_id == paySearchListList.get(i).get(j).getOrder_id()) {
//						paySearchListListList.add(paySearchListList);
//					} else {
//						paySearchListListList = new ArrayList<List<List<PaySearch>>>();
//						paySearchListListList.add(paySearchListList);
//						order_id = paySearchListList.get(i).get(j).getOrder_id();
//					}
//				}
//		}
//		for(int i = 0; i < paySearchListListList.size(); i++) {
//			for(int j = 0; j < paySearchListListList.get(i).size(); j++) {
//				System.out.println("========================================================");					
//				System.out.println(paySearchListListList.get(i).get(j).get(0).getMenu_name());					
//				for(int k = 0; k < paySearchListListList.get(i).get(j).size(); k++) {
//					System.out.println(paySearchListListList.get(i).get(j).get(k).getCustom_name());					
//				}
//				
//			}
//		}
//		return paySearchListListList;
//	}
}
