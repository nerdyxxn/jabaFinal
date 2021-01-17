package com.kh.jaba.biz.order.model.service;

import java.util.List;

import com.kh.jaba.biz.order.domain.BizOrder;

public interface BizOrderService {
	public List<BizOrder> orderViewList(String store_name);

}
