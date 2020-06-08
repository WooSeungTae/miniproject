package com.nike.board;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAO {
	
	private static final String namespace = "com.care.mybatis.boardMapper.reviewMapper";
	@Autowired
	private SqlSession sqlSession;
	
	//리뷰 저장
	public void review_save(ReviewDTO rdto) {
		sqlSession.insert(namespace+".reviewsave", rdto);
	}
}
