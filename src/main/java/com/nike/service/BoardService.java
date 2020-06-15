package com.nike.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.protocol.HTTP;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.nike.board.Board_PagingVO;
import com.nike.board.QABoardDAO;
import com.nike.board.QABoardDTO;
import com.nike.board.ReviewDAO;
import com.nike.board.ReviewDTO;
import com.nike.board.SearchBoardDTO;
import com.nike.order.OrderCare_PagingVO;

@Service
public class BoardService {
	@Autowired
	private QABoardDAO qdao;
	
	/*Q&A 게시물 수정*/
	public void qaupdate(QABoardDTO Qdto) {
		qdao.qaupdate(Qdto);
	}
	
	/*Q&A 게시물 삭제*/
	public void qadelete(QABoardDTO Qdto) {
		qdao.qadelete(Qdto);
	}
	
	/*Q&A 게시물 등록*/
	public void qaregister(QABoardDTO Qdto) {
		qdao.qaregister(Qdto);
	}
	/*Q&A 게시물 상세보기*/
	public void qnaview(Model model, String indexnum) {
		model.addAttribute("qnaview", qdao.qnaview(indexnum));
	}
	
	
	/*코드별 Q&A 게시물 리턴*/
	public List<QABoardDTO> qalist(Board_PagingVO vo) {
		return qdao.qalist(vo);
	}
	
	/*코드별 Q&A 게시물 조회*/
	public void qalist(Model model,Board_PagingVO vo) {
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

	/*Q&A 관리자 페이지 삭제*/
	public void QnA_board_care_delete(String indexnum) {
		qdao.QnA_board_care_delete(indexnum);
	}
	/*Q&A 게시판 검색*/
	public List<QABoardDTO> searchQnA(OrderCare_PagingVO dto) {
		return qdao.searchQnA(dto);
	}
	/*Q&A 게시판 검색 갯수*/
	public int searchQnAcount(SearchBoardDTO searchdto) {
		return qdao.searchQnAcount(searchdto);
	}
	
	
}
