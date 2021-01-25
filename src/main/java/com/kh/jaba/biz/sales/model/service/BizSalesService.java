package com.kh.jaba.biz.sales.model.service;

import java.util.List;

import com.kh.jaba.biz.sales.model.domain.BizSales;

public interface BizSalesService {
	public List<BizSales> getBizSales(BizSales bs);

	// 전체 매장 매출 조회
	public List<BizSales> selectAllBizSales();
}
