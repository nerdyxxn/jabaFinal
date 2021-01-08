package com.kh.jaba.client.cart.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.jaba.biz.model.domain.Biz;
import com.kh.jaba.client.cart.model.Service.CartNoService;
import com.kh.jaba.client.cart.model.Service.CartService;
import com.kh.jaba.client.cart.model.domain.Cart;
import com.kh.jaba.client.cart.model.domain.CartNo;
import com.kh.jaba.client.order.model.domain.Order;

@Controller
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private CartNoService cartNoService;
	
	@Autowired
	private Cart cart;
	
	@Autowired
	private CartNo cartNo;

	@RequestMapping(value="/cart/insertCart.do", method = RequestMethod.POST)
	@ResponseBody
	public void insertCartDo(HttpServletRequest request) {
		String cartId = null;
		int cart_total_price = 0;
		int cartNoInsertresult = 0;
		int cartInsertresult = 0;
		
		String cartIdExist = (String)request.getSession().getAttribute("cartId");
		if( cartIdExist == null) {
			cartNoInsertresult = cartNoService.insertCartNo();	// 1 or 0 
			// insert 성공했으면
			if(cartNoInsertresult == 1) {
				cartNo = cartNoService.currentCartId();
			}
			System.out.println("생성된 cartId : " + cartNo.getCartno_id());
			request.getSession().setAttribute("cartId", cartNo.getCartno_id());
		}else {
			cartId = (String)request.getSession().getAttribute("cartId");
			System.out.println("세션에있는 cartId : " + cartId);
		}
		
		Order order = (Order)request.getSession().getAttribute("orderVo");
		// orderVo에 quantity와 order_id가 있음 
		String order_id = order.getOrder_id();
		
		// 세션에 담긴 storevo 를 참고해서 store_id를 가져옴 
		Biz biz = (Biz)request.getSession().getAttribute("storeVo");
		String store_id = biz.getStore_id();
		
		cart_total_price =  Integer.parseInt(request.getParameter("cart_total_price"));
		System.out.println("가져온 totalprice :  " + cart_total_price);
		cart.setOrder_id(order_id);
		cart.setCartno_id(cartNo.getCartno_id());
		cart.setStore_id(store_id);
		cart.setCart_total_price(cart_total_price);
		
		cartInsertresult = cartService.insertCart(cart);
		if(cartInsertresult == 1) {
			System.out.println("cart insert 성공 : " + cart.getCartno_id());
		}else {
			System.out.println("cart insert 실패");
		}
		
		// menu 와 order 세션에 남이있는것 remove
		request.getSession().removeAttribute("menuVo");
		request.getSession().removeAttribute("orderVo");
		
	}
	
}
