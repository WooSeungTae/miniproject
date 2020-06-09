package com.nike.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QABoardDAO {
	private final String namepace = "com.care.mybatis.boardMapper.qaboardMapper";
	@Autowired
	private SqlSession sqlSession;
	
	
	public List<QABoardDTO> qalist(String code) {
		return sqlSession.selectList(namepace+".qalist",code);
	}
	
	
}
