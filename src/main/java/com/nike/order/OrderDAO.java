package com.nike.order;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class OrderDAO {
	private static final String namespace = "com.care.mybatis.orderMapper.orderMapper";
	@Autowired
	private SqlSession sqlSession;
	
	public void buyRegister(OrderDTO Odto) {
		sqlSession.insert(namespace+".buyRegister",Odto);
	}

	public int countOrder() {
		return sqlSession.selectOne(namespace+".countorder");
	}

	public List<OrderDTO> selectOrder(OrderCare_PagingVO vo) {
		return sqlSession.selectList(namespace+".selectorber",vo);
	}

	public void deliveryChange(OrderDTO Odto) {
		sqlSession.update(namespace+".deliveryChange",Odto);
	}

	public OrderDTO orderserch(String id) {
		return sqlSession.selectOne(namespace+".orderserch",id);
	}
	
}
