package com.nike.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nike.order.OrderDAO;
import com.nike.order.ShoppingCartDTO;

@Service
public class OrderService {
	
	@Autowired
	OrderDAO odao;
	
	/*장바구니 DB에 값을 저장*/
	public void insertcart(ShoppingCartDTO sdto) {
		odao.insertcart(sdto);
	}
	
	/*장바구니 DB에서 회원별 리스트 가져오기*/
	public List<ShoppingCartDTO> selectcart(String id) {
		return odao.selectcart(id);
	}
	
	/*장바구니 DB에서 리스트 개수 가져오기*/
	public int countcart(String id) {
		return odao.countcart(id);
	}
	
	/*회원별 장바구니에 있는 아이템 전부 삭제*/
	public void cartAlldelete(String id) {
		odao.cartAlldelete(id);
	}

	
}
