package com.kh.jaba.client.order.model.service;

import java.util.List;

import com.kh.jaba.client.order.model.domain.CustomCheck;

public interface CustomCheckService {
	public int insertCustomCheck(CustomCheck cc);

	public List<CustomCheck> selectCustomCheckListByOrderId(String order_id);

}
