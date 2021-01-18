package com.kh.jaba.biz.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaba.biz.board.model.domain.BizBoard;
import com.kh.jaba.biz.board.model.service.BizBoardService;
import com.kh.jaba.biz.model.domain.Biz;
import com.kh.jaba.biz.model.service.BizService;
import com.kh.jaba.biz.order.domain.BizOrder;
import com.kh.jaba.biz.order.model.service.BizOrderService;
import com.kh.jaba.client.menu.model.domain.Menu;
import com.kh.jaba.client.menu.model.service.MenuService;
import com.kh.jaba.client.paysearch.model.domain.PaySearchCollection;
import com.kh.jaba.client.paysearch.model.service.PaySearchService;

@Controller
public class BizMainController {
	@Autowired
	private BizService bizService;
	
	@Autowired
	private Menu menu;
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private Biz biz;

	@Autowired
	private BizBoardService bizBoardService;
	
	@Autowired
	private PaySearchService paySearchService;
	
	@Autowired
	private BizOrderService bizOrderService;
	
	// 단지 Bizindex페이지를 띄워주는행동만 함
	@RequestMapping(value = "/biz/bizIndex.do", method = RequestMethod.GET)
	public ModelAndView index(ModelAndView mv, HttpServletRequest request) {
		//여기서 기존 biz의 세션값을 가져와야함.
		
		String store_id = null;
		String store_name = null;
		
		biz = (Biz)request.getSession().getAttribute("biz");
		if(biz != null) {
			request.getSession().setAttribute("storeVo", biz); // 찾아온 값을 menu.jsp로 넘겨주기위해 세션에 설정해줌
			store_id = biz.getStore_id();
			store_name = biz.getStore_name();
		}else {
			System.out.println("해당 biz의 정보를 불러오지 못했습니다.");
		}
		
		// store_id 를 바탕으로 해당 menu들을 가져와서 세션에 담기 
		List<List<Menu>> sortList = selectMenuListList(store_id);
		request.getSession().setAttribute("sortList", sortList);
		
		// 매장 게시판 관련
		store_id = biz.getStore_id();
		
		List<BizBoard> boardList = new ArrayList<BizBoard>();
		boardList = bizBoardService.selectBizBoardList(store_id);
		System.out.println("현재 공지사항 글 개수 : "+boardList.size());
		
		request.getSession().setAttribute("boardList", boardList);
		
		//매장 매출 조회 관련
		// 음... 이게 뭔지 잘모르겠어요 나중에 설명받을필요 있음
		// List<PaySearchCollection> salesList = paySearchService.getSalesList(store_name);
		// request.getSession().setAttribute("salesList", salesList);
		
		// bizMain jsp 파일 가져와야(혹은 생성) 하고 매장 open 스위치 관련 해결해야하고 js와 css 가져와야함
		// 
		mv.setViewName("biz/bizMain");
		return mv;
	}
	
	@RequestMapping(value = "/biz/bizOrderview.do", method = RequestMethod.GET)
	public ModelAndView bizOrderview(ModelAndView mv, HttpServletRequest request) {
		//여기서 기존 biz의 세션값을 가져와야함.
		
		String store_id = null;
		String store_name = null;
		
		biz = (Biz)request.getSession().getAttribute("biz");
		if(biz != null) {
			store_id = biz.getStore_id();
			store_name = biz.getStore_name();
		}else {
			System.out.println("해당 biz의 정보를 불러오지 못했습니다.");
		}
		
		// 매장 게시판 관련
		store_id = biz.getStore_id();
		
		List<BizBoard> boardList = bizBoardService.selectBizBoardList(store_id);
		System.out.println("현재 공지사항 글 개수 : " + boardList.size());
		
		request.getSession().setAttribute("boardList", boardList);
		
		// BizOrder 관련 ...
		List<BizOrder> bizOrderList = bizOrderService.orderViewList(store_name);
		request.getSession().setAttribute("bizOrderList", bizOrderList);
		for(int i=0; i<bizOrderList.size(); i++) {
			System.out.println("현재 있는 주문 : " + bizOrderList.get(i).getPay_id());
		}
		
		
		mv.setViewName("biz/bizOrderView");
		return mv;
	}

	@RequestMapping(value = "/biz/openClose.do", method = RequestMethod.GET)
	@ResponseBody
	public void openCloseDo(HttpServletRequest request) {
		// view 에서 변경할 status 상태를 받아옴
		int store_status = Integer.parseInt(request.getParameter("store_status"));
		biz = (Biz)request.getSession().getAttribute("biz");
		biz.setStore_status(store_status);
		
		// store_status 변경 
		int result = bizService.updateStoreStatus(biz);
		if(result != 1) {
			System.out.println("updateStoreStatus 실패 !");
		}
		if (store_status == 1) {
			System.out.println("매장 상태 변경 : OPEN");
		} else if (store_status == 2) {
			System.out.println("매장 상태 변경 : CLOSE");
		} else {
			System.out.println("매장 상태 변경 에러");
		}
		
	}
	
	// 메뉴 가능 상태 update 
	@RequestMapping(value = "/biz/soldOut.do", method = RequestMethod.GET)
	@ResponseBody
	public void menuSoldOutDo(HttpServletRequest request) {
		int menu_available = Integer.parseInt(request.getParameter("menu_available"));
		String menu_id = request.getParameter("menu_id");
		int result = 0;
		// menu_available 을 확인하고 1이면 2 , 2이면 1로 변경
		if(menu_available == 1) {
			menu_available = 2;
		}else {
			menu_available = 1;
		}
		menu.setMenu_id(menu_id);
		menu.setMenu_available(menu_available);
		result = menuService.updateMenuAvailable(menu);
		if(result == 1) {
			if(menu_available == 2) {
				System.out.println(menu_id + "의 MenuAvailable 변경 : 품절" );
			}else {
				System.out.println(menu_id + "의 MenuAvailable 변경 : 재고있음" );
			}
		}else {
			System.out.println("MenuAvailable 변경 실패");
		}
	}
	
	// 메뉴를 불러와서 카테고리 별로 메뉴들을 분류
	public List<List<Menu>> selectMenuListList(String store_id) {
		List<List<Menu>> sortList = null;

		List<Menu> categoryList = menuService.selectCategoryList(store_id);
		// 카테고리 로딩이 계속됨 why? 
		
		// sortList 객체 생성
		sortList = new ArrayList<List<Menu>>();
		// 사이즈 categoryList 만큼 반복
		for (int i = 0; i < categoryList.size(); i++) {
			// menu autowired
			menu.setMenu_category(categoryList.get(i).getMenu_category());
			menu.setStore_id(categoryList.get(i).getStore_id());
			List<Menu> list = menuService.selectListByCategory(menu); // 여기서 param 을 m으로 보내줘야하는데
			sortList.add(list);
		}
		return sortList;
	}
	

}
