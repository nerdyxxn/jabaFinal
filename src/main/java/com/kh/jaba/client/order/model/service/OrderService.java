package com.kh.jaba.client.order.model.service;

import com.kh.jaba.client.order.model.domain.Order;

public interface OrderService {
   
   public int insertOrder(Order o);
   
// 현재 order_id를 가져오는 메소드
	public Order currentOrderId();

// INSERT한 다음, 생성된 order_id로 OrderVO를 가져오는 메소드
	public Order selectOneOrder(String order_id);

}