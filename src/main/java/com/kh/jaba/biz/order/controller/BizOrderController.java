package com.kh.jaba.biz.order.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.jaba.client.payment.model.domain.Pay;
import com.kh.jaba.client.payment.model.service.PayService;

@Controller
public class BizOrderController {

	@Autowired
	private PayService payService;

	@Autowired
	private Pay pay;

	// 주문상태를 변경
	@RequestMapping(value = "/biz/orderStatusChange.do", method = RequestMethod.POST)
	@ResponseBody
	public void orderStatusChangeDo(HttpServletRequest request) {
		String pay_id = request.getParameter("pay_id");
		int result = 0;
		pay.setPay_id(pay_id);
		// pay_status 를 2로 바꿔줌
		pay.setPay_status(2);

		result = payService.updatePayStatus(pay);
		if (result == 1) {
			System.out.println(pay_id + "의 주문상태를 " + 2 + "로 변경완료");
		}

	}

}
