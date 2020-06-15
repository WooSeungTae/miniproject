package com.nike.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	public List<QABoardDTO> qalist(Board_PagingVO vo) {
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
	public List<QABoardDTO> selectqna(Board_PagingVO vo) {
		return sqlSession.selectList(namespace+".selectqna",vo);
	}
	/*Q & A 게시판 전체 보기*/
	public List<QABoardDTO> selectqna1(OrderCare_PagingVO vo) {
		return sqlSession.selectList(namespace+".selectqna",vo);
	}
	/*Q&A 관리자 페이지 삭제*/
	public void QnA_board_care_delete(String indexnum) {
		sqlSession.delete(namespace+".QnA_board_care_delete",indexnum);
		
	}
	/*Q&A 게시판 검색*/
	public List<QABoardDTO> searchQnA(OrderCare_PagingVO dto) {
		return sqlSession.selectList(namespace+".searchQnA",dto);
	}
	/*Q&A 게시판 검색 갯수*/
	public int searchQnAcount(SearchBoardDTO searchdto) {
		return sqlSession.selectOne(namespace+".searchQnAcount",searchdto);
	}
	
	/*Q&A 게시물 상세보기*/
	public QABoardDTO qnaview(String indexnum) {
		return sqlSession.selectOne(namespace+".qnaview",indexnum);
	}
	
	/*Q&A 게시물 등록*/
	public void qaregister(QABoardDTO Qdto) {
		sqlSession.insert(namespace+".qaregister",Qdto);
		
	}
	
	/*Q&A 게시물 수정*/
	public void qaupdate(QABoardDTO Qdto) {
		sqlSession.update(namespace+".qaupdate",Qdto);
	}
	
	/*Q&A 게시물 삭제*/
	public void qadelete(QABoardDTO Qdto) {
		sqlSession.delete(namespace+".qadelete",Qdto);
	}
	
}
