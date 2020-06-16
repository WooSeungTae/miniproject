package com.nike.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nike.board.CommentDAO;
import com.nike.board.CommentDTO;

@Service
public class CommentService {
	@Autowired
	private CommentDAO Cdao;
	
	
	/*댓글 등록*/
	public void replyregister(CommentDTO Cdto) {
		Cdao.commnetRegister(Cdto);
		
	}
	
	/*댓글 indexnum으로 조회*/
	public List<CommentDTO> searchComment(String indexnum){
		return Cdao.searchComment(indexnum);
		
		
	}
	
}