package com.kh.jaba.index.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

	// 로그인 체크 메소드
	public boolean loginCheck(HttpServletRequest request) {
		// 파라미터를 false 로 쓰는이유 -- HttpSession이 존재하면 현재 HttpSession을 반환하고 존재하지 않으면 새로 생성하지
		// 않고 그냥 null을 반환합니다.
		HttpSession session = request.getSession(false);
		if (session != null) {
			Client client  = (Client)session.getAttribute("client");
			Biz biz = (Biz)session.getAttribute("biz");
			// client_id에 value 값이 있으면 false 를 return
			if (client != null) {
				System.out.println("현재 접속되어있는 client_id : " + client.getClient_id());
				return true;
			} else if (biz != null){
				System.out.println("현재 접속되어있는 store_id :" + biz.getStore_id());
				return true;
			} else {
				System.out.println("현재 접속되어있는 id가 없음");
			}
		}
		return false;
	}
	
	// 주소 검색 시 미완성된 주소들을 온전한 주소로 변경 
	// 이루어져야할 것들 > search버튼 클릭시 event 발생 (최초 이벤트)
	// 그 이벤트는 > dropdown으로 '유사' 주소들이 리스트로 출력
	// 그럼 이 리스트들은?
	// 실제 db에 들어가 있는 매장들의 주소 중 "서울시 종로구 ~동"까지 추출해서 출력 > 해당 주소에 매장이 없다는 오류 페이지를 만들 필요도 없다. 대신 dropdown은 만들어야할듯? - 검색
	// 어떻게 db에 있는 주소를 일부만 발췌해서 가져올 것인가?
	// select substr(store_addr, 1, 12) from store like '%'||'#{store_addr}'||'%' 
	// 
	@RequestMapping(value = "/addrCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public void addrCheck(HttpServletRequest request) {
		String addr = request.getParameter("addr");
		// 요거 될 지, 안 될 지 모르겠다,,,,,,,,
		// 참고한 블로그는 param을 model로 불러서 model.addAttribute로 넣었는데, 우리는 하던 대로 진행
		List<Search> checkAddr = searchService.checkAddr(addr);
		if(checkAddr != null) {
			for(int i=0; i<checkAddr.size();i++) {
				System.out.println(checkAddr.get(i).getStore_addr());
			}
		}
		request.getSession().setAttribute("getAddrList", checkAddr);
	}

}
