package com.kh.jaba.client.cart.controller;

import java.util.ArrayList;
import java.util.List;

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
import com.kh.jaba.client.cart.model.domain.CartView;
import com.kh.jaba.client.custom.model.domain.Custom;
import com.kh.jaba.client.custom.model.service.CustomService;
import com.kh.jaba.client.menu.model.service.MenuService;
import com.kh.jaba.client.order.model.domain.CustomCheck;
import com.kh.jaba.client.order.model.domain.Order;
import com.kh.jaba.client.order.model.service.CustomCheckService;
import com.kh.jaba.client.order.model.service.OrderService;

@Controller
public class CartController {

	@Autowired
	private CartService cartService;

	@Autowired
	private CartNoService cartNoService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private MenuService menuService;

	@Autowired
	private CustomService customService;

	@Autowired
	private CustomCheckService customCheckService;

	@Autowired
	private Cart cart;

	@Autowired
	private CartNo cartNo;

	@Autowired
	private CartView cartView;

	@Autowired
	private Order order;

	@Autowired
	private Custom custom;

	@RequestMapping(value = "/cart/insertCart.do", method = RequestMethod.POST)
	@ResponseBody
	public void insertCartDo(HttpServletRequest request) {
		String cartId = null;
		int cart_total_price = 0;
		int cartNoInsertresult = 0;
		int cartInsertresult = 0;

		String cartIdExist = (String) request.getSession().getAttribute("cartId");
		if (cartIdExist == null) {
			cartNoInsertresult = cartNoService.insertCartNo(); // 1 or 0
			// insert 성공했으면
			if (cartNoInsertresult == 1) {
				cartNo = cartNoService.currentCartId();
			}
			System.out.println("생성된 cartId : " + cartNo.getCartno_id());
			request.getSession().setAttribute("cartId", cartNo.getCartno_id());
		} else {
			cartId = (String) request.getSession().getAttribute("cartId");
			System.out.println("세션에있는 cartId : " + cartId);
		}

		Order order = (Order) request.getSession().getAttribute("orderVo");
		// orderVo에 quantity와 order_id가 있음
		String order_id = order.getOrder_id();

		// 세션에 담긴 storevo 를 참고해서 store_id를 가져옴
		Biz biz = (Biz) request.getSession().getAttribute("storeVo");
		String store_id = biz.getStore_id();

		cart_total_price = Integer.parseInt(request.getParameter("cart_total_price"));
		System.out.println("가져온 totalprice :  " + cart_total_price);
		cart.setOrder_id(order_id);
		cart.setCartno_id(cartNo.getCartno_id());
		cart.setStore_id(store_id);
		cart.setCart_total_price(cart_total_price);

		cartInsertresult = cartService.insertCart(cart);
		if (cartInsertresult == 1) {
			System.out.println("cart insert 성공 : " + cart.getCartno_id());
		} else {
			System.out.println("cart insert 실패");
		}

		// menu 와 order 세션에 남이있는것 remove
		request.getSession().removeAttribute("menuVo");
		request.getSession().removeAttribute("orderVo");

	}

	// 카트 리스트를 불러오는 메소드
	@RequestMapping(value = "/cart/selectCart.do", method = RequestMethod.POST)
	@ResponseBody
	public void cartSelectDo(HttpServletRequest request) {
		List<Cart> cartList = null;
		List<CartView> cartViewList = null;
		List<List<String>> cartViewCustomList = null;
		int total_price = 0;
		// 세션에 담긴 cartNo를 받아온다.
		// cartNo를 통해 List<Cart> cartList 를 받아와서 세션에 저장한다.
		String cartno_id = (String) request.getSession().getAttribute("cartId");
		// cartno_id가 있을경우에만 실행
		if (cartno_id != null) {
			cartList = cartService.selectCartList(cartno_id);
		} else {
			System.out.println("장바구니가 생성되지 않았거나 cartno_id를 불러오지 못했습니다.");
		}
//		System.out.println(cartList.get(0).getCartno_id());
		// cartList가 null 이 아니라면
		if (cartList != null) {
			System.out.println("카트에 들어있는 카트리스트");
			// menu.jsp 에서 cartList 가 있는지 없는지 확인하기 위해 사용
			request.getSession().setAttribute("cartList", cartList);

			cartViewList = cartViewList(cartList);
			if (cartViewList != null) {
				cartViewCustomList = cartViewCustomList(cartViewList, cartList);
				// cartViewList 세션에 저장
				request.getSession().setAttribute("cartViewVoList", cartViewList);
				// 잘 불러오는지 테스트
				for (int i = 0; i < cartViewList.size(); i++) {
					System.out.println("----------------------");
					System.out.println(cartViewList.get(i).getMenu_name());
					System.out.println("----------------------");
					for (int j = 0; j < cartViewCustomList.get(i).size(); j++) {
						System.out.println(cartViewCustomList.get(i).get(j));
					}
					System.out.println();
				}
				// 총 가격 계산
				total_price = 0;
				for (int i = 0; i < cartViewList.size(); i++) {
					total_price += cartViewList.get(i).getCart_total_price();
				}
				request.getSession().setAttribute("total_price", total_price);

				// cartViewList 세션에 저장
				request.getSession().setAttribute("cartViewList", cartViewCustomList);
			}

		} else {
			// cartList 가 null 이면
			System.out.println("카트에 담긴것이 없거나 리스트를 찾을 수 없습니다.");
		}

	}
	
