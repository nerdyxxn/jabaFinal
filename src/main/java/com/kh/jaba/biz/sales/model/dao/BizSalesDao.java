package com.kh.jaba.biz.sales.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jaba.biz.sales.model.domain.BizSales;

@Repository("bizSalesDao")
public class BizSalesDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<BizSales> getBizSales(BizSales bs){
		return sqlSession.selectList("BizSales.getBizSales", bs);
		
	}
}
