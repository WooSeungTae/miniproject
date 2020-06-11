package com.nike.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;


import com.nike.board.Boardqa_PagingVO;
import com.nike.board.QABoardDAO;
import com.nike.board.QABoardDTO;
import com.nike.board.ReviewDAO;
import com.nike.board.ReviewDTO;
import com.nike.order.OrderCare_PagingVO;

@Service
public class BoardService {
	@Autowired
	private QABoardDAO qdao;
	
	/*코드별 Q&A 조회*/
	public void qalist(Model model,Boardqa_PagingVO vo) {
		model.addAttribute("qalist", qdao.qalist(vo));
		model.addAttribute("pagingqa", vo);
	}
	
	/*코드별 Q&A 게시글 총 개수*/
	public int qatotal(String code) {
		return qdao.qatotal(code);
	}
	/*Q & A 게시판 전체 갯 수*/
	public int countqna() {	
		return qdao.countqna();
	}
	/*Q & A 게시판 전체 보기*/
	public List<QABoardDTO> selectqna(OrderCare_PagingVO vo) {
		return qdao.selectqna(vo);
	}
	
	
}
