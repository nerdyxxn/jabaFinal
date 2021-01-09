package com.kh.jaba.client.payment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.jaba.client.payment.model.domain.Pay;
import com.kh.jaba.client.payment.model.service.PayService;

@Controller
public class PayContorller {
	
	@Autowired
	private PayService payService;
	
	@Autowired
	private Pay pay;


}