	@RequestMapping(value = "/cart/deleteCart.do", method = RequestMethod.POST)
	@ResponseBody
	public void updateCartCheckDo(HttpServletRequest request) {
		// order_id 를 어떻게 찾아올건가 .. ? 
		String order_id = request.getParameter("orderId");
		// order_id를 찾아서 cart 테이블의 cart_check 를 2로 바꾼다.
		cartService.updateCartCheck(order_id);
		System.out.println(order_id + "의 주문을 cart에서 삭제했습니다.");
		// updateCartCheckDo
	}
	
	
	

	// cartList 를 참고하여 cartViewList 를 만드는 메소드
	public List<CartView> cartViewList(List<Cart> cartList) {
		List<CartView> cartViewList = null;
		String order_id = null;
		int cart_total_price = 0;

		cartViewList = new ArrayList<CartView>();
		for (int i = 0; i < cartList.size(); i++) {
			System.out.println((i + 1) + "번째 order의 cart");
			order_id = cartList.get(i).getOrder_id();
			cart_total_price = cartList.get(i).getCart_total_price();
			
//			CartView cartView = new CartView();	// autowired 를 쓰면 이상하게 나오는 오류 해결해야함
			cartView = new CartView();
			cartView.setCart_total_price(cart_total_price);
			// order_id 들고 order에 갔다오면 order 하나가 나올거고
			// order를 참고하면 바로 order_quantity를 얻을 수 있음
			order = orderService.selectOneOrder(order_id);
			cartView.setOrder_quantity(order.getOrder_quantity());
			// order를 참고하면 바로 order_id를 얻을 수 있음
			cartView.setOrder_id(order.getOrder_id());
			// menu_id를 가지고 menu_name을 뽑아내는 메소드
			String menu_name = menuService.selectMenuName(order.getMenu_id());
			System.out.println("메뉴이름 : " +  menu_name);
			cartView.setMenu_name(menu_name);

			cartViewList.add(cartView);
		}
		
		return cartViewList;
	}

	// List<List<String>> cartViewCustomList 를 List<CartView> cartViewVoList,
	// List<Cart> cartList 로 뽑아내는 메소드
	public List<List<String>> cartViewCustomList(List<CartView> cartViewList, List<Cart> cartList) {
		List<List<String>> cartViewCustomList = null;

		cartViewCustomList = new ArrayList<List<String>>();
		for (int i = 0; i < cartViewList.size(); i++) {
			List<String> customNameList = new ArrayList<String>();
			// order_id를 통해서 custom_check 테이블을 조회한 다음에 List<Custom> 형식인 custom_id를 뽑아내야해요
			List<CustomCheck> customCheckList = customCheckService.selectCustomCheckListByOrderId(cartList.get(i).getOrder_id());
			for (int j = 0; j < customCheckList.size(); j++) {
				// custom id를 통해서 custom name을 뽑아냄
				custom = customService.selectOneCustomByCustomId(customCheckList.get(j).getCustom_id());
				String custom_name = custom.getCustom_name();
				customNameList.add(custom_name);
			}
			cartViewCustomList.add(customNameList);
		}
		return cartViewCustomList;
	}

}
