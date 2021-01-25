package com.kh.jaba.client.order.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaba.client.order.model.dao.OrderDao;
import com.kh.jaba.client.order.model.domain.Order;

@Service("orderService")
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDao orderDao;

	@Override
	public int insertOrder(Order o) {
		return orderDao.insertOrder(o);
	}

//  현재 order_id를 가져오는 메소드
	@Override
	public Order currentOrderId() {
		// TODO Auto-generated method stub
		return orderDao.currentOrderId();
	}

//  INSERT한 다음, 생성된 order_id로 OrderVO를 가져오는 메소드
	@Override
	public Order selectOneOrder(String order_id) {
		// TODO Auto-generated method stub
		return orderDao.selectOneOrder(order_id);
	}

}