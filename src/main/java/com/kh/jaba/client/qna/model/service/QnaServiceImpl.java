package com.kh.jaba.client.qna.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaba.client.qna.model.dao.QnaDao;
import com.kh.jaba.client.qna.model.domain.Qna;

@Service("qnaService")
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaDao qnaDao;
	
	@Override
	public List<Qna> selectQnaList() {
		return qnaDao.selectQnaList();
	}

	@Override
	public int insertQna(Qna q) {
		return qnaDao.insertQna(q);
	}

	@Override
	public int deleteQna(String qna_no) {
		return qnaDao.deleteQna(qna_no);
	}

	@Override
	public int updateQna(Qna q) {
		return qnaDao.updateQna(q);
	}

	@Override
	public Qna selectQnaDetail(String qna_no) {
		return qnaDao.selectQnaDetail(qna_no);
	}

}
