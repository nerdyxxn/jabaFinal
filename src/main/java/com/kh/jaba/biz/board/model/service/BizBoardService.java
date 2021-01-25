package com.kh.jaba.biz.board.model.service;

import java.util.List;

import com.kh.jaba.biz.board.model.domain.BizBoard;

public interface BizBoardService {
	public List<BizBoard> selectBizBoardList(String store_id);

	public int insertBizBoard(BizBoard bb);

	public int deleteBizBoard(String board_no);

}
