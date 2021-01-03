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

import com.kh.jaba.admin.model.domain.Admin;
import com.kh.jaba.admin.model.service.AdminService;
import com.kh.jaba.biz.model.domain.Biz;
import com.kh.jaba.biz.model.service.BizService;
import com.kh.jaba.client.model.domain.Client;
import com.kh.jaba.client.model.service.ClientService;

@Controller
public class ClientController {

	@Autowired
	private ClientService clientService;
	@Autowired
	private BizService bizService;
	@Autowired
	private AdminService adminService;

	// storeService, adminService도 있어야함... --> 추가완료
	@RequestMapping(value = "/client/clientLogin.do", method = RequestMethod.GET)
	public void clientLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String client_id = request.getParameter("email");
		String client_pw = request.getParameter("pw");
		PrintWriter out = response.getWriter();

		Client client = clientService.loginClient(client_id, client_pw); // --> 수행하면 값이 있다면 Client 자료형으로 뭔가 나옵니다

		// id와 pw 정보가 client에 있는경우
		if (client != null) {
			System.out.println("로그인 성공 client_id : " + client.getClient_id());
			request.getSession().setAttribute("client", client);
			out.print("Client");
		} else {
			Biz biz = bizService.loginBiz(client_id, client_pw);
			// id와 pw 정보가 biz에 있는경우
			if (biz != null) {
				System.out.println("로그인 성공 biz_id : " + biz.getStore_id());
				request.getSession().setAttribute("biz", biz);
				out.print("BizPartner");
			} else {
				Admin admin = adminService.loginAdmin(client_id, client_pw);
				// id와 pw 정보가 admin에 있는경우
				if (admin != null) {
					System.out.println("로그인 성공 admin_id : " + admin.getAdmin_id());
					request.getSession().setAttribute("admin", admin);
					out.print("Admin");
					// id와 pw 정보가 없는 경우
				} else {
					out.print("NotExist");
				}
			}
		}
		// 여기서 호출을 해서 쓴다는건데..
		// 그러면 추가적인 작업이 있으면 다 컨트롤러에서 관리를 하나여?
		// 예를들어... 맨처음에 client 테이블 탐색, store테이블탐색, admin테이블탐색
		// --> 아무것도 없으면 일치하는 회원정보 없음
		out.flush();
		out.close();
	}

	// 클라이언트 로그아웃
	@RequestMapping(value = "/client/clientLogout.do", method = RequestMethod.GET)
	public void clientLogout(HttpServletRequest request) {
		// if client가 있다면 ~~~~
		// session에서 로그아웃 기능 제대로 작동 그러나 jsp가 작동을 하지않음
		request.getSession().removeAttribute("client");
		System.out.println("클라이언트 로그아웃");
	}

	// 회원가입
	@RequestMapping(value = "/client/clientRegister.do", method = RequestMethod.GET)
	public void clientRegister(Client c) {
		int result = clientService.insertClient(c);
		if (result == 1) {
			System.out.println("회원가입 성공 client_id : " + c.getClient_id());
		} else {
			System.out.println("회원가입 실패");
		}

	}

	// ID중복체크
	@RequestMapping(value = "/client/clientCheckId.do", method = RequestMethod.GET)
	public void clientCheckId(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		// ajax 에서 emailRegister 로 보내온 email을 받아옴
		String checkEmail = request.getParameter("emailRegister");
		// client, biz, admin에 모두 email이 없는경우
		if (clientService.clientCheckId(checkEmail) == 0 && bizService.bizCheckId(checkEmail) == 0 && adminService.adminCheckId(checkEmail) == 0) {
			out.print("ok");
			System.out.println("사용가능한 email입니다.");
			// 중복된 email인 경우
		} else {
			out.print("no");
			System.out.println("사용불가능한 email입니다.");
		}
		out.flush();
		out.close();
	}

}
