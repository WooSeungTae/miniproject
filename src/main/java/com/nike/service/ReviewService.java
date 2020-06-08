package com.nike.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nike.board.ReviewDAO;
import com.nike.board.ReviewDTO;

@Service
public class ReviewService {
	@Autowired
	private ReviewDAO rdao;
	
	//리뷰 저장
	public void review_save(ReviewDTO rdto) {
		rdao.review_save(rdto);
		
	}
}
