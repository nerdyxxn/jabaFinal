package com.kh.jaba.client.qna.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaba.client.qna.model.domain.Qna;
import com.kh.jaba.client.qna.model.service.QnaService;

@Controller
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private Qna qna;
	
	@RequestMapping(value="qna/qnaList.do")
	public ModelAndView selectQnaList(HttpServletRequest request, ModelAndView mv) {
		
		List<Qna> qnaList = qnaService.selectQnaList();
		request.setAttribute("qnaList", qnaList);
		mv.setViewName("/qna/qna");
		return mv;
	}

}
