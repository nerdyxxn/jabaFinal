package com.kh.jaba.index.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaba.biz.model.domain.Biz;
import com.kh.jaba.client.model.domain.Client;
import com.kh.jaba.explore.model.domain.Search;
import com.kh.jaba.explore.model.service.SearchService;

@Controller
public class IndexController {

	@Autowired
	private SearchService searchService;

	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);

	// 단지 index페이지를 띄워주는행동만 함
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView index(ModelAndView mv) {
		logger.info("----- index 진입 -----");
		mv.setViewName("index");
		return mv;
	}

	@RequestMapping(value = "/client/loginCheck.do", method = RequestMethod.GET)
	public void loginCheckDo(HttpServletRequest request, HttpServletResponse response, ModelAndView mv)
			throws IOException {
		PrintWriter out = response.getWriter();
		if (loginCheck(request)) {
			out.print("KeepLogin");
		} else {
			System.out.println("KeepLogin 없음");
		}
		out.flush();
		out.close();
	}

	// 로그인 체크 메소드
	public boolean loginCheck(HttpServletRequest request) {
		// 파라미터를 false 로 쓰는이유 -- HttpSession이 존재하면 현재 HttpSession을 반환하고 존재하지 않으면 새로 생성하지
		// 않고 그냥 null을 반환합니다.
		HttpSession session = request.getSession(false);
		if (session != null) {
			Client client = (Client) session.getAttribute("client");
			Biz biz = (Biz) session.getAttribute("biz");
			// client_id에 value 값이 있으면 false 를 return
			if (client != null) {
				System.out.println("현재 접속되어있는 client_id : " + client.getClient_id());
				return true;
			} else if (biz != null) {
				System.out.println("현재 접속되어있는 store_id :" + biz.getStore_id());
				return true;
			} else {
				System.out.println("현재 접속되어있는 id가 없음");
			}
		}
		return false;
	}

	// 주소 검색 시 미완성된 주소들을 온전한 주소로 변경
	@RequestMapping(value = "/addrCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public void addrCheck(HttpServletRequest request) {
		String addr = request.getParameter("addr");
		List<Search> checkAddr = searchService.checkAddr(addr);
		if (checkAddr != null) {
			for (int i = 0; i < checkAddr.size(); i++) {
				System.out.println(checkAddr.get(i).getStore_addr());
			}
		}
		for (int i = checkAddr.size() - 1; i > 5; i--) {
			checkAddr.remove(i);
		}
		request.getSession().setAttribute("getAddrList", checkAddr);
	}

}
