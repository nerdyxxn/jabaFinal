package com.kh.jaba.biz.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaba.biz.board.model.dao.BizBoardDao;
import com.kh.jaba.biz.board.model.domain.BizBoard;

@Service
public class BizBoardServiceImpl implements BizBoardService {
	
	@Autowired
	private BizBoardDao bizBoardDao;
	
	@Autowired
	private BizBoard bb;
	
	@Override
	public List<BizBoard> selectBizBoardList(String store_id) {
		return bizBoardDao.selectBizBoardList(store_id);
	}

	@Override
	public int insertBizBoard(BizBoard bb) {
		return bizBoardDao.insertBizBoard(bb);
	}

	@Override
	public int deleteBizBoard(String board_no) {
		return bizBoardDao.deleteBizBoard(board_no);
	}

}
