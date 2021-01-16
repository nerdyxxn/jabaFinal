package com.kh.jaba.biz.sales.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaba.biz.board.model.domain.BizBoard;
import com.kh.jaba.biz.model.domain.Biz;
import com.kh.jaba.biz.sales.model.domain.BizSales;
import com.kh.jaba.biz.sales.model.service.BizSalesService;
import com.kh.jaba.client.menu.model.domain.Menu;
import com.kh.jaba.client.paysearch.model.domain.PaySearchCollection;

@Controller
public class BizSalesController {
	@Autowired
	private BizSalesService bizSalesService;
	
	
	//판매액 조회로 이동
		@RequestMapping(value = "/biz/bizSalesView.do", method = RequestMethod.GET)
		public ModelAndView salesView(ModelAndView mv, HttpServletRequest request) {
			String store_name = null;
			//필요한 날짜를 가지고 들어오는데,,,
			
			Biz biz = (Biz)request.getSession().getAttribute("biz");
			if(biz != null) {
				request.getSession().setAttribute("storeVo", biz); // 찾아온 값을 menu.jsp로 넘겨주기위해 세션에 설정해줌
				store_name = biz.getStore_name();
			}else {
				System.out.println("해당 biz의 정보를 불러오지 못했습니다.");
			}
			
			// 매출액 조회 관련
			BizSales bs = null;
			store_name = biz.getStore_name();
			bs.setStore_name(store_name);
			
			
			List<BizSales> bizSalesList = new ArrayList<BizSales>();
			bizSalesList = bizSalesService.getBizSales(bs);
			
			request.getSession().setAttribute("bizSalesList", bizSalesList);
			
			// bizMain jsp 파일 가져와야(혹은 생성) 하고 매장 open 스위치 관련 해결해야하고 js와 css 가져와야함
			mv.setViewName("biz/bizSalesView");
			return mv;
		}
}
