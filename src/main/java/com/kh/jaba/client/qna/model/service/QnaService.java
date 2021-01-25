package com.kh.jaba.client.qna.model.service;

import java.util.List;

import com.kh.jaba.client.qna.model.domain.Qna;

public interface QnaService {

	public List<Qna> selectQnaList();

	public int insertQna(Qna q);

	public int deleteQna(String qna_no);

	public int updateQna(Qna q);

	public Qna selectQnaDetail(String qna_no);
}
