package com.kh.jaba.admin.client.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.jaba.client.model.domain.Client;
import com.kh.jaba.client.model.service.ClientService;

@Controller
public class AdminClientController {
	@Autowired
	private ClientService clientService;
	
	@Autowired
	private Client client;
	
	// 회원 이용 제제 
	@RequestMapping(value = "/admin/updateClientStatus.do", method = RequestMethod.POST)
	@ResponseBody
	public void menuSoldOutDo(HttpServletRequest request) {
		String client_id = request.getParameter("client_id");
		int client_status = Integer.parseInt(request.getParameter("client_status"));
		int result = 0;
		
		// client_status 의 상태 변경
		if(client_status == 1) {
			client_status = 2;
		}else {
			client_status = 1;
		}
		
		client.setClient_id(client_id);
		client.setClient_status(client_status);
		
		result = clientService.updateClientStatus(client);
		if(result == 1) {
			System.out.println(client_id + "의 회원상태를 " + client_status + "로 변경했습니다.");
		}else {
			System.out.println(client_id + "의 회원상태를 변경하지 못했습니다.");
		}
		

	}
	
	
	

}
