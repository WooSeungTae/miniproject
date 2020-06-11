package com.nike.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nike.order.OrderCare_PagingVO;

@Repository
public class QABoardDAO {
	private final String namespace = "com.care.mybatis.boardMapper.qaboardMapper";
	@Autowired
	private SqlSession sqlSession;
	
	/*코드별 Q&A 리스트 조회*/
	public List<QABoardDTO> qalist(Boardqa_PagingVO vo) {
		return sqlSession.selectList(namespace+".qalist",vo);
	}
	
	/*코드별 Q&A리스트 총 개수*/
	public int qatotal(String code) {
		return sqlSession.selectOne(namespace+".qatotal",code);
	}
	/*Q & A 게시판 전체 갯 수*/
	public int countqna() {
		return sqlSession.selectOne(namespace+".countqna");
	}
	/*Q & A 게시판 전체 보기*/
	public List<QABoardDTO> selectqna(OrderCare_PagingVO vo) {
		return sqlSession.selectList(namespace+".selectqna",vo);
	}
	
	
}
