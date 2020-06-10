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
	
	/*코드별 Q&A 리스트 조회*/
	public List<QABoardDTO> qalist(Boardqa_PagingVO vo) {
		return sqlSession.selectList(namepace+".qalist",vo);
	}
	
	/*코드별 Q&A리스트 총 개수*/
	public int qatotal(String code) {
		return sqlSession.selectOne(namepace+".qatotal",code);
	}
	
	
}
