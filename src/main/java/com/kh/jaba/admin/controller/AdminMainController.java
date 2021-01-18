package com.kh.jaba.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaba.biz.model.service.BizService;
import com.kh.jaba.biz.sales.model.domain.BizSales;
import com.kh.jaba.biz.sales.model.service.BizSalesService;
import com.kh.jaba.client.model.service.ClientService;

@Controller
public class AdminMainController {

	@Autowired
	private BizSalesService bizSalesService;
	
	@Autowired
	private BizService bizService;
	
	@Autowired
	private ClientService clientService;

	@RequestMapping(value = "admin/adminMain.do", method = RequestMethod.GET)
	public ModelAndView adminMain(ModelAndView mv, HttpServletRequest request) {
		int countTotalClient = 0;
		int countTotalBiz = 0;
		// 여기서 admin이 가진 정보들을 모두 가져와야 한다.
		
		// 전체 매장 매출 조회
		List<BizSales> bizSalesList = bizSalesService.selectAllBizSales();
		for(int i=0; i<bizSalesList.size(); i++) {
			System.out.println("날짜 : " + bizSalesList.get(i).getPay_time() + "  총매출 : " + bizSalesList.get(i).getPay_total_price());
		}
		request.getSession().setAttribute("bizSalesList", bizSalesList);
		
		
		// 전체 이용자수 조회
		countTotalClient = clientService.countTotalClient();
		// 전체 매장수 조회
		countTotalBiz = bizService.countTotalBiz();
		System.out.println("이용자수 : " + countTotalClient + " 전체 매장수 : " + countTotalBiz);
		
		request.getSession().setAttribute("countTotalClient", countTotalClient);
		request.getSession().setAttribute("countTotalBiz", countTotalBiz);
		

		mv.setViewName("admin/adminMain");
		return mv;
	}

}
