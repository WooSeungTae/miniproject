package com.nike.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nike.board.QABoardDAO;
import com.nike.board.QABoardDTO;

@Service
public class BoardService {
	@Autowired
	private QABoardDAO qdao;
	
	public List<QABoardDTO> qalist(String code) {
		System.out.println("인덱스 번호  : "+qdao.qalist(code).get(2).getIndexnum());
		return qdao.qalist(code);
		
	}
}
