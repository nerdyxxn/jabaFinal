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
	
	// 전체 매장 매출 조회
	public List<BizSales> selectAllBizSales(){
		return sqlSession.selectList("BizSales.selectAllBizSales");
	}
	
}
