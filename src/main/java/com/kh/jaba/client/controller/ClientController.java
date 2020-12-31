package com.kh.jaba.client.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaba.client.model.domain.Client;
import com.kh.jaba.client.model.service.ClientService;


@Controller
public class ClientController {

	@Autowired
	private ClientService clientService;
	
	// storeService, adminService도 있어야함... 추후 추가
	
	@RequestMapping(value = "/client/clientLogin.do", method = RequestMethod.GET)
	public void clientLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String client_id = request.getParameter("email");
		String client_pw = request.getParameter("pw");
		PrintWriter out = response.getWriter();
		
		Client client = clientService.loginClient(client_id, client_pw);	// --> 수행하면 값이 있다면 Client 자료형으로 뭔가 나옵니다
		
		// id와 pw 정보가 client에 있는경우 
		if(client != null) {
			request.getSession().setAttribute("client", client);
			out.print("Client");
		}else {
//			// store 계정이 있는경우 
//			if() {
//				out.print("BizPartner");
//			}else {
//				// admin 계정에 있는경우
//				if() {
//					out.print("Admin");
//				}else {
//					// 해당하는게 전부 없는경우
//					out.print("NotExist");
//				}
//				
//			}
			out.print("NotExist");
		}
		
		
		// 여기서 호출을 해서 쓴다는건데.. 
		// 그러면 추가적인 작업이 있으면 다 컨트롤러에서 관리를 하나여?
		// 예를들어... 맨처음에 client 테이블 탐색, store테이블탐색, admin테이블탐색
		// --> 아무것도 없으면 일치하는 회원정보 없음
		out.flush();
		out.close();
	}
	
	// 로그인 버튼 클릭시 작동하는 메소드 
	
	// 
	
}
