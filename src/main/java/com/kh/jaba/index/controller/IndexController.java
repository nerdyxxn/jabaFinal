package com.kh.jaba.index.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaba.client.model.domain.Client;

@Controller
public class IndexController {
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
//		기존에 만들었을 때에는 현재 로그인상태를 확인하기위해서 첨에 페이지 로드됐을때 
//		기존에 했을때는 서블릿에서 out.print ? 여기에 KeepLogin 이라는 정보를 보내서 체크를 했어요 ..KeepLogin 
		if (loginCheck(request)) {
			// client_id가 있다는 소리
			// 뭔가 처리를 해줘야하는데 ...................
			out.print("KeepLogin");
		}else {
			System.out.println("KeepLogin 없음");
		}
		out.flush();
		out.close();
	}

	public boolean loginCheck(HttpServletRequest request) {
		// 파라미터를 false 로 쓰는이유 -- HttpSession이 존재하면 현재 HttpSession을 반환하고 존재하지 않으면 새로 생성하지
		// 않고 그냥 null을 반환합니다.
		HttpSession session = request.getSession(false);
		if (session != null) {
			Client client  = (Client)session.getAttribute("client");
			
			// client_id에 value 값이 있으면 false 를 return
			if (client != null) {
				System.out.println("현재 접속되어있는 client_id : " + client.getClient_id());
				return true;
			} else {
				System.out.println("현재 접속되어있는 client_id가 없음");
			}
		}
		return false;
	}

}
