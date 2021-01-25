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

	public List<Qna> selectQnaList() {
		return sqlSession.selectList("Qna.selectQnaList");
	}

	public int insertQna(Qna q) {
		return sqlSession.insert("Qna.insertQna", q);
	}

	public int deleteQna(String qna_no) {
		return sqlSession.delete("Qna.deleteQna", qna_no);
	}

	public int updateQna(Qna q) {
		return sqlSession.update("Qna.updateQna", q);
	}

	public Qna selectQnaDetail(String qna_no) {
		return sqlSession.selectOne("Qna.selectQnaDetail", qna_no);
	}

}
