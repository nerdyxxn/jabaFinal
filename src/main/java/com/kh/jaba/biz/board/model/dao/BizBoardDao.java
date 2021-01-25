package com.kh.jaba.biz.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jaba.biz.board.model.domain.BizBoard;

@Repository("bizBoardDao")
public class BizBoardDao {

	@Autowired
	private SqlSession sqlSession;

	public List<BizBoard> selectBizBoardList(String store_id) {
		return sqlSession.selectList("BizBoard.selectBizBoardList", store_id);
	}

	public int insertBizBoard(BizBoard bb) {
		return sqlSession.insert("BizBoard.insertBizBoard", bb);
	}

	public int deleteBizBoard(String board_no) {
		return sqlSession.delete("BizBoard.deleteBizBoard", board_no);
	}

}
