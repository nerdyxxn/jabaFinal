package com.kh.jaba.client.order.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.jaba.client.menu.model.domain.Menu;
import com.kh.jaba.client.model.domain.Client;
import com.kh.jaba.client.order.model.domain.Order;
import com.kh.jaba.client.order.model.service.OrderService;

@Controller
public class OrderController {
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private Order order;
	
	@RequestMapping(value = "/order/insertOrder.do", method = RequestMethod.POST)
	public void insertOrder(HttpServletRequest request, HttpServletResponse response) throws IOException {	
		PrintWriter out = response.getWriter();//요거 써서 @ResponseBody안쓰는 거거든

		try {
			int result = 0;
			Client client = (Client)request.getSession().getAttribute("client");
			String client_id = client.getClient_id();
			
			Menu menu = (Menu)request.getSession().getAttribute("menuVo");
			
			String menu_id = menu.getMenu_id();
			if(client_id != null) {
				int order_quantity = Integer.parseInt(request.getParameter("quantity"));
				
				// user_id와 menu_id 제대로 긁어오는지 테스트
				System.out.println("orderInsert서블릿 user_id : " + client_id);
				System.out.println("orderInsert서블릿 menu_id : " + menu_id);
				System.out.println("orderInsert서블릿 order_quantity : " + order_quantity);
				// 확인완료
				
				order.setClient_id(client_id);
				order.setMenu_id(menu_id);
				order.setOrder_quantity(order_quantity);
				
				result = orderService.insertOrder(order);
				
				if(result == 1) {
					// 최종결과가 order 를 다시 얻어와서 그걸 session에 담아줘야해요 
					// 도전
					//  현재 order_id를 가져오는 메소드
					order.setOrder_id(orderService.currentOrderId().getOrder_id());
					String order_id = order.getOrder_id();
					
					// 생성된 order_id로 OrderVO를 가져오는 메소드
					order = orderService.selectOneOrder(order_id);
					
					// order 정보를 OrderVo 데이터타입으로 세션에 저장
					request.getSession().setAttribute("orderVo", order);
				}else {
					System.out.println("order insert 실패");
				}
						
			}else {
				System.out.println("user_id가 없어서 orderInsert 실행하지 않음");
				out.print("OrderFail");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		out.flush();
		out.close();
	}

}
