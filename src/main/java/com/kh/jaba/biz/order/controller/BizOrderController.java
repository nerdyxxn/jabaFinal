package com.kh.jaba.biz.order.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.jaba.client.payment.model.domain.Pay;
import com.kh.jaba.client.payment.model.service.PayService;

@Controller
public class BizOrderController {
	
	@Autowired
	private PayService payService;
	
	@Autowired
	private Pay pay;
	
	// 주문상태를 변경 
	@RequestMapping(value = "/biz/orderStatusChange.do", method = RequestMethod.GET)
	public void orderStatusChangeDo(HttpServletRequest request) {
		String pay_id = request.getParameter("pay_id");
		int pay_status = Integer.parseInt(request.getParameter("pay_status"));
		int result = 0;
		pay.setPay_id(pay_id);
		pay.setPay_status(pay_status);
		
		//TODO:pay_status 에 대한 처리를 해야함 일단 생략
		// 3단계 순서를 거칠거면 추가로 좀더 고민해야함 
		// pay_id가 맞는것의 pay_status를 변경
		result = payService.updatePayStatus(pay);
		if(result == 1) {
			System.out.println(pay_id + "의 주문상태를 " + pay_status + "로 변경완료");
		}
		
	}
	
	

}
