package com.kh.jaba.biz.sales.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaba.biz.sales.model.dao.BizSalesDao;
import com.kh.jaba.biz.sales.model.domain.BizSales;

@Service("bizSalesService")
public class BizSalesServiceImpl implements BizSalesService {
	
	@Autowired
	private BizSalesDao bizSalesDao;
	
	@Override
	public List<BizSales> getBizSales(BizSales bs) {
		return bizSalesDao.getBizSales(bs);
	}

}
