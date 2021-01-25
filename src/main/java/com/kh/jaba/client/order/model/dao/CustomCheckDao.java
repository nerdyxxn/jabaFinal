package com.kh.jaba.client.order.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jaba.client.order.model.domain.CustomCheck;

@Repository("customCheckDao")
public class CustomCheckDao {

	@Autowired
	private SqlSession sqlSession;

	public int insertCustomCheck(CustomCheck cc) {
		return sqlSession.insert("CustomCheck.insertCustomCheck", cc);
	}

	public List<CustomCheck> selectCustomCheckListByOrderId(String order_id) {
		return sqlSession.selectList("CustomCheck.selectCustomCheckListByOrderId", order_id);
	}

}
