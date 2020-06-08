package com.nike.board;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAO {
	
	private static final String namespace = "com.care.mybatis.boardMapper.reviewMapper";
	@Autowired
	private SqlSession sqlSession;
}
