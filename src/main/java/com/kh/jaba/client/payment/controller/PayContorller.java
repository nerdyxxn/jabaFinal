package com.kh.jaba.client.payment.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaba.client.payment.model.domain.Pay;
import com.kh.jaba.client.payment.model.service.PayService;

@Controller
public class PayContorller {

	@Autowired
	private PayService payService;

	@Autowired
	private Pay pay;

	// /payment/checkout.do 로 이동
	@RequestMapping(value = "/payment/checkout.do", method = RequestMethod.GET)
	public ModelAndView checkout(ModelAndView mv) {
		mv.setViewName("pay/pay");
		return mv;
	}

	// insert Pay
	@RequestMapping(value = "/payment/pay.do", method = RequestMethod.POST)
	@ResponseBody
	public void insertPayDo(HttpServletRequest request) {
		String pay_request = request.getParameter("pay_request");
		String cartno_id = (String) request.getSession().getAttribute("cartId");
		String pickup_time = request.getParameter("pickup_time");
		int pay_total_price = (int) request.getSession().getAttribute("total_price");
		int result = 0;

		if ((pay_request != null) && (cartno_id != null) && (pay_total_price != 0) && (pickup_time != null)) {
			System.out.println("cart_id : " +  cartno_id);
			System.out.println("총가격 : " + pay_total_price);
			System.out.println("요청사항 : " + pay_request);
			System.out.println("Pickup Time : " + pickup_time);
			
			pay.setCartno_id(cartno_id);
			pay.setPay_request(pay_request);
			pay.setPay_total_price(pay_total_price);
			pay.setPickup_time(pickup_time);
			result = payService.insertPayment(pay);
			if(result == 1) {
				System.out.println(cartno_id + "의 결제가 완료되었습니다.");
			}else {
				System.out.println(cartno_id + "의 결제가 실패되었습니다.");
			}
			// cartId, total_price,storeVo,cartViewList,cartList,cartViewVoList REMOVE
			request.getSession().removeAttribute("cartId");
			request.getSession().removeAttribute("total_price");
			request.getSession().removeAttribute("storeVo");
			request.getSession().removeAttribute("cartViewList");
			request.getSession().removeAttribute("cartList");
			request.getSession().removeAttribute("cartViewVoList");
		}else {
			System.out.println("필요한 값이 세션에 없습니다.");
		}

	}

}
