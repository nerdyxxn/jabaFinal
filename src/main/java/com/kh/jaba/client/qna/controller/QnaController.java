package com.kh.jaba.client.qna.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaba.client.model.domain.Client;
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
	
	@RequestMapping(value="admin/qna/qnaList.do")
	public ModelAndView selectQna(HttpServletRequest request, ModelAndView mv) {

		List<Qna> qnaList = qnaService.selectQnaList();
		request.setAttribute("qnaList", qnaList);
		mv.setViewName("/admin/adminQna");
		return mv;
	}
	
	@RequestMapping(value="admin/qna/qnaDetail.do")
	public ModelAndView qnaDetail(HttpServletRequest request, ModelAndView mv, Qna q) {
		String qna_no = request.getParameter("qna_no");
		//Detail로 들어가는 쿼리문
		Qna qnaDetail = qnaService.selectQnaDetail(qna_no);
		request.setAttribute("qnaDetail", qnaDetail);
		
		mv.setViewName("/admin/adminQnaDetail");
		return mv;
	}
	
	 // Q&A insert 페이지 진입
	@RequestMapping(value="admin/qna/writeQna.do", method = RequestMethod.GET)
	public ModelAndView writeQna(HttpServletRequest request, ModelAndView mv) {
		mv.setViewName("/admin/adminQnaWrite");
		return mv;
	};
	// Q&A insert 결과
	@RequestMapping(value="admin/qna/insertQna.do", method = RequestMethod.POST)
	public ModelAndView insertQna(HttpServletRequest request, ModelAndView mv, Qna q) {
		String qna_title = request.getParameter("title");
		String qna_content = request.getParameter("content");
		q.setQna_title(qna_title);
		q.setQna_content(qna_content);
		int result = qnaService.insertQna(q);
		if(result==1) {
			System.out.println("Q&A 글 작성 성공");
			
		} else {
			System.out.println("글 작성 실패");
			
		}
		List<Qna> qnaList = qnaService.selectQnaList();
		request.setAttribute("qnaList", qnaList);
		mv.setViewName("/admin/adminQna");
		return mv;
	};
	
	
	 // Q&A update 페이지
	@RequestMapping(value = "admin/qna/updateQnaDetail.do", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView updateQnaDetail(HttpServletRequest request, Qna q, ModelAndView mv) {
		String qna_no = request.getParameter("qna_no");
		//Detail로 들어가는 쿼리문
		Qna qnaDetail = qnaService.selectQnaDetail(qna_no);
		request.getSession().setAttribute("qnaDetail", qnaDetail);
		
		mv.setViewName("/admin/adminQnaUpdate");
		return mv;
	 }
	// Q&A update 페이지
	@RequestMapping(value = "admin/qna/updateQna.do", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView updateQna(HttpServletRequest request, Qna q, ModelAndView mv) {
		Qna qnaDetail = (Qna) request.getSession().getAttribute("qnaDetail");
		System.out.println(qnaDetail);
		String qna_no = qnaDetail.getQna_no();
		String qna_title = request.getParameter("title");
		String qna_content = request.getParameter("content");
		System.out.println("qna_no : "+ qna_no);
		System.out.println("qna_title : "+ qna_title);
		System.out.println("qna_content : "+ qna_content);
		qnaDetail.setQna_no(qna_no);
		qnaDetail.setQna_title(qna_title);
		qnaDetail.setQna_content(qna_content);
		System.out.println(qnaDetail);
		int result = qnaService.updateQna(qnaDetail);
		if(result == 1) {
			System.out.println(q.getQna_no() + "번 Q&A가 수정되었습니다.");
			request.getSession().setAttribute("qnaDetail", qnaDetail);
		}else {
			System.out.println("Q&A 수정 실패");
		}
		//Detail로 들어가는 쿼리문
		mv.setViewName("/admin/adminQnaDetail");
		return mv;
	}
	
	 // Q&A delete
	@RequestMapping(value = "admin/qna/deleteQna.do", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView deleteQna(HttpServletRequest request, String qna_no, ModelAndView mv) {
		qna_no = request.getParameter("qna_no");
		int result = qnaService.deleteQna(qna_no);
		if(result == 1) {
			System.out.println(qna_no + "번 Q&A가 삭제되었습니다.");
		} else {
			System.out.println("Q&A 삭제 실패");
		}
		List<Qna> qnaList = qnaService.selectQnaList();
		request.setAttribute("qnaList", qnaList);
		mv.setViewName("/admin/adminQna");
		return mv;
	}

}
