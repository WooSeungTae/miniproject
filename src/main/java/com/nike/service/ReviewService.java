package com.nike.service;

import java.util.List;

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
	
	//마이페이지 나의 리뷰 보여주기
	public List<ReviewDTO> review_list(String id) {
		return rdao.review_list(id);
	}
	
	//마이페이지 나의 리뷰 수정하기, 삭제하기 하기 위한 폼
	public ReviewDTO reviewitem(ReviewDTO rdto) {
		return rdao.reviewitem(rdto);
	}
	
	//마이페이지 나의 리뷰 삭제하기
	public void reviewdelete(ReviewDTO rdto) {
		rdao.reviewdelete(rdto);
		
	}
	
	//마이페이지 나의 리뷰 수정하기
	public void reviewmodify(ReviewDTO rdto) {
		rdao.reviewmodify(rdto);
	}
}
