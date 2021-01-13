package com.kh.jaba.client.qna.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jaba.client.qna.model.domain.Qna;

@Repository("qnaDao")
public class QnaDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<Qna> selectQnaList(){
		return sqlSession.selectList("Qna.selectQnaList");
	}

}
