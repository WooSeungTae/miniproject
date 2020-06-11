package com.nike.board;

import java.util.List;

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
		
	//마이페이지 나의 리뷰 보여주기
	public List<ReviewDTO> review_list(String id) {
		return sqlSession.selectList(namespace+".review_list", id);
	}
	
	//마이페이지 나의 리뷰 수정하기, 삭제하기 하기 위한 폼
	public ReviewDTO reviewitem(ReviewDTO rdto) {
		return sqlSession.selectOne(namespace+".reviewitem", rdto);
	}
	
	//마이페이지 나의 리뷰 삭제하기
	public void reviewdelete(ReviewDTO rdto) {
		sqlSession.delete(namespace+".reviewdelete", rdto);
	}
	
	//마이페이지 나의 리뷰 수정하기
	public void reviewmodify(ReviewDTO rdto) {
		sqlSession.update(namespace+".reviewmodify", rdto);
	}
	
	//남이 나의 리뷰를 볼 때
	public ReviewDTO reviewsearch(int reviewnum) {
		return sqlSession.selectOne(namespace+".reviewsearch", reviewnum);
	}
}
