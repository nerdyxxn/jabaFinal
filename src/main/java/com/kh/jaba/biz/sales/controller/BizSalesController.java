package com.kh.jaba.biz.sales.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaba.biz.model.domain.Biz;
import com.kh.jaba.biz.sales.model.domain.BizSales;
import com.kh.jaba.biz.sales.model.service.BizSalesService;

@Controller
public class BizSalesController {
	@Autowired
	private BizSalesService bizSalesService;

	@Autowired
	private BizSales bs;

	// 판매액 조회로 이동
	@RequestMapping(value = "/biz/bizSalesView.do", method = RequestMethod.GET)
	public ModelAndView salesView(ModelAndView mv, HttpServletRequest request) {
		String store_name = null;
		// 필요한 날짜를 가지고 들어오는데,,,

		Biz biz = (Biz) request.getSession().getAttribute("biz");
		if (biz != null) {
			request.getSession().setAttribute("storeVo", biz); // 찾아온 값을 menu.jsp로 넘겨주기위해 세션에 설정해줌
			store_name = biz.getStore_name();

			// 매출액 조회 관련
			bs.setStore_name(store_name);
			List<BizSales> bizSalesList = bizSalesService.getBizSales(bs);

			for (int i = 0; i < bizSalesList.size(); i++) {
				System.out.println(
						bizSalesList.get(i).getPay_time() + " 매출 : " + bizSalesList.get(i).getPay_total_price());
			}
			request.getSession().setAttribute("bizSalesList", bizSalesList);
		} else {
			System.out.println("해당 biz의 정보를 불러오지 못했습니다.");
		}

		mv.setViewName("biz/bizSalesView");
		return mv;
	}
}
