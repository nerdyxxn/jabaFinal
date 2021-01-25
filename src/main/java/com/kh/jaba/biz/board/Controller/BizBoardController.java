package com.kh.jaba.biz.board.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.jaba.biz.board.model.domain.BizBoard;
import com.kh.jaba.biz.board.model.service.BizBoardService;
import com.kh.jaba.biz.model.domain.Biz;

@Controller
public class BizBoardController {

	@Autowired
	private BizBoardService bizBoardService;

	@Autowired
	private BizBoard bb;

	@RequestMapping(value = "/biz/board/insertBizBoard.do", method = RequestMethod.POST)
	public void insertBizBoard(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int result = 0;
		PrintWriter out = response.getWriter();
		String store_board_title = (String) request.getParameter("store_board_title");
		bb.setStore_board_title(store_board_title);
		Biz biz = (Biz) request.getSession().getAttribute("biz");
		String store_id = biz.getStore_id();
		bb.setStore_id(store_id);
		if (bb != null) {
			result = bizBoardService.insertBizBoard(bb);
		}
		if (result == 1) {
			System.out.println("board 삽입 성공");
			out.print("insertSuccess");
		} else {
			System.out.println("board 삽입 실패");
			out.print("insertFail");
		}

		out.flush();
		out.close();

	}

	@RequestMapping(value = "/biz/board/deleteBizBoard.do", method = RequestMethod.POST)
	public void deleteBizBoard(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String board_no = null;
		int result = 0;
		PrintWriter out = response.getWriter();
		board_no = request.getParameter("board_no");
		if (board_no != null) {
			result = bizBoardService.deleteBizBoard(board_no);
		}
		if (result == 1) {
			System.out.println("board 삭제 성공");
			out.print("deleteSuccess");
		} else {
			System.out.println("board 삭제 실패");
			out.print("deleteFail");
		}

		out.flush();
		out.close();
	}

}
