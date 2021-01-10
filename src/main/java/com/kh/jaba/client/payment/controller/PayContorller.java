package com.kh.jaba.client.payment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
}
